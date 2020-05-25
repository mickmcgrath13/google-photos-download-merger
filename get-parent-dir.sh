#!/bin/bash

p="$1"
p="$(dirname "$p")"
p="$(./last-path-part.sh "$p")"
echo "$p"