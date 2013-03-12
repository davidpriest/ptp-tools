#!/bin/bash
#DOCUMENT=_ReleaseNotes.txt
#export DOCTOOLS=$PWD/../../tools

# The values above are set in the source directory's mk_bash.sh stub
# Configure values above; do not modify below this line

DOCUMENT=$1
shift
EXTRA=$*
export XML_CATALOG_FILES=$DOCTOOLS/CATALOG.XML
export XML_DEBUG_CATALOG=1
export PATH=$DOCTOOLS/fop:$DOCTOOLS/asciidoc:$PATH

mkdir -p output
rm -rf output/*

# a2x commands are similar for all output
cmdrest="--conf-file=$DOCTOOLS/mksupport-common/a2x.bash.conf --icons-dir=$DOCTOOLS/mksupport-common/icons --resource=$DOCTOOLS/mksupport-common/images --no-xmllint --safe $EXTRA $DOCUMENT"

echo "Transforming to Draft PDF"
a2x.py -k -v -v -f pdf --fop --xsl-file=mksupport/xsl/fo.xsl --destination-dir=output $cmdrest

echo "Transforming to EPub"
a2x.py -k -f epub --xsl-file=mksupport/xsl/epub.xsl --destination-dir=output $cmdrest

echo "Transforming to Chunked HTML"
a2x.py -k -f chunked --xsl-file=mksupport/xsl/chunked.xsl --destination-dir=output $cmdrest

echo "Transforming to XHTML"
mkdir -p output/html
a2x.py -f xhtml --xsl-file=mksupport/xsl/xhtml.xsl --destination-dir=output/html $cmdrest

#echo "Transforming to HTMLHelp/CHM"
#mkdir -p output/chm
#a2x.py -f htmlhelp --stylesheet="docbook-xsl.css mksupport/custom.css" --destination-dir=output/chm $cmdrest
