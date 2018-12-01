INPUT_DIRECTORY=../../../input-data/nesmdb_midi_tracks/p1/train/

# TFRecord file that will contain NoteSequence protocol buffers.
SEQUENCES_TFRECORD=trainnotesequences.tfrecord

convert_dir_to_note_sequences.py \
  --input_dir=$INPUT_DIRECTORY \
  --output_file=$SEQUENCES_TFRECORD \
  --recursive
