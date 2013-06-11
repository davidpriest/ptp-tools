<?xml version="1.0"?>
<!--
  Generates single FO document from DocBook XML source using DocBook XSL
  stylesheets.

  See xsl-stylesheets/fo/param.xsl for all parameters.

  NOTE: The URL reference to the current DocBook XSL stylesheets is
  rewritten to point to the copy on the local disk drive by the XML catalog
  rewrite directives so it doesn't need to go out to the Internet for the
  stylesheets. This means you don't need to edit the <xsl:import> elements on
  a machine by machine basis.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>
  <xsl:import href="fo/common-fo.xsl"/>
  <xsl:import href="fo/cover.xsl"/>
  <xsl:import href="fo/custom.xsl"/>
  <xsl:import href="fo/pagesetup.xsl"/>
  <xsl:import href="fo/titlepages.templates.xsl"/>
  <xsl:import href="fo/titles.xsl"/>
  <xsl:import href="fo/diff.xsl"/>
</xsl:stylesheet>
