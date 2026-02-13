#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: argument not passed"
	exit 1
fi

if [ -L "$1" ]; then
	ORIGINAL=$(realpath "$1")
	rm "$1"
    cat "$ORIGINAL" > "$1"
    echo "$1 is now a regular file"
    exit 0
fi