REM DOCUMENT=_ReleaseNotes.txt
REM set DOCTOOLS=%CD%\..\tools

REM The values above are set in the source directory's mk_win.bat stub

DOCUMENT=%1
shift
EXTRA=%*
set XML_CATALOG_FILES=%DOCTOOLS%\CATALOG.XML
set PATH=%DOCTOOLS%\fop;%DOCTOOLS%\asciidoc;%PATH%

rd /s output
md output

# a2x commands are similar for all output
cmdrest="--conf-file=%DOCTOOLS%\mksupport\a2x.bash.conf --no-xmllint -d book --safe _Redline_User_Guide.txt"

echo "Transforming to Draft PDF"
a2x.py -f pdf --fop --xsl-file=mksupport\xsl\fo.xsl --destination-dir=output %cmdrest%

echo "Transforming to EPub"
a2x.py -f epub --xsl-file=mksupport\xsl\epub.xsl --destination-dir=output %cmdrest%

echo "Transforming to Chunked HTML"
a2x.py -f chunked --xsl-file=mksupport\xsl\chunked.xsl --destination-dir=output %cmdrest%

echo "Transforming to XHTML"
md output\xhtml
a2x.py -f xhtml --xsl-file=mksupport\xsl\xhtml.xsl --destination-dir=output\xhtml %cmdrest%

echo "Transforming to HTMLHelp/CHM"
md output\chm
a2x.py -f htmlhelp --stylesheet="docbook-xsl.css mksupport\custom.css" --destination-dir=output\chm %cmdrest%