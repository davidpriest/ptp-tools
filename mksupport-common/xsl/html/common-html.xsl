<?xml version="1.0"?>
<!--
  Inlcuded in xhtml.xsl, xhtml.chunked.xsl, htmlhelp.xsl.
  Contains common XSL stylesheets parameters.
  Output documents styled by docbook.css.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="html.stylesheet" select="'docbook-xsl.css'"/>

<xsl:param name="admon.graphics.path" select="concat('file://',$DOCTOOLS,'/mksupport-common/icons/')"/>

<xsl:param name="htmlhelp.chm" select="'htmlhelp.chm'"/>
<xsl:param name="htmlhelp.hhc.section.depth" select="5"/>

<xsl:param name="section.autolabel">
  <xsl:choose>
    <xsl:when test="/processing-instruction('asciidoc-numbered')">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:param name="suppress.navigation" select="0"/>
<xsl:param name="navig.graphics.extension" select="'.png'"/>
<xsl:param name="navig.graphics" select="0"/>
<xsl:param name="navig.graphics.path">concat('file://',$DOCTOOLS,'/mksupport-common/icons/')</xsl:param>
<xsl:param name="navig.showtitles">0</xsl:param>

<xsl:param name="admon.style">
  <xsl:text>margin-left: 0; margin-right: 10%;</xsl:text>
</xsl:param>


<!-- This does not seem to work. -->
<xsl:param name="section.autolabel.max.depth" select="2"/>

<xsl:param name="chunk.first.sections" select="1"/>
<xsl:param name="chunk.section.depth" select="1"/>
<xsl:param name="chunk.quietly" select="0"/>
<xsl:param name="chunk.toc" select="''"/>
<xsl:param name="chunk.tocs.and.lots" select="0"/>

<xsl:param name="html.cellpadding" select="'4px'"/>
<xsl:param name="html.cellspacing" select="''"/>

<xsl:param name="tablecolumns.extension" select="'1'"/>

<xsl:param name="highlight.source" select="1"/>
</xsl:stylesheet>