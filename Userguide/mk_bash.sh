#!/bin/bash
DOCUMENT=_Userguide.txt
DOCTOOLS=..

if [ -n "$DOCTOOLS" ] ; then
  source $DOCTOOLS/init.sh
elif [ -e "../ptp-tools/init.sh" ] ; then
  source ../ptp-tools/init.sh
elif [ -e "./ptp-tools/init.sh" ] ; then
  source ./ptp-tools/init.sh
else
  echo "Unable to find publishing tools 'init.sh'" >&2
  exit 1
fi

$DOCTOOLS/mksupport-common/mk_bash.sh $DOCUMENT -d book
