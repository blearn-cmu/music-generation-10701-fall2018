#!/bin/bash

INPUT_DIR="$1"
OUTPUT_DIR="$2"
# SED_STR="'s/2, 0, Program_c, 0, 0/2, 0, Program_c, 2, 38/g'"

mkdir $OUTPUT_DIR
for filename in $(ls $INPUT_DIR/); do
    full_path=$INPUT_DIR/$filename
    echo $full_path
    ./midicsv $full_path | sed 's/2, 0, Program_c, 0, 0/2, 0, Program_c, 0, 38/g' | ./csvmidi >$OUTPUT_DIR/$filename
done
