#!/bin/bash

# This script demonstrates a subtle race condition.

# Create a temporary file
tmpfile=$(mktemp)

# Write some data to the file in the background
echo "Hello" > "$tmpfile" &

# Immediately try to read the file
content=$(cat "$tmpfile")

# Print the content.  The output might be empty because
# the background process hasn't finished writing yet
echo "Content: $content"

# Clean up the temporary file
rm "$tmpfile"