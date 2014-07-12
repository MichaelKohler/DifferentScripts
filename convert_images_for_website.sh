#!/bin/sh
SIZE=$1
SIZE2=$2
FORMAT=$3
for image_file in *.$FORMAT
do
convert $image_file -resize $SIZEx$SIZE2 -format $FORMAT 'resized_'$image_file
done
