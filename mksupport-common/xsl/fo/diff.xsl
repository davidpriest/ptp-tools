<?xml version="1.0"?>
<xsl:stylesheet xmlns:diffmk="http://diffmk.sf.net/ns/diff" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:template match="diffmk:wrapper[@diffmk:change='added']">
    <fo:inline background-color="#F9FFF9" border-bottom="1pt solid #9AEE9A"><!-- greens -->
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  <xsl:template match="diffmk:wrapper[@diffmk:change='changed']">
    <fo:inline background-color="#F9F9FF" border-bottom="1pt solid #00EEEE"><!-- blues -->
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  <xsl:template match="diffmk:wrapper[@diffmk:change='deleted']">
    <fo:inline background-color="#FFF9F9" border-bottom="1xpt solid #CD3F66" text-decoration="line-through"><!-- reds -->
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
</xsl:stylesheet>
