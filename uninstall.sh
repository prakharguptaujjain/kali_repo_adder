#!/bin/bash
sudo dpkg -P kali-archive-keyring
# Check if the sources.list file exists
if [ -f /etc/apt/sources.list ]; then
  # Create a backup of the file
  sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

  # Remove all lines containing "kali.org" from the file
  sudo grep -v "kali.org" /etc/apt/sources.list > /tmp/sources.list
  sudo mv /tmp/sources.list /etc/apt/sources.list

  # Update the package list
  sudo apt update
else
  echo "Error: /etc/apt/sources.list not found"
fi