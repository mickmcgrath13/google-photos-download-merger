#!/bin/bash

d="$1"
out=""

# check if parent_dir starts with format "yyyy-mm-dd"
if [ -n "$d" ]; then
	date_regex='([0-9]{4}-[0-9]{2}-[0-9]{2})'

	[[ "$d" =~ $date_regex ]]
	out="${BASH_REMATCH[0]}"
fi

echo "$out"