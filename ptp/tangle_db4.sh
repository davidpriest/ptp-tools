#!/bin/bash

DOCUMENT=$1
shift
EXTRA=$*

[ -z "$PTP_TOOLS" ] && source ../init.sh

java -cp ${PTP_TOOLS}/SaxonHE/saxon9he.jar:${PTP_TOOLS}/SaxonHE//resolver.jar \
-Dxml.catalog.files=${PTP_TOOLS}/CATALOG.XML \
-Dxml.catalog.verbosity=1 \
net.sf.saxon.Transform \
-r:org.apache.xml.resolver.tools.CatalogResolver \
-x:org.apache.xml.resolver.tools.ResolvingXMLReader \
-y:org.apache.xml.resolver.tools.ResolvingXMLReader \
-t -quit:on \
-xsl:$PTP_TOOLS/ptp/tangle.xsl \
-s:${DOCUMENT} \
-o:output/saxon.log