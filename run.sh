#!/bin/bash
#
# Get the list of items in the .dotfiles directory
items=$(ls | grep -v -e "README.md" -e "installs" -e "run.sh" -e "update")

# Use gum filter to select items
selected_items=$(echo "$items" | gum choose --no-limit)

# Loop through each selected item and run stow
for item in $selected_items; do
  stow "$item"
  echo "Succesfully loaded $item"
done
