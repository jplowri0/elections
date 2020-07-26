#!/bin/sh

#Scrape the FEC data. https://www.fec.gov/data/browse-data/?tab=bulk-data for other categories
wget "https://www.fec.gov/files/bulk-downloads/2020/weball20.zip"
unzip weball20.zip
rm weball20.zip
