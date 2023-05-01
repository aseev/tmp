#!/usr/bin/ksh
# Read list.txt into an array
list=($(< exclusion_list.txt))

# Loop through each line of fed.txt
while read line; do
  # Check if the line starts with a number from list.txt
  for num in "${list[@]}"; do
    if [[ "$line" == $num* ]]; then
      # If it does, skip the line and move on to the next one
      continue 2
    fi
  done
  # If the line doesn't start with a number from list.txt, print it out
  echo "$line"
done < fed.txt > fed_filtered.txt