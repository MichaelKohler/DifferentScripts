#!/bin/zsh
SIZE=$1
FORMAT=$2
for image_file in *.$FORMAT
do
convert $image_file -resize $SIZEx$SIZE -format $FORMAT 'resized_'$image_file
done
