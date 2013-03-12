#!/bin/bash
export DOCTOOLS=$PWD/../tools
export PATH=$DOCTOOLS/asciidoc:$DOCTOOLS/fop:$PATH
export XML_CATALOG_FILES=$DOCTOOLS/CATALOG.XML



java -cp $DOCTOOLS/diffmk/bin/diffmk.jar net.sf.diffmk.DiffMk --ignorewhitespace "$1" "$2" "output/DIFF.xml"

xsltproc --novalid --stringparam DOCTOOLS "$DOCTOOLS" --output output/DIFF.fo mksupport/xsl/fo.xsl output/DIFF.xml

fop -c $DOCTOOLS/mksupport-common/fop.bash.conf -fo output/DIFF.fo -pdf output/DIFF.pdf
