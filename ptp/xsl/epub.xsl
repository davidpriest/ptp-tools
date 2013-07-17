<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/epub/docbook.xsl"/>
  <xsl:import href="html/common-html.xsl"/>
  <xsl:param name="draft.mode">yes</xsl:param>
  <xsl:param name="suppress.navigation" select="1"/>
  <xsl:param name="generate.toc">
    <xsl:choose>
      <xsl:when test="/article">
/article  nop
    </xsl:when>
      <xsl:when test="/book">
/book  nop
    </xsl:when>
    </xsl:choose>
  </xsl:param>
</xsl:stylesheet>
