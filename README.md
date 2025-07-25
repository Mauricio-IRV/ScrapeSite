# Scrape-Site

ScrapeSite is a simple Bash script which fetches content from a given website URL.
It supports two modes: raw HTML output and cleaned text output (using macOS textutil).

Features
- Fetch raw HTML from a website.
- Extract and display cleaned plain text from the HTML (macOS only).
- Lightweight, minimal dependencies (curl and textutil).

## Usage

**Syntax**

./scrapesite.sh [options] <websiteURL>

**Options**
```
    -r outputs raw HTML using curl
    -c outputs cleaned text using curl + textutil
    -h shows the help page
```

**Requirements**
- curl (preinstalled on most Unix-like systems)
- textutil (macOS only, for -c clean text option)

**Notes**
- The -c option will not work on Linux without installing textutil alternatives (e.g., lynx, html2text).
- The script uses /tmp to create temporary files during the clean-text operation and removes them after completion.