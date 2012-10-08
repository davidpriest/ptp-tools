<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY comment.block.parents "parent::answer|parent::appendix|parent::article|parent::bibliodiv|
parent::bibliography|parent::blockquote|parent::caution|parent::chapter|
parent::glossary|parent::glossdiv|parent::important|parent::index|
parent::indexdiv|parent::listitem|parent::note|parent::orderedlist|
parent::partintro|parent::preface|parent::procedure|parent::qandadiv|
parent::qandaset|parent::question|parent::refentry|parent::refnamediv|
parent::refsect1|parent::refsect2|parent::refsect3|parent::refsection|
parent::refsynopsisdiv|parent::sect1|parent::sect2|parent::sect3|parent::sect4|
parent::sect5|parent::section|parent::setindex|parent::sidebar|
parent::simplesect|parent::taskprerequisites|parent::taskrelated|
parent::tasksummary|parent::warning">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<!-- remove
default title page face, but keep the backside -->
	<!-- clear recto -->
	<xsl:template name="book.titlepage.recto"/>
	<!-- clear page break after recto
-->
	<xsl:template name="book.titlepage.before.verso"/>
	<!-- Line break -->
	<xsl:template match="processing-instruction('asciidoc-br')">
		<fo:block/>
	</xsl:template>
	<!-- Horizontal ruler -->
	<xsl:template match="processing-instruction('asciidoc-hr')">
		<fo:block space-after="1em">
			<fo:leader leader-pattern="rule" rule-thickness="0.5pt" rule-style="solid" leader-length.minimum="100%"/>
		</fo:block>
	</xsl:template>
	<!-- Hard page
break -->
	<xsl:template match="processing-instruction('asciidoc-pagebreak')">
		<fo:block break-after="page"/>
	</xsl:template>
	<xsl:template match="*" mode="admon.graphic.width">
		<xsl:value-of select="$body.font.master * 1.618"/>
		<xsl:text>pt</xsl:text>
	</xsl:template>
	<xsl:template match="comment[&comment.block.parents;]|remark[&comment.block.parents;]">
		<xsl:if test="$draft.mode='yes'">
			<fo:block font-size="x-small" background-color="yellow">
				<xsl:call-template name="inline.charseq"/>
			</fo:block>
		</xsl:if>
	</xsl:template>
	<xsl:template match="comment|remark">
		<xsl:if test="$draft.mode='yes'">
			<fo:inline background-color="yellow">
				<xsl:call-template name="inline.charseq"/>
			</fo:inline>
		</xsl:if>
	</xsl:template>
	<xsl:template match="para[@role='srcfile']">
		<fo:block text-align="right" font-size="xx-small" keep-with-next="always">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template name="set.sect.fontsize">
		<xsl:param name="fsize" select="."/>
		<xsl:choose>
			<xsl:when test="ancestor::section[(@role='procedure') or (@role='task')]">inherit</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$body.font.master * $fsize"/>
				<xsl:text>pt</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="simpara[child::indexterm[not(preceding-sibling::*) and not(following-sibling::*)]]">
		<!-- deal with awkward inclusion of non-inline
"inline" index terms ... ie. on their own line, separated by blank lines above
and below -->
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="para[@role='review'][preceding::processing-instruction('asciidoc-draft')]">
		<fo:block color="red">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="para[@role='draft'][preceding::processing-instruction('asciidoc-draft')]">
		<fo:block color="grey">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="phrase[@role='arrow.separator']">
		<fo:inline font-family="Symbol,ZapfDingbats,UnicodeSymbols">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="trademark">
		<xsl:call-template name="inline.charseq"/>
		<xsl:if test="ancestor::bookinfo">
			<fo:inline font-size="xx-small" baseline-shift="super" line-stacking-strategy="font-height" line-height-shift-adjustment="disregard-shifts">
				<xsl:choose>
					<xsl:when test="@class = 'copyright' or @class = 'registered'">
						<xsl:call-template name="dingbat">
							<xsl:with-param name="dingbat" select="@class"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="@class = 'service'">
						<xsl:call-template name="inline.superscriptseq">
							<xsl:with-param name="content" select="'SM'"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="dingbat">
							<xsl:with-param name="dingbat" select="'trademark'"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</fo:inline>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
