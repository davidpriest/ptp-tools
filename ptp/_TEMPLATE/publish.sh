#!/bin/bash
#davidpriest.ca
DOCUMENT=_RootDoc.txt

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

$PTP_TOOLS/ptp/publish_adoc.sh $DOCUMENT -d book
