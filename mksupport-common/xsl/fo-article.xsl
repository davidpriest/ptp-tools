<?xml version="1.0"?>
<!--
  Generates single FO document from DocBook XML source using DocBook XSL
  stylesheets.

  See xsl-stylesheets/fo/param.xsl for all parameters.

  NOTE: The URL reference to the current DocBook XSL stylesheets is
  rewritten to point to the copy on the local disk drive by the XML catalog
  rewrite directives so it doesn't need to go out to the Internet for the
  stylesheets. This means you don't need to edit the <xsl:import> elements on
  a machine by machine basis.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>
	<xsl:import href="fo/cover.xsl"/>
	<xsl:import href="fo/custom.xsl"/>
	<xsl:import href="fo/pagesetup.xsl"/>
	<xsl:import href="fo/titles.xsl"/>
	<xsl:param name="DOCTOOLS" select="'MUST PASS DOCTOOLS TO XSLTPROC!'"/>
	<xsl:param name="local.l10n.xml" select="document('fo/gentext.xml')"/>
	<xsl:param name="draft.mode">
		<xsl:choose>
			<xsl:when test="processing-instruction('asciidoc-draft')">yes</xsl:when>
			<xsl:otherwise>no</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="admon.graphics" select="1"/>
	<xsl:param name="admon.graphics.extension" select="'.svg'"/>
	<xsl:param name="admon.graphics.path">images/icons/</xsl:param>
	<xsl:param name="admon.textlabel" select="1"/>
	<xsl:param name="alignment">left</xsl:param>
	<xsl:param name="appendix.autolabel" select="1"/>
	<xsl:param name="banner">images/mir-banner</xsl:param>
	<xsl:param name="body.font.family" select="'PTSans-Regular,serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="body.font.master">10.5</xsl:param>
	<xsl:param name="body.start.indent">2pt</xsl:param>
	<xsl:param name="callout.defaultcolumn" select="'80'"/>
	<xsl:param name="callout.graphics" select="'1'"/>
	<xsl:param name="callout.graphics.extension" select="'.svg'"/>
	<xsl:param name="callout.graphics.number.limit" select="'10'"/>
	<xsl:param name="callout.graphics.path" select="'images/icons/callouts/'"/>
	<xsl:param name="callout.list.table" select="'1'"/>
	<xsl:param name="docinfo.brand" select="//cover/para[@xml:id='docinfo_brand']"/>
	<xsl:param name="docinfo.sku" select="//cover/para[@xml:id='docinfo_sku']"/>
	<xsl:param name="docinfo.copyright" select="//cover/para[@xml:id='docinfo_copyright']"/>
	<xsl:param name="docinfo.org" select="//cover/para[@xml:id='docinfo_org']"/>
	<xsl:param name="docinfo.orgurl" select="//cover/para[@xml:id='docinfo_orgurl']"/>
	<xsl:param name="asciidoc.sku" select="//cover/para[@xml:id='asciidoc_sku']"/>
	<xsl:param name="asciidoc.release" select="//cover/para[@xml:id='asciidoc_release']"/>
	<xsl:param name="cover.graphic.default.extension">svg</xsl:param>
	<xsl:param name="dingbat.font.family" select="'serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="double.sided" select="0"/>
	<xsl:param name="draft.watermark.image" select="'images/draft.png'"/>
	<xsl:param name="fop1.extensions" select="1"/>
	<xsl:param name="header.column.widths">3 2 3</xsl:param>
	<xsl:param name="hyphenate">false</xsl:param>
	<xsl:param name="line-height" select="1.2"/>
	<xsl:param name="logo">images/mir-logo</xsl:param>
	<xsl:param name="monospace.font.family" select="'monospace,Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="narrow.font.family" select="'PTSans-Narrow,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="pantone202.primary.red">rgb(130,36,51)</xsl:param>
	<xsl:param name="pantone430.primary.grey">rgb(55,66,74)</xsl:param>
	<xsl:param name="paper.type" select="'USletter'"/>
	<xsl:param name="procedure.section.ttl.color" select="$pantone202.primary.red"/>
	<xsl:param name="procedure.section.ttl.bkg">white</xsl:param>
	<xsl:param name="release.name" select="//cover/para[@xml:id='releasename']"/>
	<xsl:param name="repo.id"/>
	<xsl:param name="sans.font.family" select="'PTSans-Narrow,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="section.autolabel">0</xsl:param>
	<xsl:param name="section.label.includes.component.label">1</xsl:param>
	<xsl:param name="shade.verbatim" select="1"/>
	<xsl:param name="symbol.font.family" select="'Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="tasksection.ttl.color" select="$pantone202.primary.red"/>
	<xsl:param name="tasksection.ttl.bkg">white</xsl:param>
	<xsl:param name="title.font.family" select="'PTSans-Caption,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
	<xsl:param name="use.extensions" select="0"/>
	<xsl:param name="variablelist.as.blocks" select="1"/>
	<xsl:param name="section.autolabel.max.depth">3  </xsl:param>
	<xsl:param name="bridgehead.in.toc">
		<xsl:choose>
			<xsl:when test="$draft.mode='yes'">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="generate.toc">
		<xsl:choose>
			<xsl:when test="/processing-instruction('asciidoc-toc')">
          article toc,title
          book    toc,title,figure,table,example,equation
          /appendix toc,title
          article/appendix  nop
          /article  toc,title
          book      toc,title,figure,table,example,equation
          /chapter  toc,title
          part      toc,title
          /preface  toc,title
          reference toc,title
          /sect1    toc
          /sect2    toc
          /sect3    toc
          /sect4    toc
          /sect5    toc
          /section  toc
          set       toc,title
      </xsl:when>
			<xsl:otherwise>
          article nop
          book    nop
      </xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:attribute-set name="admonition.title.properties">
		<xsl:attribute name="font-size">12pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="nongraphical.admonition.properties">
		<xsl:attribute name="start-indent">0pt</xsl:attribute>
		<xsl:attribute name="border-left">thin solid grey</xsl:attribute>
		<xsl:attribute name="padding-left">1em</xsl:attribute>
		<xsl:attribute name="margin-left">0in</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="xref.properties">
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="variablelist.term.properties">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="sidebar.properties" use-attribute-sets="formal.object.properties">
		<xsl:attribute name="border">solid thin black</xsl:attribute>
		<xsl:attribute name="background-color">#FAFAFF</xsl:attribute>
		<xsl:attribute name="padding">1em 0.5em</xsl:attribute>
		<xsl:attribute name="margin">0pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="shade.verbatim.style">
		<xsl:attribute name="background-color">#FAFFFA</xsl:attribute>
		<xsl:attribute name="padding">3pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
		<xsl:attribute name="text-align">start</xsl:attribute>
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:choose>
				<xsl:when test="@role='srcfile'">
					<xsl:call-template name="set.sect.fontsize">
						<xsl:with-param name="fsize">0.66</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="set.sect.fontsize">
						<xsl:with-param name="fsize">0.85</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="list.block.spacing">
		<xsl:attribute name="margin-top">
			<xsl:value-of select="$body.font.master * 1.2"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="border" select="'1px solid red'"/>
	</xsl:attribute-set>
	<!--
    Force XSL Stylesheets 1.72 default table breaks to be the same as the current
    version (1.74) default which (for tables) is keep-together="auto".
  -->
	<xsl:attribute-set name="table.properties">
		<xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.level1.properties">
		<xsl:attribute name="font-size">
			<xsl:call-template name="set.sect.fontsize">
				<xsl:with-param name="fsize">1.5</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size">
			<xsl:call-template name="set.sect.fontsize">
				<xsl:with-param name="fsize">1.3</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.level3.properties">
		<xsl:attribute name="font-family">
			<xsl:value-of select="$narrow.font.family"/>
		</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:call-template name="set.sect.fontsize">
				<xsl:with-param name="fsize">1.2</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.level4.properties">
		<xsl:attribute name="font-size">
			<xsl:call-template name="set.sect.fontsize">
				<xsl:with-param name="fsize">1.1</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.level5.properties">
		<xsl:attribute name="font-size">
			<xsl:call-template name="set.sect.fontsize">
				<xsl:with-param name="fsize">1.1</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.level6.properties">
		<xsl:attribute name="font-size">
			<xsl:call-template name="set.sect.fontsize">
				<xsl:with-param name="fsize">1.1</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.title.properties">
		<xsl:attribute name="font-family">
			<xsl:value-of select="$title.font.family"/>
		</xsl:attribute>
		<!-- font size is calculated dynamically by section.heading template -->
		<xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<xsl:attribute name="space-before.minimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.5em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.0em</xsl:attribute>
		<xsl:attribute name="text-align">start</xsl:attribute>
		<xsl:attribute name="start-indent">
			<xsl:value-of select="$title.margin.left"/>
		</xsl:attribute>
		<xsl:attribute name="color">
			<xsl:choose>
				<xsl:when test="parent::section[@role='task']">
					<xsl:value-of select="$tasksection.ttl.color"/>
				</xsl:when>
				<xsl:when test="parent::section[@role='procedure']">
					<xsl:value-of select="$procedure.section.ttl.color"/>
				</xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="background-color">
			<xsl:choose>
				<xsl:when test="parent::section[@role='task']">
					<xsl:value-of select="$tasksection.ttl.bkg"/>
				</xsl:when>
				<xsl:when test="parent::section[@role='procedure']">
					<xsl:value-of select="$procedure.section.ttl.bkg"/>
				</xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="border-top">
			<xsl:choose>
				<xsl:when test="parent::section[@role='task']">thin solid black</xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="padding-top">
			<xsl:choose>
				<xsl:when test="parent::section[@role='task']">3pt</xsl:when>
				<xsl:otherwise>inherit</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="border-bottom">
			<xsl:choose>
				<xsl:when test="parent::section[@role='task']">thin solid black</xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="section.properties">
		<xsl:attribute name="border-bottom">
			<xsl:choose>
				<xsl:when test="@role='procedure' and not(position()=last())">thin solid black</xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="border-top">inherit</xsl:attribute>
		<xsl:attribute name="padding-top">inherit</xsl:attribute>
		<xsl:attribute name="padding-bottom">inherit</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="toc.line.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master + 2"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="text-align-last">justify</xsl:attribute>
		<xsl:attribute name="text-align">start</xsl:attribute>
		<xsl:attribute name="end-indent">
			<xsl:value-of select="concat($toc.indent.width, 'pt')"/>
		</xsl:attribute>
		<xsl:attribute name="last-line-end-indent">
			<xsl:value-of select="concat('-', $toc.indent.width, 'pt')"/>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="rally.properties">
		<xsl:attribute name="margin">0in</xsl:attribute>
		<xsl:attribute name="border-style">none</xsl:attribute>
		<xsl:attribute name="background-color">transparent</xsl:attribute>
		<xsl:attribute name="padding">0em</xsl:attribute>
		<xsl:attribute name="padding-left">0.5em</xsl:attribute>
		<xsl:attribute name="space-before">0in</xsl:attribute>
		<xsl:attribute name="space-after">0in</xsl:attribute>
		<xsl:attribute name="font-family">monospace</xsl:attribute>
		<xsl:attribute name="font-size">xx-small</xsl:attribute>
		<xsl:attribute name="color">lightblue</xsl:attribute>
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="text-align-last">right</xsl:attribute>
		<xsl:attribute name="float">right</xsl:attribute>
		<xsl:attribute name="height">0pt</xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>
