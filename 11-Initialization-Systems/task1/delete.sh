#!/bin/bash


if [ -d "$HOME/TRASH" ]; then
	find "$HOME/TRASH" -type f -mtime +2 -delete
else
	mkdir -p "$HOME/TRASH"
fi

if [ -z "$1" ]; then
	echo "Error: argument not passed"
	exit 1
fi

if [ -L "$1" ]; then
	ORIGINAL=$(readlink "$1")
	echo "This is a symlink and will be deleted, original file in $ORIGINAL remains."
	rm "$1"
	exit 0
fi

LINKS_COUNT=$(stat -c %h "$1")

if [ "$LINKS_COUNT" -gt 1 ]; then
	INODE=$(stat -c %i "$1")
	rm "$1"
	echo "Other hard links to this file:"
	find "$(dirname "$1")" -inum "$INODE" 2>/dev/null
	exit 0
fi
if [ -f "$1" ]; then
	filename=$(basename "$1")
	newname="${filename}_$(date +%Y%m%d_%H%M%S)"
	mv "$1" "$HOME/TRASH/$newname"
	command -v gzip >/dev/null 2>&1 || {
		echo "Error: gzip is not installed"
		exit 1
	}
	gzip "$HOME/TRASH/$newname"
	exit 0
fi

if [ -d "$1" ]; then
	dir_name=$(basename "$1")
	archive_name="${dir_name}_$(date +%Y%m%d_%H%M%S).tar.gz"
	tar -czf "$HOME/TRASH/$archive_name" -C "$(dirname "$1")" "$(basename "$1")"
	rm -rf "$1"
	exit 0
fi

echo "Error: argument is not a file or directory"
exit 1

