#!/bin/bash

target_dir="$1"
dest_dir="$2"

echo "Processing directory:"
echo "    $target_dir"
for i in "$target_dir"/*
do
  # echo ""
  # echo "iterating: $target_dir"
  ./process-item.sh "$i" "$dest_dir"
done
