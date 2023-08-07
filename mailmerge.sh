#!/bin/bash

# Check if the script is used correctly
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <data_file> <template_file>"
    exit 1
fi

data_file=$1
template_file=$2

# Check if data file exists
if [ ! -f "$data_file" ]; then
    echo "Data file not found: $data_file"
    exit 1
fi

# Check if template file exists
if [ ! -f "$template_file" ]; then
    echo "Template file not found: $template_file"
    exit 1
fi

# Read the first line of the data file to get the variable names
IFS='|' read -r -a variables < "$data_file"

# Process each line in the data file and generate TEX files
count=0
while IFS='|' read -r -a values; do
    count=$((count + 1))
    # Skip the first line containing variable names
    if [ "$count" -eq 1 ]; then
        continue
    fi
	output_file="${values[0]}_${values[1]}\$report_$((count - 1)).tex"

    # Copy the template content to the output file
    cp "$template_file" "$output_file"

    # Replace variables in the output file with corresponding values from data
    for ((i = 0; i < ${#variables[@]}; i++)); do
        sed -i "s|%${variables[i]}%|$(sed 's/[&/\]/\\&/g' <<< "${values[i]}")|g" "$output_file"
    done

    echo "Generated $output_file"
done < "$data_file"
