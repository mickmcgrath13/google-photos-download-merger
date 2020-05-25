#!/bin/bash

p="$1"

p="${p%*/}"      # remove the trailing "/"
p="${p##*/}"    # get everything after the final "/"
echo "$p"