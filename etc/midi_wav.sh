#!/bin/bash

INPUT_DIR="$1"

for filename in $(ls *.mid); do
    echo $filename
    timidity $filename -Ow -o $(echo $filename | sed 's/.mid/.wav/')
done
