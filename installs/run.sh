#!/bin/bash

# Define the path to the file containing the list of applications
app_list_file="app_list.txt"

# Function to install applications using yay
install_apps() {
  if [[ -n $1 ]]; then
    yay -S --needed --noconfirm $1
  fi
}

# Read the app list file and process each category
category=""
apps=""
selected_apps_all=""
while IFS= read -r line || [[ -n $line ]]; do
  if [[ $line == \#* ]]; then
    # Process the previous category if apps are available
    if [[ -n $apps ]]; then
      echo "Selecting applications in the $category category"
      echo "---"

      # Use gum choose to select applications
      selected_apps=$(echo -e "$apps" | gum choose --no-limit)

      # Add the selected applications to the overall list
      if [[ -n $selected_apps ]]; then
        selected_apps_all+=" $selected_apps"
      else
        echo "No applications selected for the $category category"
      fi

      echo "---"
    fi

    # Reset the apps list for the new category
    category=$(echo "$line" | cut -d' ' -f2-)
    apps=""
  else
    # Add the application to the current category
    app=$(echo "$line" | tr -d '[:space:]')
    if [[ -n $app ]]; then
      apps+="$app\n"
    fi
  fi
done < "$app_list_file"

# Process the last category if apps are available
if [[ -n $apps ]]; then
  echo "Selecting applications in the $category category"
  echo "---"

  # Use gum choose to select applications
  selected_apps=$(echo -e "$apps" | gum choose --no-limit)

  # Add the selected applications to the overall list
  if [[ -n $selected_apps ]]; then
    selected_apps_all+=" $selected_apps"
  else
    echo "No applications selected for the $category category"
  fi

  echo "---"
fi

# Install the selected applications
if [[ -n $selected_apps_all ]]; then
  echo "Installing the selected applications..."
  install_apps "$selected_apps_all"
else
  echo "No applications selected for installation"
fi
