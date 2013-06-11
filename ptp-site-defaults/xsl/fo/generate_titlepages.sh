#!/bin/bash
xsltproc --stringparam ns http://www.w3.org/1999/XSL/Format --output titlepages.templates.xsl titlepage-convert-spec.xsl titlepage-spec.xml
