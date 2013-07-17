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

# a2x commands are similar for all output
cmdrest="--conf-file=$PTP_TOOLS/ptp/a2x.bash.conf --icons-dir=$PTP_TOOLS/ptp/icons --resource=$PTP_TOOLS/ptp/images --no-xmllint --safe $EXTRA $DOCUMENT"

echo "Transforming to Draft PDF"
a2x.py -k -v -v -f pdf --fop --xsl-file=ptp-config/xsl/fo.xsl --destination-dir=output $cmdrest

echo "Transforming to EPub"
a2x.py -k -f epub --xsl-file=ptp-config/xsl/epub.xsl --destination-dir=output $cmdrest

#echo "Transforming to Chunked HTML"
# errors w/a2x: ERROR: absolute resource file name: /Users/dpriest/dev/ptp-tools/ptp/icons/home.png
# a2x.py -k -f chunked --xsl-file=ptp-config/xsl/chunked.xsl --destination-dir=output $cmdrest

echo "Transforming to XHTML"
mkdir -p output/html
a2x.py -f xhtml --xsl-file=ptp-config/xsl/xhtml.xsl --destination-dir=output/html $cmdrest

#echo "Transforming to HTMLHelp/CHM"
#mkdir -p output/chm
#a2x.py -f htmlhelp --stylesheet="docbook-xsl.css ptp-config/custom.css" --destination-dir=output/chm $cmdrest
