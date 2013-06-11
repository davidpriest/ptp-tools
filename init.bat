@ECHO OFF
REM Use Strawberry Perl's portable shell launcher to set PTP_TOOLS
SET here=%~dp0
SET PTP_TOOLS=%here%
IF #%here:~-1%# == #\# SET PTP_TOOLS=%here:~0,-1%

SET XMLSH=%PTP_TOOLS%\xmlsh
SET PATH=%PTP_TOOLS%\asciidoc;%PTP_TOOLS%\fop;%PTP_TOOLS%\xsltproc;%PTP_TOOLS%\xmlsh\win32;%PATH%
SET XML_CATALOG_FILES=%PTP_TOOLS%\CATALOG.XML

xsltproc --stringparam PTP_TOOLS %PTP_TOOLS% %PTP_TOOLS%\init.xsl %PTP_TOOLS%\ptp-site-defaults\fop.conf.template > %PTP_TOOLS%\ptp-site-defaults\fop.win.conf
