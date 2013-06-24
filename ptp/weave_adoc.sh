#!/bin/bash
# The following values are set in the source directory's publish.bat stub
# DOCUMENT=_The_Root_Document.txt
# PTP_TOOLS=$PWD/..

# Do not modify below this line

DOCUMENT=$1
shift
EXTRA=$*

[ -z "$PTP_TOOLS" ] && source ../init.sh

# Source Woven Edition
asciidoc.py --conf-file=$PWD/asciidoc-weaving.conf --doctype=book --backend=docbook $1

# Publish
#a2x.py -v --doctype=book --format=pdf --no-xmllint --xsltproc-opts="--nonet" --fop $1
#a2x.py -v --doctype=book --format=epub --no-xmllint --xsltproc-opts="--nonet" $1

# Source Highlighted Edition
#asciidoc.py --attribute=source-highlighter=pygments --doctype=book --backend=html $1
#asciidoc.py --attribute=source-highlighter=pygments --doctype=book --backend=docbook $1

