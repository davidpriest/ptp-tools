REM @ECHO OFF
REM The following values are set in the source directory's publish.bat stub
REM DOCUMENT=_The_Root_Document.txt
REM PTP_TOOLS=%CD%\..

REM Do not modify below this line

SETLOCAL

set DOCUMENT=%1
set EXTRA=%2 %3 %4 %5 %6 %7 %8 %9

IF "%PTP_TOOLS%"=="" CALL ..\init.bat

rd /q /s %CD%\output
md %CD%\output

REM a2x commands are similar for all output
set cmdrest=--conf-file=%PTP_TOOLS%\ptp\a2x.win.conf --icons-dir=%PTP_TOOLS%\ptp\icons --resource=%PTP_TOOLS%\ptp\images --no-xmllint --safe %EXTRA% %DOCUMENT%

echo Transforming to Draft PDF
a2x.py -k -v -v -f pdf --fop --xsl-file=ptp-config\xsl\fo.xsl --destination-dir=output %cmdrest%

echo Transforming to EPub
a2x.py -k -f epub --xsl-file=ptp-config\xsl\epub.xsl --destination-dir=output %cmdrest%

REM echo Transforming to Chunked HTML
REM errors w/a2x: ERROR: absolute resource file name: /Users/dpriest/dev/ptp-tools/ptp/icons/home.png
REM a2x.py -k -f chunked --xsl-file=ptp-config\xsl\chunked.xsl --destination-dir=output %cmdrest%

echo Transforming to XHTML
md output\html
a2x.py -f xhtml --xsl-file=ptp-config\xsl\xhtml.xsl --destination-dir=output\html %cmdrest%

REM echo Transforming to HTMLHelp/CHM
REM md output\chm
REM a2x.py -f htmlhelp --stylesheet="docbook-xsl.css ptp-config/custom.css" --destination-dir=output\chm %cmdrest%

ENDLOCAL