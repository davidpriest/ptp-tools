<?xml version="1.0"?>
<!--
 davidpriest.ca
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" version="1.0">
  <!--
      FRONT COVER -->
  <xsl:template name="front.cover">
    <xsl:call-template name="page.sequence">
      <xsl:with-param name="master-reference" select="'frontcover'"/>
      <xsl:with-param name="content">
        <fo:block-container absolute-position="absolute" top="6.875in" bottom="10pt" background-color="white" z-index="1" start-indent="0pt">
          <fo:table table-layout="fixed" width="100%">
            <fo:table-body>
              <fo:table-row block-progression-dimension="78pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$pantone430.primary.grey}" font-size="24pt" font-family="PTSans-Caption,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold">
                    <xsl:apply-templates select="$cover.title"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="36pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$pantone430.primary.grey}" font-size="24pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold">
                    <xsl:apply-templates select="$cover.subtitle"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="36pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$pantone430.primary.grey}" font-size="14pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols">
                    <xsl:if test="$release.name">
                      <xsl:value-of select="$release.name"/>
                    </xsl:if>
                    <xsl:if test="$cover.version">
                      <xsl:apply-templates select="$cover.version"/>
                    </xsl:if>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="18pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$pantone430.primary.grey}" font-size="14pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold">
                    <xsl:apply-templates select="$cover.date"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="96pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$pantone430.primary.grey}" font-size="9pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols">
                    <xsl:text>Please visit our forums: https://msli.com/</xsl:text>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:block-container>
        <!-- physically positioned above the title, but has to come second in the flow -->
        <fo:block-container absolute-position="absolute" top="6.7in" left="1.5in" z-index="2">
          <fo:block>
            <fo:external-graphic src="url({$banner}.{$cover.graphic.default.extension})" content-height="0.6in"/>
          </fo:block>
        </fo:block-container>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- 
      BACK COVER -->
  <xsl:template name="back.cover">
    <xsl:call-template name="page.sequence">
      <xsl:with-param name="master-reference" select="'backcover'"/>
      <xsl:with-param name="content">
        <fo:block-container absolute-position="absolute" top="6.875in" bottom="10pt" background-color="white">
          <fo:table table-layout="fixed" width="100%">
            <fo:table-body>
              <fo:table-row block-progression-dimension="200pt">
                <fo:table-cell display-align="after">
                  <fo:block text-align="center" color="{$pantone202.primary.red}" font-size="14pt" font-family="PTSans-Caption,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold" letter-spacing="0.1em" text-transform="uppercase">
                    <xsl:apply-templates select="$cover.org"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="14pt">
                <fo:table-cell display-align="after">
                  <fo:block text-align="center" color="{$pantone202.primary.red}" font-size="10pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" letter-spacing="0.1em" text-transform="uppercase">
                    <xsl:apply-templates select="$cover.orgurl"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="40pt">
                <fo:table-cell display-align="after">
                  <fo:block text-align="center" color="{$pantone430.primary.grey}" font-size="8pt" font-family="PTSans-Regular,sans-serif">
                    <xsl:apply-templates select="$cover.copyright"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="32pt">
                <fo:table-cell display-align="after">
                  <fo:block text-align="right" color="{$pantone430.primary.grey}" font-size="6pt" font-family="PTSans-Regular,sans-serif">
                    REV:<xsl:value-of select="$repo.id"/><xsl:text>&#xA0;</xsl:text>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:block-container>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
