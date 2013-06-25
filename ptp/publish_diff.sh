#!/bin/bash

[ -z "$PTP_TOOLS" ] && source ../init.sh

java -cp $PTP_TOOLS/diffmk/bin/diffmk.jar net.sf.diffmk.DiffMk --ignorewhitespace "$1" "$2" "output/DIFF.xml"

xsltproc --novalid --stringparam PTP_TOOLS "$PTP_TOOLS" --output output/DIFF.fo ptp-config/xsl/fo.xsl output/DIFF.xml

fop -c $PTP_TOOLS/ptp/fop.bash.conf -fo output/DIFF.fo -pdf output/DIFF.pdf
