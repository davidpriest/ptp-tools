#!/bin/bash
DOCUMENT=_Userguide.txt
export DOCTOOLS=$PWD/..

$DOCTOOLS/mksupport-common/mk_bash.sh $DOCUMENT -d book
