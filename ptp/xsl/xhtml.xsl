<!--
  Generates single XHTML document from DocBook XML source using DocBook XSL
  stylesheets.

  NOTE: The URL reference to the current DocBook XSL stylesheets is
  rewritten to point to the copy on the local disk drive by the XML catalog
  rewrite directives so it doesn't need to go out to the Internet for the
  stylesheets. This means you don't need to edit the <xsl:import> elements on
  a machine by machine basis.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/docbook.xsl"/>
<xsl:import href="html/common-html.xsl"/>

<xsl:template match="para[@role='review']">
  <div class="review">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="para[@role='draft']">
  <div class="draft">
    <xsl:apply-templates/>
  </div>
</xsl:template>

</xsl:stylesheet>
