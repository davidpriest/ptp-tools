REM @ECHO OFF
REM DOCUMENT=_ReleaseNotes.txt
REM set DOCTOOLS=%CD%\..\tools

REM The values above are set in the source directory's mk_win.bat stub

set XML_DEBUG_CATALOG=1

set DOCUMENT=%1
set EXTRA=%~2
set XML_CATALOG_FILES=%DOCTOOLS%\CATALOG.XML
IF NOT _%TOOLPATHREST%==_1 set PATH=%DOCTOOLS%\fop;%DOCTOOLS%\asciidoc;%DOCTOOLS%\xsltproc;%PATH%
set TOOLPATHREST=1

rd /q /s output
md output

REM a2x commands are similar for all output
set cmdrest=--conf-file=%DOCTOOLS%\mksupport-common\a2x.win.conf --no-xmllint %EXTRA% --safe %DOCUMENT%

echo Transforming to Draft PDF
a2x.py -k -v -v -f pdf --fop --xsl-file=%CD%\mksupport\xsl\fo.xsl --destination-dir=output %cmdrest%

echo Transforming to EPub
a2x.py -k -f epub --xsl-file=mksupport\xsl\epub.xsl --destination-dir=output %cmdrest%

echo Transforming to Chunked HTML
a2x.py -k -f chunked --xsl-file=mksupport\xsl\chunked.xsl --destination-dir=output %cmdrest%

echo Transforming to XHTML
md output\xhtml
a2x.py -f xhtml --xsl-file=mksupport\xsl\xhtml.xsl --destination-dir=output\xhtml %cmdrest%

echo Transforming to HTMLHelp/CHM
md output\chm
a2x.py -f htmlhelp --stylesheet="docbook-xsl.css mksupport/custom.css" --destination-dir=output\chm %cmdrest%