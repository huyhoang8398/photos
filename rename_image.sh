#!/bin/bash

# Ensure we're in the correct directory
shopt -s nullglob # Prevent errors if no .jpg files exist

# Check if directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir="$1"

# Change to the specified directory
cd "$dir" || { echo "Directory not found!"; exit 1; }

# Get all jpg files and sort them
files=(*.jpg)

# Counter to rename files sequentially
counter=1

# Loop through each file and rename it
for file in "${files[@]}"; do
    mv "$file" "$counter.jpg"
    ((counter++))
done

echo "Renaming completed!"