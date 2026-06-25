#!/bin/bash

echo -e "\033[1;34m"
echo "=============================="
echo "   URL-Recon-Automation"
echo "=============================="
echo -e "\033[0m"

for tool in gau waybackurls katana httpx gf; do
    command -v "$tool" >/dev/null 2>&1 || {
        echo "[-] '$tool' not found. Verify installation or ensure \$HOME/go/bin is in PATH."
        exit 1
    }
done

[ -z "$1" ] && echo "Usage: $0 example.com" && exit 1

d=$1

out="recon_$d"

mkdir -p "$out/input"
mkdir -p "$out/gf"

echo "[+] Running gau..."
echo "$d" | gau > "$out/input/gau.txt"

echo "[+] Running waybackurls..."
echo "$d" | waybackurls > "$out/input/wayback.txt"

echo "[+] Running katana..."
katana -u "https://$d" -silent -depth 2 > "$out/input/katana.txt"

echo "[+] Merging URLs..."
cat \
"$out/input/gau.txt" \
"$out/input/wayback.txt" \
"$out/input/katana.txt" \
| sort -u > "$out/input/all.txt"

echo "[+] Running httpx..."
httpx -l "$out/input/all.txt" \
-silent \
-mc 200 \
-random-agent \
> "$out/input/live.txt"

echo "[+] Running gf patterns..."

gf sqli < "$out/input/live.txt" > "$out/gf/sqli.txt"
gf xss < "$out/input/live.txt" > "$out/gf/xss.txt"
gf lfi < "$out/input/live.txt" > "$out/gf/lfi.txt"
gf redirect < "$out/input/live.txt" > "$out/gf/redirect.txt"
gf ssrf < "$out/input/live.txt" > "$out/gf/ssrf.txt"
gf rce < "$out/input/live.txt" > "$out/gf/rce.txt"
gf idor < "$out/input/live.txt" > "$out/gf/idor.txt"
gf ssti < "$out/input/live.txt" > "$out/gf/ssti.txt"


echo
echo "[+] DONE"
echo "[+] Output Folder : $out"
