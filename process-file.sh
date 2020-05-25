#!/bin/bash

target_file="$1"
dest_dir="$2"


if [ ! -f "$target_file" ]; then
  echo "    is not file: $target_file"
  exit 0
fi

echo "Processing file:"
echo "    $target_file"

parent_dir="$(./get-parent-dir.sh "$target_file")"
dest_dir_full="$dest_dir/$parent_dir"
mkdir -p "$dest_dir_full"



# echo "    Check if file exists"
dest_file="$(./last-path-part.sh "$target_file")"
dest_file_full="$dest_dir_full/$dest_file"
while [ -f "$dest_file_full" ]; do
  dest_file="0_${dest_file}"
  dest_file_full="$dest_dir_full/$dest_file"
  echo "        File already exists ($dest_file_full)."
  echo "            Renaming:"
  echo "            $dest_file"
done

if [ -n "$IMAGE_ORGANIZER_MOVE" ]; then
  echo "    MOVING:"
  echo "        from: $target_file"
  echo "        to: $dest_file_full"
  mv "$target_file" "$dest_file_full"
else
  echo "    COPYING:"
  echo "        from: $target_file"
  echo "        to: $dest_file_full"
  cp "$target_file" "$dest_file_full"
fi
