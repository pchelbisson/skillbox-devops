# delete.sh

## Description
`delete.sh` is a Bash script for safely deleting files while handling links:
(UPDATE 9 PRACTICE CHALLENGE)
- **Symbolic links** are removed without affecting the original file; the script prints the path to the original.  
- **Hard links** are deleted normally; the script prints a list of all other links to the same file.  

## Usage
```bash
./delete.sh <filename>