#!/bin/bash

# Exit on any error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
    echo -e "${2}${1}${NC}"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_message "Please do not run this script as root. It will use sudo when needed." "$RED"
    exit 1
fi

# Check for required commands
for cmd in ansible-playbook curl; do
    if ! command -v $cmd &> /dev/null; then
        print_message "Installing $cmd..." "$YELLOW"
        sudo apt-get update
        sudo apt-get install -y $cmd
    fi
done

# Check if required files exist
if [ ! -f "ubuntu_install.yml" ] || [ ! -f "code-server.service.j2" ]; then
    print_message "Error: Required files not found in current directory" "$RED"
    print_message "Make sure ubuntu_install.yml and code-server.service.j2 are present" "$RED"
    exit 1
fi

# Run the playbook
print_message "Starting code-server installation..." "$GREEN"
ansible-playbook --ask-become-pass ubuntu_install.yml

# Check if installation was successful
if [ $? -eq 0 ]; then
    print_message "\nInstallation completed successfully!" "$GREEN"
    print_message "Code-server should now be running at http://127.0.0.1:8080" "$GREEN"
    print_message "Your password is in ~/.config/code-server/config.yaml" "$GREEN"
    print_message "\nYou can manage the service using:" "$YELLOW"
    print_message "  sudo systemctl status code-server" "$YELLOW"
    print_message "  sudo systemctl start code-server" "$YELLOW"
    print_message "  sudo systemctl stop code-server" "$YELLOW"
    print_message "  sudo systemctl restart code-server" "$YELLOW"
else
    print_message "\nInstallation failed. Please check the error messages above." "$RED"
    exit 1
fi 