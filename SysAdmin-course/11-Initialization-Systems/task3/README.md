# Convert Symlink to Regular File

This script converts a symbolic link into a regular file with the same content as the file it points to.

## What it does

Checks if the argument is provided.

Verifies that the file is a symbolic link.

Resolves the target file path.

Reads the content of the target file.

Deletes the symbolic link.

Creates a regular file with the same name and writes the target’s content into it.

## Result

After running the script, the symbolic link is replaced by a regular file containing the original data, while the target file remains unchanged.