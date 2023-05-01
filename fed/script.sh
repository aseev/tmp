#!/usr/bin/ksh
remove_lines_starting_with_digits() {
  if [ $# -ne 2 ]; then
    echo "Usage: remove_lines_starting_with_digits <file-to-clean> <file-with-digits-to-remove>"
    return 1
  fi
  
  # Check if both files exist and are readable
  if [ ! -r "$1" ]; then
    echo "Error: $1 does not exist or is not readable"
    return 1
  fi
  
  if [ ! -r "$2" ]; then
    echo "Error: $2 does not exist or is not readable"
    return 1
  fi
  
  while read -r line; do
	echo "$line"
	sed -i "/^$line/d" "$1"
  done < "$2"
}

remove_lines_starting_with_digits fed.txt exclusion_list.txt