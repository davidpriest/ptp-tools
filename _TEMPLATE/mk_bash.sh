#!/bin/bash
DOCUMENT=_RootDocument.txt
export DOCTOOLS=$PWD/../ptp-tools

$DOCTOOLS/mksupport-common/mk_bash.sh $DOCUMENT -d book
