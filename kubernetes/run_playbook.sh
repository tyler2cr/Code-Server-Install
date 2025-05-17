#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to check if a command exists
check_command() {
    if ! command -v "$1" &> /dev/null; then
        print_message "$RED" "Error: $1 is not installed"
        exit 1
    fi
}

# Check required commands
print_message "$YELLOW" "Checking prerequisites..."
check_command ansible
check_command ansible-playbook
check_command python3

# Check if we're running as root
if [ "$EUID" -eq 0 ]; then
    print_message "$RED" "Please do not run this script as root"
    exit 1
fi

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

# Install required collections
print_message "$YELLOW" "Installing required Ansible collections..."
ansible-galaxy collection install -r requirements.yml

# Run the playbook
print_message "$YELLOW" "Running Ansible playbook..."
if ansible-playbook -i inventory.ini playbook.yml; then
    print_message "$GREEN" "Playbook completed successfully!"
    print_message "$GREEN" "You can access code-server at: https://localhost:8443"
else
    print_message "$RED" "Playbook failed!"
    exit 1
fi

