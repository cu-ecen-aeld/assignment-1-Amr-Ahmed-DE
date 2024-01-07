#!/bin/bash

# Check if two arguments were provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required." >&2
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Extract the directory path from the full filepath
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't exist
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory '$dirpath'." >&2
        exit 1
    fi
fi

# Write the string to the file, creating or overwriting the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to '$writefile'." >&2
    exit 1
fi

echo "File '$writefile' created successfully with the content."

