<?xml version="1.0"?>
<!DOCTYPE t:templates [
<!ENTITY hsize0 "10pt">
<!ENTITY hsize1 "12pt">
<!ENTITY hsize2 "14.4pt">
<!ENTITY hsize3 "17.28pt">
<!ENTITY hsize4 "20.736pt">
<!ENTITY hsize5 "24.8832pt">
<!ENTITY hsize0space "7.5pt">
<!-- 0.75 * hsize0 --><!ENTITY hsize1space "9pt">
<!-- 0.75 * hsize1 --><!ENTITY hsize2space "10.8pt">
<!-- 0.75 * hsize2 --><!ENTITY hsize3space "12.96pt">
<!-- 0.75 * hsize3 --><!ENTITY hsize4space "15.552pt">
<!-- 0.75 * hsize4 --><!ENTITY hsize5space "18.6624pt">
<!-- 0.75 * hsize5 -->]>
<t:templates xmlns:t="http://nwalsh.com/docbook/xsl/template/1.0" xmlns:param="http://nwalsh.com/docbook/xsl/template/1.0/param" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- ********************************************************************
     $I titlepage.templates.xml 8341 2009-03-16 03:00:56Z bobstayton $
     ********************************************************************

     This file is part of the DocBook XSL Stylesheet distribution.
     See ../README or http://docbook.sf.net/ for copyright
     copyright and other information.

     ******************************************************************** -->
<!-- ==================================================================== -->
    <t:titlepage t:element="article" t:wrapper="fo:block" font-family="{$title.fontset}">
        <t:titlepage-content t:side="recto" start-indent="0pt" text-align="center">
            <title t:named-template="component.title" param:node="ancestor-or-self::article[1]" keep-with-next.within-column="always" font-size="&hsize5;" font-weight="bold"/>
            <subtitle/>
            <corpauthor space-before="0.5em" font-size="&hsize2;"/>
            <authorgroup space-before="0.5em" font-size="&hsize2;"/>
            <author space-before="0.5em" font-size="&hsize2;"/>
<!-- If you add editor, include this t:predicate attribute because only the first editor generates the list of editors.
    <editor t:predicate="[position() = 1]"/>
    -->
            <othercredit space-before="0.5em"/>
            <copyright space-before="0.5em"/>
            <legalnotice text-align="start" margin-left="0.5in" margin-right="0.5in" font-family="{$body.fontset}"/>
            <revision space-before="0.5em"/>
            <revhistory space-before="0.5em"/>
            <abstract space-before="0.5em" text-align="start" margin-left="0.5in" margin-right="0.5in" font-family="{$body.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="set" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:named-template="division.title" param:node="ancestor-or-self::set[1]" text-align="center" font-size="&hsize5;" space-before="&hsize5space;" font-weight="bold" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}" text-align="center"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="book" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:named-template="division.title" param:node="ancestor-or-self::book[1]" text-align="center" font-size="&hsize5;" space-before="&hsize5space;" font-weight="bold" font-family="{$title.fontset}"/>
            <subtitle text-align="center" font-size="&hsize4;" space-before="&hsize4space;" font-family="{$title.fontset}"/>
            <corpauthor font-size="&hsize3;" keep-with-next.within-column="always" space-before="2in"/>
            <authorgroup space-before="2in"/>
            <author font-size="&hsize3;" space-before="&hsize2space;" keep-with-next.within-column="always"/>
<!-- If you add editor, include this t:predicate attribute
           because only the first editor generates the list of editors.
      <editor t:predicate="[position() = 1]"/>
      -->
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
            <copyright/>
            <legalnotice xsl:use-attribute-sets="legalese.properties"/>
        </t:titlepage-content>
        <t:titlepage-separator>
            <fo:block break-after="page"/>
        </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
            <fo:block break-after="page"/>
        </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="part" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:named-template="division.title" param:node="ancestor-or-self::part[1]" text-align="center" font-size="&hsize5;" space-before="&hsize5space;" font-weight="bold" font-family="{$title.fontset}"/>
            <subtitle text-align="center" font-size="&hsize4;" space-before="&hsize4space;" font-weight="bold" font-style="italic" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="partintro" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title text-align="center" font-size="&hsize5;" font-weight="bold" space-before="1em" font-family="{$title.fontset}"/>
            <subtitle text-align="center" font-size="&hsize2;" font-weight="bold" font-style="italic" font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="reference" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:named-template="division.title" param:node="ancestor-or-self::reference[1]" text-align="center" font-size="&hsize5;" space-before="&hsize5space;" font-weight="bold" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}" text-align="center"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="refsynopsisdiv" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="refsection" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="refsect1" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="refsect2" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="refsect3" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="dedication" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::dedication[1]" margin-left="{$title.margin.left}" font-size="&hsize5;" font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
<!-- Same formatting as dedication -->
    <t:titlepage t:element="acknowledgements" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::acknowledgements[1]" margin-left="{$title.margin.left}" font-size="&hsize5;" font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="preface" t:wrapper="fo:block" font-family="{$title.fontset}">
        <t:titlepage-content t:side="recto" margin-left="{$title.margin.left}">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::preface[1]" font-size="&hsize5;" font-weight="bold" color="{$pantone202.primary.red}"/>
            <subtitle space-before="0.5em" font-style="italic" font-size="&hsize2;" font-weight="bold"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="chapter" t:wrapper="fo:block" font-family="{$title.fontset}">
        <t:titlepage-content t:side="recto" margin-left="{$title.margin.left}">
            <title t:named-template="chapappendix.title" param:node="ancestor-or-self::chapter[1]" font-size="&hsize5;" font-weight="bold" color="{$pantone202.primary.red}"/>
            <subtitle space-before="0.5em" font-style="italic" font-size="&hsize2;" font-weight="bold"/>
            <corpauthor space-before="0.5em" space-after="0.5em" font-size="&hsize2;"/>
            <authorgroup space-before="0.5em" space-after="0.5em" font-size="&hsize2;"/>
            <author space-before="0.5em" space-after="0.5em" font-size="&hsize2;"/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="appendix" t:wrapper="fo:block" font-family="{$title.fontset}">
        <t:titlepage-content t:side="recto" margin-left="{$title.margin.left}">
            <title t:named-template="chapappendix.title" param:node="ancestor-or-self::appendix[1]" font-size="&hsize5;" font-weight="bold" color="{$pantone202.primary.red}"/>
            <subtitle space-before="0.5em" font-style="italic" font-size="&hsize2;" font-weight="bold"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="section" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="sect1" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="sect2" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="sect3" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="sect4" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="sect5" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="simplesect" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title margin-left="{$title.margin.left}" font-family="{$title.fontset}"/>
            <subtitle font-family="{$title.fontset}"/>
            <corpauthor/>
            <authorgroup/>
            <author/>
            <othercredit/>
            <releaseinfo/>
            <copyright/>
            <legalnotice/>
            <pubdate/>
            <revision/>
            <revhistory/>
            <abstract/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="bibliography" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::bibliography[1]" margin-left="{$title.margin.left}" font-size="&hsize5;" font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="bibliodiv" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:named-template="component.title" param:node="ancestor-or-self::bibliodiv[1]" margin-left="{$title.margin.left}" font-size="&hsize4;" font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="glossary" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::glossary[1]" margin-left="{$title.margin.left}" font-size="&hsize5;" font-family="{$title.fontset}" font-weight="bold" color="{$pantone202.primary.red}"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="glossdiv" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:named-template="component.title" param:node="ancestor-or-self::glossdiv[1]" margin-left="{$title.margin.left}" font-size="&hsize4;" font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="index" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::index[1]" param:pagewide="1" margin-left="0pt" font-size="&hsize5;" font-family="{$title.fontset}" font-weight="bold" color="{$pantone202.primary.red}"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
<!-- The indexdiv.title template is used so that manual and -->
<!-- automatically generated indexdiv titles get the same -->
<!-- formatting. -->
    <t:titlepage t:element="indexdiv" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="indexdiv.title" param:title="title"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="setindex" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="component.title" param:node="ancestor-or-self::setindex[1]" param:pagewide="1" margin-left="0pt" font-size="&hsize5;" font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="colophon" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="chapappendix.title" margin-left="{$title.margin.left}" font-family="{$title.fontset}" param:node="ancestor-or-self::colophon[1]" font-size="&hsize5;" font-weight="bold" color="{$pantone202.primary.red}"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="sidebar" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title font-family="{$title.fontset}" font-weight="bold"/>
            <subtitle font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="qandaset" t:wrapper="fo:block" font-family="{$title.fontset}">
        <t:titlepage-content t:side="recto" start-indent="0pt" text-align="center">
            <title t:named-template="component.title" param:node="ancestor-or-self::qandaset[1]" keep-with-next.within-column="always" font-size="&hsize5;" font-weight="bold"/>
            <subtitle/>
            <corpauthor space-before="0.5em" font-size="&hsize2;"/>
            <authorgroup space-before="0.5em" font-size="&hsize2;"/>
            <author space-before="0.5em" font-size="&hsize2;"/>
            <othercredit space-before="0.5em"/>
            <releaseinfo space-before="0.5em"/>
            <copyright space-before="0.5em"/>
            <legalnotice text-align="start" margin-left="0.5in" margin-right="0.5in" font-family="{$body.fontset}"/>
            <pubdate space-before="0.5em"/>
            <revision space-before="0.5em"/>
            <revhistory space-before="0.5em"/>
            <abstract space-before="0.5em" text-align="start" margin-left="0.5in" margin-right="0.5in" font-family="{$body.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
  </t:titlepage-content>
        <t:titlepage-separator>
  </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
  </t:titlepage-before>
        <t:titlepage-before t:side="verso">
  </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
    <t:titlepage t:element="table.of.contents" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'TableofContents'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-family="{$title.fontset}" font-size="&hsize5;" font-weight="bold" color="{$pantone202.primary.red}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="list.of.tables" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'ListofTables'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-size="&hsize3;" font-weight="bold" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="list.of.figures" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'ListofFigures'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-size="&hsize3;" font-weight="bold" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="list.of.examples" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'ListofExamples'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-size="&hsize3;" font-weight="bold" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="list.of.equations" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'ListofEquations'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-size="&hsize3;" font-weight="bold" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="list.of.procedures" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'ListofProcedures'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-size="&hsize3;" font-weight="bold" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
    <t:titlepage t:element="list.of.unknowns" t:wrapper="fo:block">
        <t:titlepage-content t:side="recto">
            <title t:force="1" t:named-template="gentext" param:key="'ListofUnknown'" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" margin-left="{$title.margin.left}" start-indent="0pt" font-size="&hsize3;" font-weight="bold" font-family="{$title.fontset}"/>
        </t:titlepage-content>
        <t:titlepage-content t:side="verso">
    </t:titlepage-content>
        <t:titlepage-separator>
    </t:titlepage-separator>
        <t:titlepage-before t:side="recto">
    </t:titlepage-before>
        <t:titlepage-before t:side="verso">
    </t:titlepage-before>
    </t:titlepage>
<!-- ==================================================================== -->
</t:templates>
