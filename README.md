# 🎯 URL Recon Automation Tool

A simple reconnaissance automation script for collecting and filtering URLs from multiple sources.

It combines URL discovery, crawling, live URL validation, and vulnerability pattern matching into a single workflow. The tool helps security researchers quickly gather recon data and organize potential attack surfaces.

## 🔧 Tools Used

### gau

* Collects historical and indexed URLs from multiple public sources.

### waybackurls

* Retrieves archived URLs from the Wayback Machine.

### katana

* Crawls the target website and discovers additional URLs and endpoints.

### httpx

* Filters and validates live URLs by sending HTTP requests.

### gf

* Matches URLs against predefined vulnerability patterns such as XSS, SQLi, LFI, SSRF, SSTI, RCE, Redirect, and IDOR.

## 📦 Installation

cd URL-Recon-Automation

```bash
chmod +x install.sh
./install.sh
```

## 🚀 Usage

```bash
chmod +x recon.sh
./recon.sh example.com
```

## 📁 Output Structure

```text
recon_example.com/
├── input/
│   ├── gau.txt
│   ├── wayback.txt
│   ├── katana.txt
│   ├── all.txt
│   └── live.txt
│
└── gf/
    ├── sqli.txt
    ├── xss.txt
    ├── lfi.txt
    ├── redirect.txt
    ├── ssrf.txt
    ├── rce.txt
    ├── idor.txt
    └── ssti.txt
```
