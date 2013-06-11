Publishing Toolset
==================

This repository contains a multi-platform publishing toolset, supporting OS X,
Linux, and Windows platforms.

The toolset accepts ASCIIDoc text files and transforms them to PDF, HTML, ePub
and other formats, applying corporate style and layout to the contents. It may
also be used, with little more effort, to transform XML to Docbook XML, which
can in turn be transformed to PDF, HTML, ePub and so on.

Configuration
=============

When publishing documents that have been configured to use this toolset,
`publish.sh` (OS X, Linux) and/or `publish.bat` (Windows) will first make a
call to `ptp-tools/init.sh` or `ptp-tools/init.bat`. To ensure that the
initialization file can be found, clone the repository as a sibling to the
publication directory or as a subdirectory in the publication directory. See
*Customization*, below, for alternatives.

The `_TEMPLATE` directory provides a template for new documents. It may be
copied to a directory of your choice. As described in the previous paragraph,
modify the publishing commands to point to the toolset directory. This can be
a relative or absolute path. If you rename the root document, you must also
modify the `DOCUMENT` name on line three.

Customization
=============

The toolset is preconfigured to provide standard corporate visual style to
documents. Changes that are unique to an individual document should be
performed in that document package, not to the toolset.

Documents configured to use this toolset have a `ptp-config` directory. Several
files provide “hooks” that will be called by the toolset. `asciidoc.conf` is
used in converting ASCIIDoc to Docbook XML; refer to the ASCIIDoc literature
for usage details. The `xsl/` directory provides DocBook-to-X customization;
refer to Bob Stayton's “DocBook XSL: The Complete Guide” for details.

The toolset has `ptp-site-defaults` directory, containing configuration and
support files that supplement or override settings and transformations
provided by the stock ASCIIDoc, Docbook XSL, and FOP tools:

`a2x.bash.conf`, `a2x.win.conf`: Configuration files for the ASCIIDoc `a2x`
tool.

`asciidoc.conf`: An ASCIIDoc configuration file. Imported *before*
`[doc]/ptp-config/asciidoc.conf`.

`asciidoc-replacements.conf`: An ASCIIDoc configuration file. Contains
replacements for product names &c, ensuring they use consistent spelling.
Imported *after* `ptp-site-defaults/asciidoc.conf` and
`[doc]/ptp-config/asciidoc.conf`.

`fonts/`: Contains font files used in PDF production. The FOP configuration
file (`fop.conf`) can also refer to fonts found on your system or in other
directories.

`fop.conf`: Configuration file for FOP, the PDF engine. The base and base-font
elements are modified by the `init.sh` or `init.bat` command when a document
is published.

`icons/`: Replacement icons for callouts and annotations used in the Docbook
transformation.

`images/`: Contains corporate logos and banners.

`publish.sh`, `publish.bat`: The scripts that drive the default publishing
process. These are typically called by the publication scripts packaged with
documents that use this publishing toolchain.

`xsl/`: Contains custom Docbook XSL parameters and templates, providing
consistent corporate visual style and structure to documents. These add to and
override the default `docbook-xsl` transformations found in `docbook-xsl`,
located in the toolset directory.

Directly Using the Tools
========================

The toolset is normally used by a document package to provide publishing
support for the document contents. See Configuration, above, to use the
toolset with a document package.

The tools can also be called independently. When doing so, several environment
variables must be configured before calling the tool by sourcing the `init.sh`
(Bash) or calling the `init.bat` (Windows) file.

Here is an example where an existing Docbook XML file is transformed to PDF and HTML:

    #!/bin/bash
    # Configure essential environment variables
    if [ -n "$PTP_TOOLS" ] ; then
      source $PTP_TOOLS/init.sh
    elif [ -e "../ptp-tools/init.sh" ] ; then
      source ../ptp-tools/init.sh
    elif [ -e "./ptp-tools/init.sh" ] ; then
      source ./ptp-tools/init.sh
    else
      echo "Unable to find publishing tools 'init.sh'" >&2
      exit 1
    fi
    
    filename=${1%.xml} # remove extension

    # transform from Docbook XML to pre-PDF XML:FO
    xsltproc --novalid --stringparam PTP_TOOLS "$PTP_TOOLS" --output \
    $filename.fo ptp-config/xsl/fo-article.xsl $filename.xml

    # transform from XML:FO to PDF
    fop -c $PTP_TOOLS/ptp-site-defaults/fop.bash.conf -fo $filename.fo -pdf \
    $filename.pdf

    # transform from XML:FO to XHTML
    xsltproc --stringparam navig.graphics 1 --novalid --stringparam PTP_TOOLS \
    "$PTP_TOOLS" --output $filename.html ptp-config/xsl/xhtml.xsl $filename.xml
