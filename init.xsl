<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:param name="DOCTOOLS"/>
  <xsl:template match="base">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="$DOCTOOLS"/><xsl:text>/mksupport-common/</xsl:text>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="font-base">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="$DOCTOOLS"/><xsl:text>/mksupport-common/fonts/</xsl:text>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
