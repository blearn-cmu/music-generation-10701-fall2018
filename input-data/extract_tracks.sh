#!/bin/sh

mkdir nesmdb_midi_tracks
mkdir nesmdb_midi_tracks/p1
mkdir nesmdb_midi_tracks/p2
mkdir nesmdb_midi_tracks/tr
mkdir nesmdb_midi_tracks/no

for dirA in $(ls nesmdb_midi); do
  #echo $dirA
  mkdir nesmdb_midi_tracks/p1/$dirA
  mkdir nesmdb_midi_tracks/p2/$dirA
  mkdir nesmdb_midi_tracks/tr/$dirA
  mkdir nesmdb_midi_tracks/no/$dirA
  for filename in $(ls nesmdb_midi/$dirA); do
      full_path=nesmdb_midi/$dirA/$filename
      echo $full_path
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 2/' | grep -E "^[0|1|2]," | ./csvmidi >nesmdb_midi_tracks/p1/$dirA/$filename
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 2/' | grep -E "^[0|1|3]," | ./csvmidi >nesmdb_midi_tracks/p2/$dirA/$filename
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 2/' | grep -E "^[0|1|4]," | ./csvmidi >nesmdb_midi_tracks/tr/$dirA/$filename
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 2/' | grep -E "^[0|1|5]," | ./csvmidi >nesmdb_midi_tracks/no/$dirA/$filename
  done
done
