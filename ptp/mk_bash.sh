#!/bin/bash
#DOCUMENT=_ReleaseNotes.txt
#export DOCTOOLS=$PWD/../../tools

echo ==> DEPRECATED PUBLISHING COMMAND <==
echo ==> Please use publish_adoc.bat <==

# The values above are set in the source directory's mk_bash.sh stub
# Configure values above; do not modify below this line

DOCUMENT=$1
shift
EXTRA=$*

[ -z "$DOCTOOLS" ] && source ../init.sh

mkdir -p output
rm -rf output/*

# a2x commands are similar for all output
cmdrest="--conf-file=$DOCTOOLS/ptp/a2x.bash.conf --icons-dir=$DOCTOOLS/ptp/icons --resource=$DOCTOOLS/ptp/images --no-xmllint --safe $EXTRA $DOCUMENT"

echo "Transforming to Draft PDF"
a2x.py -k -v -v -f pdf --fop --xsl-file=ptp-config/xsl/fo.xsl --destination-dir=output $cmdrest

echo "Transforming to EPub"
a2x.py -k -f epub --xsl-file=ptp-config/xsl/epub.xsl --destination-dir=output $cmdrest

echo "Transforming to Chunked HTML"
a2x.py -k -f chunked --xsl-file=ptp-config/xsl/chunked.xsl --destination-dir=output $cmdrest

echo "Transforming to XHTML"
mkdir -p output/html
a2x.py -f xhtml --xsl-file=ptp-config/xsl/xhtml.xsl --destination-dir=output/html $cmdrest

#echo "Transforming to HTMLHelp/CHM"
#mkdir -p output/chm
#a2x.py -f htmlhelp --stylesheet="docbook-xsl.css ptp-config/custom.css" --destination-dir=output/chm $cmdrest

echo ==> DEPRECATED PUBLISHING COMMAND <==
echo ==> Please use publish_adoc.sh <==

