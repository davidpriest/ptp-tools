@ECHO OFF

if defined PTP_TOOLS (
  call %PTP_TOOLS%/init.bat
) else if exist ../ptp-tools/init.bat (
  call ../tools/init.bat
) else if exist ./ptp-tools/init.bat (
  call ./ptp-tools/init.bat
) else (
  echo "Unable to find publishing tools: 'ptp-tools\init.bat'"
  goto :eof
)

%DOCTOOLS%\ptp-site-defaults\publish.bat _The_Root_Document.txt -d book
