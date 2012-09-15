<?xml version="1.0"?>
<!--
	davidpriest.ca
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" version="1.0">
	<!-- 
   HEADERS -->
	<xsl:template name="header.content">
		<xsl:param name="pageclass" select="''"/>
		<xsl:param name="sequence" select="''"/>
		<xsl:param name="position" select="''"/>
		<xsl:param name="gentext-key" select="''"/>
		<!-- <fo:block>
         <xsl:value-of select="$pageclass"/>
         <xsl:text>, </xsl:text>
         <xsl:value-of select="$sequence"/>
         <xsl:text>, </xsl:text>
         <xsl:value-of select="$position"/>
         <xsl:text>, </xsl:text>
         <xsl:value-of select="$gentext-key"/>
      </fo:block> -->
		<fo:block>
			<!-- sequence can be odd, even, first, blank -->
			<!-- position can be left, center, right -->
			<xsl:choose>
				<xsl:when test="$sequence = 'blank'">
					<!-- nothing -->
				</xsl:when>
				<xsl:when test="$position='right'">
					<!-- nothing for empty and blank sequences -->
				</xsl:when>
				<xsl:when test="$sequence = 'first'">
					<!-- nothing for first pages -->
				</xsl:when>
				<xsl:when test="$sequence = 'blank'">
					<!-- nothing for blank pages -->
				</xsl:when>
				<xsl:when test="$position='center'">
					<!-- Same for odd, even, empty, and blank sequences -->
					<xsl:call-template name="draft.text"/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='even' and $position='left'">
					<xsl:apply-templates select="." mode="titleabbrev.markup"/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='even' and $position='right'">
					<fo:retrieve-marker retrieve-class-name="section.head.marker" retrieve-position="first-including-carryover" retrieve-boundary="page-sequence"/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='odd' and $position='left'">
					<fo:retrieve-marker retrieve-class-name="section.head.marker" retrieve-position="first-including-carryover" retrieve-boundary="page-sequence"/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='odd' and $position='right'">
					<xsl:apply-templates select="." mode="titleabbrev.markup"/>
				</xsl:when>
				<xsl:when test="$double.sided = 0 and $position='left'">
					<xsl:apply-templates select="." mode="titleabbrev.markup"/>
				</xsl:when>
				<xsl:when test="$double.sided = 0 and $position='right'">
					<fo:retrieve-marker retrieve-class-name="section.head.marker" retrieve-position="first-including-carryover" retrieve-boundary="page-sequence"/>
				</xsl:when>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	<!--
   FOOTERS -->
	<xsl:template name="footer.content">
		<xsl:param name="pageclass" select="''"/>
		<xsl:param name="sequence" select="''"/>
		<xsl:param name="position" select="''"/>
		<xsl:param name="gentext-key" select="''"/>
		<fo:block>
			<!-- pageclass can be front, body, back -->
			<!-- sequence can be odd, even, first, blank -->
			<!-- position can be left, center, right -->
			<xsl:choose>
				<xsl:when test="$pageclass='titlepage'">
					<!-- nop; no footer on title pages -->
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='even' and $position='left'">
					<fo:page-number/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='even' and $position='right'">
					<fo:external-graphic content-height="1em" src="url({$logo}.{$cover.graphic.default.extension})"/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and ($sequence='odd' or $sequence='first') and $position='right'">
					<fo:page-number/>
				</xsl:when>
				<xsl:when test="$double.sided != 0 and $sequence='odd' and $position='left'">
					<fo:external-graphic content-height="1em" src="url({$logo}.{$cover.graphic.default.extension})"/>
				</xsl:when>
				<xsl:when test="$double.sided=0 and $position='right' and $pageclass!='frontcover' and $pageclass!='backcover'">
					<fo:page-number/>
				</xsl:when>
				<xsl:when test="$double.sided=0 and $position='left' and $sequence!='first' and $pageclass!='frontcover' and $pageclass!='backcover'">
					<fo:external-graphic content-height="1em" src="url({$logo}.{$cover.graphic.default.extension})"/>
				</xsl:when>
				<xsl:when test="$sequence='blank' and $pageclass!='frontcover' and $pageclass!='backcover'">
					<xsl:choose>
						<xsl:when test="$double.sided != 0 and $position='left'">
							<fo:page-number/>
						</xsl:when>
						<xsl:when test="$double.sided=0 and $position='right'">
							<fo:page-number/>
						</xsl:when>
						<xsl:otherwise>
							<!-- nop -->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<!-- nop -->
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	<!-- 
   MARGINLESS PAGE MASTER FOR COVERS -->
	<xsl:template name="user.pagemasters">
		<fo:simple-page-master page-height="{$page.height}" page-width="{$page.width}" master-name="fullpage">
			<xsl:choose>
				<xsl:when test="$draft.mode='yes'">
					<fo:region-body background-color="lightgrey" margin="0in"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:region-body background-image="{$DOCTOOLS}/mksupport-common/images/msli-honeycomb-background.svg" background-position-vertical="1.75in" background-repeat="no-repeat" margin="0in" overflow="visible"/>
				</xsl:otherwise>
			</xsl:choose>
		</fo:simple-page-master>
		<fo:page-sequence-master master-name="frontcover">
			<fo:single-page-master-reference master-reference="fullpage"/>
			<fo:single-page-master-reference master-reference="blank"/>
		</fo:page-sequence-master>
		<fo:page-sequence-master master-name="backcover">
			<fo:single-page-master-reference master-reference="fullpage"/>
			<fo:single-page-master-reference master-reference="blank"/>
		</fo:page-sequence-master>
	</xsl:template>
</xsl:stylesheet>
