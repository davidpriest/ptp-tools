#!/bin/bash
# The following values are set in the source directory's publish.bat stub
# DOCUMENT=_The_Root_Document.txt
# PTP_TOOLS=$PWD/..

# Do not modify below this line

DOCUMENT=$1
shift
EXTRA=$*

[ -z "$PTP_TOOLS" ] && source ../init.sh

mkdir -p output
rm -rf output/*

## TODO: put this in quine

java -cp $PTP_TOOLS/diffmk/bin/diffmk.jar net.sf.diffmk.DiffMk --ignorewhitespace "$1" "$2" "output/DIFF.xml"

xsltproc --novalid --stringparam PTP_TOOLS "$PTP_TOOLS" --output output/DIFF.fo ptp-config/xsl/fo.xsl output/DIFF.xml

fop -c $PTP_TOOLS/ptp/fop.bash.conf -fo output/DIFF.fo -pdf output/DIFF.pdf
