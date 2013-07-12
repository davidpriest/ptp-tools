REM @ECHO OFF
REM DOCUMENT=_The_Root_Document.txt
REM set DOCTOOLS=%CD%\..

REM The values above are set in the source directory's mk_win.bat stub
REM Configure values above; do not modify below this line

SETLOCAL

set DOCUMENT=%1
set EXTRA=%2 %3 %4 %5 %6 %7 %8 %9

echo ==> DEPRECATED PUBLISHING COMMAND <==
echo ==> Please use publish_adoc.bat <==

IF "%DOCTOOLS%"=="" CALL ..\init.bat

rd /q /s %CD%\output
md %CD%\output

REM a2x commands are similar for all output
set cmdrest=--conf-file=%DOCTOOLS%\ptp\a2x.win.conf --icons-dir=%DOCTOOLS%\ptp\icons --resource=%DOCTOOLS%\ptp\images --no-xmllint --safe %EXTRA% %DOCUMENT%

echo Transforming to Draft PDF
a2x.py -k -v -v -f pdf --fop --xsl-file=ptp-config\xsl\fo.xsl --destination-dir=output %cmdrest%

echo Transforming to EPub
a2x.py -k -f epub --xsl-file=ptp-config\xsl\epub.xsl --destination-dir=output %cmdrest%

echo Transforming to Chunked HTML
a2x.py -k -f chunked --xsl-file=ptp-config\xsl\chunked.xsl --destination-dir=output %cmdrest%

echo Transforming to XHTML
md output\html
a2x.py -f xhtml --xsl-file=ptp-config\xsl\xhtml.xsl --destination-dir=output\html %cmdrest%

REM echo Transforming to HTMLHelp/CHM
REM md output\chm
REM a2x.py -f htmlhelp --stylesheet="docbook-xsl.css ptp-config/custom.css" --destination-dir=output\chm %cmdrest%

echo ==> DEPRECATED PUBLISHING COMMAND <==
echo ==> Please use publish_adoc.bat <==

ENDLOCAL