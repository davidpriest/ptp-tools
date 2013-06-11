<?xml version="1.0"?>
<!--
	davidpriest.ca
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" version="1.0">
<!-- 
   Chapter & Appendix titles to show the logo on the left and title on the right -->
   <xsl:template name="chapter.titlepage.recto">
      <fo:block start-indent="0pt">
         <fo:table inline-progression-dimension="100%">
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell start-indent="0pt" width="{$body.start.indent}" padding-right="{$body.start.indent}">
                     <fo:block>
                        <fo:external-graphic content-width="{$logo.width}" src="url({$logo})"/>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                     <fo:block text-align="right">
                        <xsl:apply-templates select="title" mode="chapter.titlepage.recto.auto.mode"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table> 
      </fo:block>
   </xsl:template>
   <xsl:template name="appendix.titlepage.recto">
     <fo:block start-indent="0pt">
         <fo:table inline-progression-dimension="100%">
            <fo:table-body>
               <fo:table-row>
                 <fo:table-cell start-indent="0pt" width="{$body.start.indent}" padding-right="{$body.start.indent}">
                    <fo:block>
                       <fo:external-graphic content-width="{$logo.width}" src="url({$logo})"/>
                    </fo:block>
                 </fo:table-cell>
                  <fo:table-cell>
                     <fo:block text-align="right">
                        <xsl:apply-templates select="title" mode="appendix.titlepage.recto.auto.mode"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
      </fo:block>
   </xsl:template>
<!-- 
   Chapter titles to place label over title -->
   <xsl:template name="chapappendix.title">
      <xsl:param name="node" select="."/>
      <fo:block>
         <xsl:call-template name="gentext">
            <xsl:with-param name="key">
               <xsl:choose>
                  <xsl:when test="$node/self::chapter">chapter</xsl:when>
                  <xsl:when test="$node/self::appendix">appendix</xsl:when>
               </xsl:choose>
            </xsl:with-param>
         </xsl:call-template>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="$node" mode="label.markup"/>
      </fo:block>
      <fo:block>
         <xsl:apply-templates select="$node" mode="title.markup"/>
      </fo:block>
   </xsl:template>
</xsl:stylesheet>
