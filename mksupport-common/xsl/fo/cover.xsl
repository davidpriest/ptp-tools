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
				<fo:block-container start-indent="0.4in" end-indent="0.2in" margin-top="0.5in">
					<fo:table>
						<fo:table-body>
							<fo:table-row border-bottom="1.5pt solid blue">
								<fo:table-cell>
									<fo:block start-indent="0pt" font-size="12pt">
										<xsl:value-of select="$bookinfo.title"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row height="0.5in" display-align="after">
								<fo:table-cell>
									<fo:block start-indent="0pt" font-size="14pt">
										<xsl:value-of select="$docinfo.brand"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" text-align="right" end-indent="0in" padding="0in">
									<fo:block start-indent="0pt" font-size="14pt" margin="0pt">
										<fo:external-graphic content-height="0.4in" src="{$DOCTOOLS}/mksupport-common/images/thinking_sound_logo_blue.svg"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row height="0.3in" display-align="after">
								<fo:table-cell>
									<fo:block start-indent="0pt">
										<xsl:if test="$asciidoc.release">
											<xsl:value-of select="$asciidoc.release"/>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block start-indent="0pt">
										<xsl:if test="$docinfo.sku">
											<xsl:value-of select="$docinfo.sku"/>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
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
				<fo:block-container position="absolute" bottom="0.5in" display-align="after" start-indent="0.4in" end-indent="0in">
					<fo:table display-align="after" font-size="smaller">
						<fo:table-body margin="0in">
							<fo:table-row>
								<fo:table-cell start-indent="0in" padding="0in">
									<fo:block start-indent="0pt" font-size="14pt" margin="0in">
										<fo:external-graphic content-height="0.5in" src="{$DOCTOOLS}/mksupport-common/images/thinking_sound_logo_blue.svg"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row height="0.75in">
								<fo:table-cell start-indent="0in" padding="0in">
									<fo:block>Meyer Sound Laboratories Inc.</fo:block>
									<fo:block>2832 San Pablo Avenue</fo:block>
									<fo:block>Berkeley, CA 94702</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row height="0.5in">
								<fo:table-cell start-indent="0in" padding="0in">
									<fo:block>www.meyersound.com</fo:block>
									<fo:block>T: +1 510 486.1166</fo:block>
									<fo:block>F: +1 510 486.8356</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right">
									<fo:block>
										<xsl:value-of select="$docinfo.copyright"/>
									</fo:block>
									<fo:block>part no. <fo:inline><xsl:value-of select="$asciidoc.docid"/></fo:inline></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block-container>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
