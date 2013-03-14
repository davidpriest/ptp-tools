@ECHO OFF
REM Use Strawberry Perl's portable shell launcher to set DOCTOOLS
SET here=%~dp0
SET DOCTOOLS=%here%
IF #%here:~-1%# == #\# SET DOCTOOLS=%here:~0,-1%

SET XMLSH=%DOCTOOLS%\xmlsh
SET PATH=%DOCTOOLS%\asciidoc;%DOCTOOLS%\fop;%DOCTOOLS%\xsltproc;%DOCTOOLS%\xmlsh\win32;%PATH%
SET XML_CATALOG_FILES=%DOCTOOLS%\CATALOG.XML

xsltproc --stringparam DOCTOOLS %DOCTOOLS% %DOCTOOLS%\init.xsl %DOCTOOLS%\mksupport-common\fop.conf.template > %DOCTOOLS%\mksupport-common\fop.win.conf
