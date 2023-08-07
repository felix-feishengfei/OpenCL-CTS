#!/bin/bash

# define source and target directory
source_dir="${CMAKE_CURRENT_BINARY_DIR}"
target_dir="${DIST_OUTPUT_DIRECTORY}"

# create destination directory
mkdir -p "${target_dir}"

# filter unnecessary suffix
file_extensions=("dir" "o" "a" "cmake" "d" "dir" "marks")
exclude_files=()

for ext in "${file_extensions[@]}"; do
    exclude_files+=( "--exclude=*.${ext}" )
done

# filter more files
exclude_files+=( "--exclude=Makefile" )
exclude_files+=( "--exclude=CMakeFiles" )

# copy to destination directory by rsync
# echo "copy command:rsync -av \"${exclude_files[@]}\" \"${source_dir}/\" \"${target_dir}/\""
rsync -a "${exclude_files[@]}" "${source_dir}/" "${target_dir}/"
