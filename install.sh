#!/bin/bash
#
# Get the list of items in the .dotfiles directory
items=$(ls | grep -v -e "install.sh" -e "README.md")

# Use gum filter to select items
selected_items=$(echo "$items" | gum choose --no-limit)

# Loop through each selected item and run stow
for item in $selected_items; do
  stow "$item"
  echo "Succesfully loaded $item"
done
