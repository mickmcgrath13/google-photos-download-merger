#!/bin/bash

target_item="$1"
dest_dir="$2"

echo ""
echo ""
echo ""
# echo "Processing item (file or directory?):"
# echo "    $target_item"
if [ -d "$target_item" ]; then
  # echo "    is directory"
  ./process-directory.sh "$target_item" "$dest_dir"
elif [ -f "$target_item" ]; then
  # echo "    is file"
  ./process-file.sh "$target_item" "$dest_dir"
else
  echo "    Not processing $target_item"
  echo "    neither file nor directory"
fi
