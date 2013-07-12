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
                  <fo:block margin-left="2.25in" color="{$primary.contrast.color}" font-size="24pt" font-family="PTSans-Caption,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold">
                    <xsl:apply-templates select="$ptp.title" mode="titlepage.mode"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="$ptp.cover.subtitle">
                <fo:table-row block-progression-dimension="36pt">
                  <fo:table-cell display-align="after">
                    <fo:block margin-left="2.25in" color="{$primary.contrast.color}" font-size="24pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold">
                      <xsl:apply-templates select="$ptp.cover.subtitle" mode="titlepage.mode"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <fo:table-row block-progression-dimension="36pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$primary.contrast.color}" font-size="14pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols">
                    <xsl:if test="$ptp.releaseinfo">
                      <xsl:value-of select="$ptp.releaseinfo"/>
                    </xsl:if>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="18pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$primary.contrast.color}" font-size="14pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold">
                    <xsl:apply-templates select="$ptp.cover.date"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row block-progression-dimension="96pt">
                <fo:table-cell display-align="after">
                  <fo:block margin-left="2.25in" color="{$primary.contrast.color}" font-size="9pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols">
                    <xsl:apply-templates select="$ptp.cover.tagline"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:block-container>
        <!-- physically positioned above the title, but has to come second in the flow -->
        <xsl:if test="$ptp.cover.image">
          <fo:block-container absolute-position="absolute" top="6.7in" left="1.5in" z-index="2">
            <fo:block>
              <fo:external-graphic src="url({$ptp.cover.image})" content-height="0.6in"/>
            </fo:block>
          </fo:block-container>
        </xsl:if>
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
          <fo:table table-layout="fixed" width="100%" margin-top="32pt">
            <fo:table-body>
              <fo:table-row height="32pt" display-align="after">
                <fo:table-cell>
                  <fo:block text-align="center" color="{$primary.contrast.color}" font-size="8pt" font-family="PTSans-Regular,sans-serif">
                    <xsl:value-of select="//bookinfo/legalnotice/para[@xml:id='copyright']"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row margin-top="32pt">
                <fo:table-cell>
                  <fo:block text-align="center" color="{$primary.main.color}" font-size="14pt" font-family="PTSans-Caption,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" font-weight="bold" letter-spacing="0.1em" text-transform="uppercase">
                    <xsl:apply-templates select="//bookinfo/cover[@xml:id='ptp.cover.end.face']//orgname"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row margin-top="16pt">
                <fo:table-cell>
                  <fo:block text-align="center" text-align-last="center" color="{$primary.main.color}" font-size="10pt" font-family="PTSans-Regular,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols" letter-spacing="0.1em">
                    <xsl:apply-templates select="//bookinfo/cover[@xml:id='ptp.cover.end.face']/org//address"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:block-container>
        <fo:block-container absolute-position="absolute" bottom="12pt" right="12pt" height="20pt">
          <fo:block text-align="right" color="{$primary.contrast.color}" font-size="8pt" font-family="PTSans-Regular,sans-serif">
            <xsl:text>PubID: </xsl:text>
            <xsl:value-of select="//bookinfo/biblioid"/>
          </fo:block>
        </fo:block-container>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
