<?xml version="1.0"?>
<!--
  See xsl-stylesheets/fo/param.xsl for all parameters.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:param name="PTP_TOOLS" select="'MUST PASS PTP_TOOLS TO XSLTPROC!'"/>
  <!-- Particular to ptp-tools -->
  <xsl:param name="primary.main.color">wheat</xsl:param>
  <xsl:param name="primary.contrast.color">#7B89A3</xsl:param>
  <xsl:param name="ptp.title" select="//bookinfo/title"/>
  <xsl:param name="ptp.cover.subtitle" select="//bookinfo/subtitle"/>
  <xsl:param name="ptp.cover.tagline" select="//bookinfo/para[@role='tagline']"/>
  <xsl:param name="ptp.releaseinfo" select="//bookinfo/releaseinfo"/>
  <xsl:param name="ptp.cover.version" select="//bookinfo/revhistory"/>
  <xsl:param name="ptp.cover.date" select="//bookinfo/date"/>
  <xsl:param name="ptp.cover.image" select="//bookinfo/graphic[@role='cover']/@fileref"/>
  <xsl:param name="logo" select="//bookinfo/graphic[@role='logo']/@fileref"/>
  <xsl:param name="logo.height" select="'48pt'"/>
  <xsl:param name="ptp.cover.org" select="//bookinfo/date"/>
  <xsl:param name="ptp.cover.orgurl" select="//bookinfo/date"/>
  <xsl:param name="ptp.cover.copyright">&#xA9;<xsl:value-of select="substring(//bookinfo/date,1,4)"/>, <xsl:value-of select="//bookinfo/copyright/holder"/></xsl:param>
  <!-- Stock parameters -->
  <xsl:param name="local.l10n.xml" select="document('gentext.xml')"/>
  <xsl:param name="draft.mode">
    <xsl:choose>
      <xsl:when test="processing-instruction('asciidoc-draft')">yes</xsl:when>
      <xsl:when test="/*[@status='draft']">yes</xsl:when>
      <xsl:otherwise>no</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="admon.graphics" select="1"/>
  <xsl:param name="admon.graphics.extension" select="'.svg'"/>
  <xsl:param name="admon.graphics.path" select="concat('file://',$PTP_TOOLS,'/ptp/icons/')"/>
  <xsl:param name="alignment">left</xsl:param>
  <xsl:param name="body.font.family" select="'PTSans-Regular,serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="narrow.font.family" select="'PTSans-Narrow,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="body.font.master">10.5</xsl:param>
  <xsl:param name="callout.defaultcolumn" select="'80'"/>
  <xsl:param name="callout.graphics.path" select="concat('file://',$PTP_TOOLS,'/ptp/icons/callouts/')"/>
  <xsl:param name="dingbat.font.family" select="'sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="draft.watermark.image" select="concat('file://',$PTP_TOOLS,'/ptp/images/draft.png')"/>
  <xsl:param name="fop1.extensions" select="1"/>
  <xsl:param name="header.column.widths">2 1 1</xsl:param>
  <xsl:param name="hyphenate">false</xsl:param>
  <xsl:param name="line-height" select="1.2"/>
  <xsl:param name="monospace.font.family" select="'monospace,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="paper.type" select="'USletter'"/>
  <xsl:param name="sans.font.family" select="'PTSans-Narrow,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="section.autolabel">1</xsl:param>
  <xsl:param name="section.autolabel.max.depth">3</xsl:param>
  <xsl:param name="section.label.includes.component.label">1</xsl:param>
  <xsl:param name="shade.verbatim" select="1"/>
  <xsl:param name="symbol.font.family" select="'sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="title.font.family" select="'PTSans-Caption,sans-serif,Symbol,ZapfDingbats,UnicodeSymbols'"/>
  <xsl:param name="variablelist.as.blocks" select="1"/>
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
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="nongraphical.admonition.properties">
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
    <xsl:attribute name="border-left">thin solid grey</xsl:attribute>
    <xsl:attribute name="padding-left">1em</xsl:attribute>
    <xsl:attribute name="margin-left">0in</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
    <xsl:attribute name="margin-{$direction.align.start}">0.25in</xsl:attribute>
    <xsl:attribute name="margin-{$direction.align.end}">0.25in</xsl:attribute>
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
        <xsl:when test="@role='litsrc'">
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
    <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
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
      <xsl:value-of select="$title.fontset"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <!-- font size is calculated dynamically by section.heading template -->
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
    <xsl:attribute name="text-align">start</xsl:attribute>
    <xsl:attribute name="start-indent">
      <xsl:value-of select="$title.margin.left"/>
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
        <xsl:otherwise>0pt</xsl:otherwise>
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
</xsl:stylesheet>
