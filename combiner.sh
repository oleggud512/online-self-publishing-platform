#!/bin/zsh

# Set the NULL_GLOB option to handle empty directories
setopt NULL_GLOB

dir_path=$1
file_name=$2

# Function to recursively list all files in a directory and its subdirectories
list_files() {
  local directory="$1"
  local output_file="$2"

  # Loop over all files and directories in the given directory
  for file in "$directory"/*; do
    # Check if the file is a directory
    if [[ -d "$file" ]]; then
      # If it's a directory, call the function recursively
      list_files "$file" "$output_file"
    else
      # Check if the file ends with .freezed.dart or .g.dart and exclude it if it does
      if [[ "$file" == *".freezed.dart" ]] || [[ "$file" == *".g.dart" ]] || [[ "$file" == *".css" ]] || [[ "$file" == *".css.map" ]] || [[ "$file" == *".g.css" ]]; then
        continue
      fi

      # If it's a file, write its path and content to the output file
      echo -e "\n$file\n" >> "$output_file"
      cat "$file" >> "$output_file"
      echo -e "\n" >> "$output_file"
    fi
  done
}

# Call the function to list all files in the directory and its subdirectories
list_files "$dir_path" "$file_name"
