#!/bin/bash

INPUT_DIR="$1"
OUTPUT_DIR="$2"

mkdir $OUTPUT_DIR
for filename in $(ls $INPUT_DIR/); do
    full_path=$INPUT_DIR/$filename
    echo $full_path
    ./midicsv $full_path | sed 's/2, 0, Program_c, 0, 121/2, 0, Program_c, 9, 121/' | awk -F, '{
      if ($1 == "2") {
        if ($3 == " Note_on_c" || $3 == " Note_off_c" || $3 == " Control_c" || $3 == " Program_c" || $3 == " Poly_aftertouch_c") {
          print $1","$2","$3", 9,"$5","$6
        } else if ($3 == " Pitch_bend_c" || $3 == " Pitch_bend_c" || $3 == " Pitch_bend_c" || $3 == " Channel_aftertouch_c") {
          print $1","$2","$3", 9,"$5
        } else {
          print $0
        }
      } else {
        print $0
      }
    }' | ./csvmidi >$OUTPUT_DIR/$filename
done
