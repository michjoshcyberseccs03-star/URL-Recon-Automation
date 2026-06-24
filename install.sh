#!/bin/bash
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/tomnomnom/gf@latest
sudo cp ~/go/bin/gau /usr/local/bin/
sudo cp ~/go/bin/waybackurls /usr/local/bin/
sudo cp ~/go/bin/katana /usr/local/bin/
sudo cp ~/go/bin/httpx /usr/local/bin/
sudo cp ~/go/bin/gf /usr/local/bin/
mkdir -p ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns.git /tmp/Gf-Patterns 2>/dev/null
cp /tmp/Gf-Patterns/*.json ~/.gf/ 2>/dev/null
echo "[+] Installation Completed"
