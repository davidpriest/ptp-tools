<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!--
  programlistings contain source code
    remap attribute contains:
      master file name
      «chunk name»
  within the programlisting content
    «chunk name»
  -->
  <xsl:variable name="DOC" select="."/>
  <xsl:template match="/">
    <xsl:for-each select="//programlisting[@role='litsrc' and not(contains(@remap,'&#xAB;'))]">
      <xsl:variable name="PROGRAM">
        <xsl:apply-templates select="." mode="literate"/>
      </xsl:variable>
      <xsl:result-document href="{@remap}" method="text">
        <xsl:value-of select="$PROGRAM"/>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="programlisting" mode="literate">
    <xsl:analyze-string select="./text()" regex="(&#xAB;.*?&#xBB;)">
      <xsl:matching-substring>
        <xsl:apply-templates select="$DOC//programlisting[@role='litsrc' and @remap=regex-group(1)]" mode="literate"/>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
</xsl:stylesheet>
