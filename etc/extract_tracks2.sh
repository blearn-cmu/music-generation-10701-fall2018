#!/bin/sh

mkdir allbutno
mkdir allbutp

for dirA in $(ls nesmdb_midi); do
  #echo $dirA
  mkdir allbutno/$dirA
  mkdir allbutp/$dirA
  for filename in $(ls nesmdb_midi/$dirA); do
      full_path=nesmdb_midi/$dirA/$filename
      echo $full_path
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 4/' | grep -E "^[0|1|2|3|4]," | ./csvmidi >allbutno/$dirA/$filename
      ./midicsv $full_path | sed 's/0, 0, Header, 1, 5/0, 0, Header, 1, 3/' | grep -E "^[0|3|4|5]," | ./csvmidi >allbutp/$dirA/$filename
  done
done
