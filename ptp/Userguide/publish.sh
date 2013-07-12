#!/bin/bash
#davidpriest.ca
DOCUMENT=_Userguide.txt

# Set PTP_TOOLS explicitly, because the User Guide lives deep inside the repo.
PTP_TOOLS=../../..

if [ -n "$PTP_TOOLS" ] ; then
  source $PTP_TOOLS/init.sh
elif [ -e "../init.sh" ] ; then
  source ../init.sh
elif [ -e "./ptp-tools/init.sh" ] ; then
  source ./ptp-tools/init.sh
else
  echo "Unable to find publishing tools 'init.sh'" >&2
  exit 1
fi

$PTP_TOOLS/ptp/publish_adoc.sh $DOCUMENT -d book
