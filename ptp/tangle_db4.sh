#!/bin/bash

DOCUMENT=$1
shift
EXTRA=$*

[ -z "$PTP_TOOLS" ] && source ../init.sh

java -jar ${PTP_TOOLS}/SaxonHE/saxon9he.jar -t -quit:on -xsl:tangle.xsl -s:${DOCUMENT} -o:output/saxon.log