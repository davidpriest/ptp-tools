#!/bin/bash
export PTP_TOOLS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export XMLSH=$PTP_TOOLS/xmlsh
export PATH=$PTP_TOOLS/asciidoc:$PTP_TOOLS/fop:$PTP_TOOLS/xmlsh/unix:$PATH
export XML_CATALOG_FILES=$PTP_TOOLS/CATALOG.XML
export FOP_OPTS=-Djava.awt.headless=true 

xsltproc --stringparam PTP_TOOLS $PTP_TOOLS $PTP_TOOLS/init-fop.xsl $PTP_TOOLS/ptp/fop.conf.template > $PTP_TOOLS/ptp/fop.bash.conf
