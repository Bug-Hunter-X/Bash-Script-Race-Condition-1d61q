#!/bin/bash

# This script demonstrates a corrected version with proper synchronization.

# Create a temporary file
tmpfile=$(mktemp)

# Write some data to the file in the background
echo "Hello" > "$tmpfile" &
pid=$!

# Wait for the background process to finish
wait $pid

# Read the file
content=$(cat "$tmpfile")

# Print the content
echo "Content: $content"

# Clean up the temporary file
rm "$tmpfile"