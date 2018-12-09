#!/bin/bash

INPUT_DIR="$1"

for filename in $(ls *.wav); do
    echo $filename
    lame $filename $(echo $filename | sed 's/.wav/.mp3/')
#    timidity $filename -Ow -o $(echo $filename | sed 's/.mid/.wav/')
done
