#!/bin/bash

install_tool () {
    if ! command -v $1 >/dev/null 2>&1; then
        echo "[+] Installing $1..."
        go install $2
        sudo cp ~/go/bin/$1 /usr/local/bin/
    else
        echo "[=] $1 already installed, skipping..."
    fi
}

install_tool gau "github.com/lc/gau/v2/cmd/gau@latest"
install_tool waybackurls "github.com/tomnomnom/waybackurls@latest"
install_tool katana "github.com/projectdiscovery/katana/cmd/katana@latest"
install_tool httpx "github.com/projectdiscovery/httpx/cmd/httpx@latest"
install_tool gf "github.com/tomnomnom/gf@latest"

echo "[+] Setting up GF patterns..."

mkdir -p ~/.gf

if [ ! -d "/tmp/Gf-Patterns" ]; then
    git clone https://github.com/1ndianl33t/Gf-Patterns.git /tmp/Gf-Patterns
fi

cp /tmp/Gf-Patterns/*.json ~/.gf/ 2>/dev/null

echo "[+] Installation Completed"
