#!/bin/bash

target_dir="$1"
dest_dir="$2"

START_TIME="$(date "+%Y-%m-%d %H:%M:%S %3N")" #add %3N as we want millisecond too
START_TIME_SECONDS="$(date "+%s")"

echo ""
echo "======= Moving pictures ======="
echo "from:"
echo "    $target_dir"
echo "to:"
echo "    $dest_dir"
echo "date:"
echo "$START_TIME"
echo "==============================="
echo ""


echo ""
echo "Checkig if dest exists ($dest_dir)"
if [ -d "$dest_dir" ]; then
  echo "   dest exists"
else
  echo "   dest does not exist.  Creating"
  mkdir -p "$dest_dir"
fi
echo ""


./process-item.sh "$target_dir" "$dest_dir"


END_TIME="$(date "+%Y-%m-%d %H:%M:%S %3N")" #add %3N as we want millisecond too
END_TIME_SECONDS="$(date "+%s")"

echo ""
echo "======= Moving pictures DONE ======="
echo "date:"
echo "$END_TIME"  
echo "Took: $(expr $END_TIME_SECONDS - $START_TIME_SECONDS) Seconds"
echo "==============================="
echo ""