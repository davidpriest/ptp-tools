<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!--
  programlistings contain source code
    remap attribute contains:
      master file name
      «fragment name»
  within the programlisting content
    «fragment name»
  -->
  <xsl:variable name="DOC" select="."/>
  <xsl:param name="padding" select="'                                                                                '"/>
  
  <xsl:template match="//programlisting[@role='litsrc' and not(contains(@remap,'&#xAB;'))]">
    <xsl:variable name="PROGRAM">
      <xsl:apply-templates select="." mode="literate"/>
    </xsl:variable>
    <xsl:result-document href="{@remap}" method="text">
      <xsl:value-of select="$PROGRAM"/>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template match="programlisting" mode="literate">
    <xsl:param name="indent">0</xsl:param>
    <xsl:analyze-string select="./text()" regex="^([ ]*?)(&#xAB;.*?&#xBB;)" flags="m">
      <xsl:matching-substring>
        <xsl:variable name="fragment" select="$DOC//programlisting[@role='litsrc' and @remap=regex-group(2)]"/>
        <xsl:choose>
          <xsl:when test="$fragment">
            <xsl:apply-templates select="$fragment" mode="literate">
              <xsl:with-param name="indent" select="$indent + string-length(regex-group(1))"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat(regex-group(1),regex-group(2))"/>
            <xsl:message>WARNING: fragment <xsl:value-of select="regex-group(2)"/> had no corresponding program listing.</xsl:message>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:for-each select="tokenize(.,'\r?\n')">
          <xsl:if test=". != ''">
            <xsl:value-of select="substring($padding,1,$indent)"/>
          </xsl:if>
          <xsl:value-of select="."/>
          <xsl:if test="not(position()=last())">
            <xsl:text>&#xD;</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
</xsl:stylesheet>