#!/bin/bash

# Title: ScrapeSite
# Description: Scrape the content from a site using its url
# Author: Reece
# Created: November 29, 2023

site="$2"

helpPage() {
    echo $'\nScrape a Website'
    echo '----'
    echo 'Syntax'
    echo '    ./scrapesite.sh [options] <websiteURL>'
    echo 'Options'
    echo '    -c       stdout cleaned text using curl & textutils'
    echo $'    -r       stdout raw html using curl\n'
    exit 0
}

rawHTML() {
    curl $site
    exit 0
}

cleanTxt() {
    # Make a temporary file, scrape the site, and store it into the temporary file
    fileName='scraped'

    # If temp file already exists then remove it and create a new one
    if [ -f /tmp/$fileName.html ]; then
        rm /tmp/$fileName.html
        tmpFile=$(mktemp /tmp/$fileName.html)
    # if it doesn't, then create it
    else 
        tmpFile=$(mktemp /tmp/$fileName.html)
    fi

    curl $site > $tmpFile

    # Convert html from tempFile to plain english text, output it to stdout
    textutil -convert txt $tmpFile -stdout 

    # Clean up temp files
    rm $tmpFile
    exit 0
}

invalidInput() {
    echo $'Invalid flag: Please use the -h flag for assistance in using ScrapeSite\n'
    exit 0
}

# Create flags/options
while getopts 'hrc' flag; do
    case $flag in
        h) # Handle the -h (help) flag
	        helpPage	
	        ;;
        r) # Handle the -r (raw) option
            rawHTML
            ;;
        c) # Handle the -c (clean) option
            cleanTxt
            ;;
        \?) # Handle invalid options
	    invalidInput
	    ;;
    esac
done

exit 0
