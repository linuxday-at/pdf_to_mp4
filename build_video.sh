#!/bin/bash

# a) libreoffice: convert .impress to .pdf

PDF_FILE=monitor_pres_20221118_1724.pdf

# a) generate a build-dir for all the extra files.
mkdir -p build

cp "$PDF_FILE" ./build/

cd build/

# b) convert PDF to .png per page
#   debian: package poppler-utils
#   if you get an error about "policy..PDf".. see
#   https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion

pdftoppm $PDF_FILE $PDF_FILE -png

# c) glue .png together into a video, with delay ( 1 = 1/100 sec ) 
convert -layers OptimizePlus -delay 300 $PDF_FILE-0?.png "$PDF_FILE".mp4

# check the .mp4 file, e.g. with mplayer
