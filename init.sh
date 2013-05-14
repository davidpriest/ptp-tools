#!/bin/bash
export DOCTOOLS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export XMLSH=$DOCTOOLS/xmlsh
export PATH=$DOCTOOLS/asciidoc:$DOCTOOLS/fop:$DOCTOOLS/xmlsh/unix:$PATH
export XML_CATALOG_FILES=$DOCTOOLS/CATALOG.XML
export FOP_OPTS=-Djava.awt.headless=true 

xsltproc --stringparam DOCTOOLS $DOCTOOLS $DOCTOOLS/init.xsl $DOCTOOLS/mksupport-common/fop.conf.template > $DOCTOOLS/mksupport-common/fop.bash.conf
