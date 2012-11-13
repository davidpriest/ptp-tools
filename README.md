Publishing Toolset
==================

This repository contains a multi-platform publishing toolset, supporting OS X,
Linux, and Windows platforms.

The toolset accepts ASCIIDoc text files and transforms them to PDF, HTML, ePub
and other formats, applying MANDIANT style and layout to the contents. It may
also be used, with more effort, to transform XML to Docbook XML, which can in
turn be transformed to PDF, HTML, ePub and so on.

Configuration
=============

After cloning the repository to a directory, use a plain text editor to update
`mksupport-common/fop.bash.conf` (OS X, Linux) and/or
`mksupport-common/fop.win.conf` (Windows). On line four, set the `font-base`
path value to point to the root of the toolset directory. This must be an
absolute path.

When publishing documents that have been configured to use this toolset, you
must edit the publishing command for that document. Using a plain text editor,
modify `mk_bash.sh` (OS X, Linux) and/or `mk_win.bat` (Windows). On line two,
modify the `DOCTOOLS` path value to point to the toolset directory.

The `Userguide` directory provides a template for new documents. It may be
copied to a directory of your choice. As described in the previous paragraph,
modify the publishing commands to point to the toolset directory. This can be
a relative or absolute path. If you rename the root document, you must also
modify the `DOCUMENT` name on line three.

Customization
=============

The toolset is preconfigured to provide standard MANDIANT visual style to
documents. Changes that are unique to an individual document should be
performed in that document package, not to the toolset.

Documents configured to use this toolset have a `mksupport` directory. Several
files provide “hooks” that will be called by the toolset. `asciidoc.conf` is
used in converting ASCIIDoc to Docbook XML; refer to the ASCIIDoc literature
for usage details. The `xsl/` directory provides DocBook-to-X customization;
refer to Bob Stayton's “DocBook XSL: The Complete Guide” for details.

The toolset has `mksupport-common` directory, containing configuration and
support files that supplement or override settings and transformations
provided by the stock ASCIIDoc, Docbook XSL, and FOP tools:

`a2x.bash.conf`, `a2x.win.conf`: Configuration files for the ASCIIDoc `a2x`
tool.

`asciidoc-replacements.conf`: An ASCIIDoc configuration file. Contains
replacements for product names &c, ensuring they use consistent spelling.
Imported *after* `mksupport-common/asciidoc.conf` and
`[doc]/mksupport/asciidoc.conf`.

`asciidoc.conf`: An ASCIIDoc configuration file. Imported *before*
`[doc]/mksupport/asciidoc.conf`.

`fonts/`: Contains font files used in PDF production. The FOP configuration
files (`fop.*.conf`) can also refer to fonts found on your system or in other
directories.

`fop.bash.conf`, `fop.win.conf`: Configuration files for FOP, the PDF engine.

`icons/`: Replacement icons for callouts and annotations, used in the Docbook
transformation.

`images/`: Contains MANDIANT logos and banners.

`mk_bash.sh`, `mk_win.bat`: The scripts that drive the default publishing
process. These are called by the publication scripts packaged with documents
that use this publishing toolchain.

`xsl/`: Contains custom Docbook XSL parameters and templates, providing
consistent MANDIANT visual style and structure to documents. These add to and
override the default `docbook-xsl` transformations found in `docbook-xsl`,
located in the toolset directory.

Directly Using the Tools
========================

The toolset is normally used by a document package to provide publishing
support for the document contents. See Configuration, above, to use the
toolset with a document package.

The tools can also be called independently. When doing so, several environment
variables must be configured before calling the tool:

`DOCTOOLS`: the path to the toolset root directory.

`PATH`: paths to the tools in the toolset root directory

`XML_CATALOG_FILES`: path to the XML catalog used by the toolset, used to
convert Docbook URIs to local file references.

Here is an example where an existing Docbook XML file is transformed to PDF and HTML:

    #!/bin/bash
    # Configure essential environment variables
    export DOCTOOLS=$PWD/../tools
    export PATH=$DOCTOOLS/xmlsh/unix:$DOCTOOLS/fop:$PATH
    export XML_CATALOG_FILES=$DOCTOOLS/CATALOG.XML

    filename=${1%.xml} # remove extension

    # transform from Docbook XML to pre-PDF XML:FO
    xsltproc --novalid --stringparam DOCTOOLS "$DOCTOOLS" --output \
    $filename.fo mksupport/xsl/fo-article.xsl $filename.xml

    # transform from XML:FO to PDF
    fop -c $DOCTOOLS/mksupport-common/fop.bash.conf -fo $filename.fo -pdf \
    $filename.pdf

    # transform from XML:FO to XHTML
    xsltproc --stringparam navig.graphics 1 --novalid --stringparam DOCTOOLS \
    "$DOCTOOLS" --output $filename.html mksupport/xsl/xhtml.xsl $filename.xml
