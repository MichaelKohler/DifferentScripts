#!/bin/bash
FILES=$(find . -name test_*.rb)

for f in $FILES
do
  ruby $f
done
