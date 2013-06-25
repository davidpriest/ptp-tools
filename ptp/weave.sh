#!/bin/bash
# Do not modify below this line

#strip extension
DIR=$(dirname $1)
DOCUMENT=$(basename $1 .txt)
shift
EXTRA=$*

mkdir -p output
rm -rf output/*

./weave_adoc.sh $DIR/$DOCUMENT.txt $EXTRA && ./weave_db4.sh output/$DOCUMENT.xml
