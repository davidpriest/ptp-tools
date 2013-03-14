#!/bin/bash
export DOCTOOLS=$PWD
export XMLSH=$PWD/xmlsh
export PATH=$DOCTOOLS/asciidoc:$DOCTOOLS/fop:$DOCTOOLS/xmlsh/unix:$PATH
export XML_CATALOG_FILES=$DOCTOOLS/CATALOG.XML
