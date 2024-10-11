#!/bin/bash

# Part a: List files containing "sample" and at least 3 occurrences of "CSC510"
grep -rl 'sample' . | while read -r file; do
    count=$(grep -o 'CSC510' "$file" | wc -l)
    if [ "$count" -ge 3 ]; then
        echo "$file:$count"  # Output filename and count separated by ':'
    fi
done | \

# Part b: Sort by occurrence count and then by file size
gawk -F: '{ print $1, $2 }' | while read -r file count; do
    filesize=$(stat -c%s "$file")
    echo "$file $count $filesize"
done | sort -k2,2nr -k3,3nr | \

# Part c: Substitute "file_" with "filtered_"
while read -r file count filesize; do
    new_file=$(echo "$file" | sed 's/file_/filtered_/')
    echo "$new_file"
done

