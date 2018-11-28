#!/bin/sh

# Track, Time, Note_on_c,            Channel, Note,        Velocity
# Track, Time, Note_off_c,           Channel, Note,        Velocity
# Track, Time, Pitch_bend_c,         Channel, Value
# Track, Time, Control_c,            Channel, Control_num, Value
# Track, Time, Program_c,            Channel, Program_num
# Track, Time, Channel_aftertouch_c, Channel, Value
# Track, Time, Poly_aftertouch_c,    Channel, Note,        Value

mkdir nonodrumchan

for dirA in $(ls nesmdb_midi); do
  #echo $dirA
  mkdir nonodrumchan/$dirA
  for filename in $(ls nesmdb_midi/$dirA); do
      full_path=nesmdb_midi/$dirA/$filename
      echo $full_path
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 2/' | sed 's/5, 0, Program_c, 9, 121/5, 0, Program_c, 0, 80/' | grep -E "^[0|1|5]," | awk -F, '{
        if ($1 == "5") {
          if ($3 == " Note_on_c" || $3 == " Note_off_c" || $3 == " Control_c" || $3 == " Program_c" || $3 == " Poly_aftertouch_c") {
            print $1","$2","$3", 0,"$5","$6
          } else if ($3 == " Pitch_bend_c" || $3 == " Pitch_bend_c" || $3 == " Pitch_bend_c" || $3 == " Channel_aftertouch_c") {
            print $1","$2","$3", 0,"$5
          } else {
            print $0
          }
        } else {
          print $0
        }
      }' | ./csvmidi >nonodrumchan/$dirA/$filename
  done
done
