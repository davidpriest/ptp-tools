#!/bin/bash
# Do not modify below this line

DOCUMENT=$1
shift
EXTRA=$*

[ -z "$PTP_TOOLS" ] && source ../init.sh

# a2x commands are similar for all output
cmdrest="--conf-file=$PTP_TOOLS/ptp/a2x.bash.conf --icons-dir=$PTP_TOOLS/ptp/icons --resource=$PTP_TOOLS/ptp/images --no-xmllint --safe $EXTRA $DOCUMENT"

# Convert to Docbook 4.5
a2x.py -k -v -v -f docbook --asciidoc-opts=--conf-file=asciidoc-weaving.conf --asciidoc-opts=--conf-file=asciidoc.conf --destination-dir=output --no-xmllint --safe $EXTRA $DOCUMENT

# Publish
#a2x.py -v --doctype=book --format=pdf --no-xmllint --xsltproc-opts="--nonet" --fop $1
#a2x.py -v --doctype=book --format=epub --no-xmllint --xsltproc-opts="--nonet" $1

# Source Highlighted Edition
#asciidoc.py --attribute=source-highlighter=pygments --doctype=book --backend=html $1
#asciidoc.py --attribute=source-highlighter=pygments --doctype=book --backend=docbook $1

