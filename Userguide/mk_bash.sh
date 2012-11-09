#!/bin/bash
export DOCTOOLS=$PWD/../tools
DOCUMENT=_Userguide.txt

$DOCTOOLS/mksupport-common/mk_bash.sh $DOCUMENT -d book
