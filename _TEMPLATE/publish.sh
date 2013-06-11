#!/bin/bash
DOCUMENT=_The_Root_Document.txt

if [ -n "$PTP_TOOLS" ] ; then
  source $PTP_TOOLS/init.sh
elif [ -e "../ptp-tools/init.sh" ] ; then
  source ../ptp-tools/init.sh
elif [ -e "./ptp-tools/init.sh" ] ; then
  source ./ptp-tools/init.sh
else
  echo "Unable to find publishing tools: ptp-tools\init.sh" >&2
  exit 1
fi

$PTP_TOOLS/ptp-site-defaults/publish.sh $DOCUMENT -d book
