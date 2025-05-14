#!/bin/bash

# Exit on any error
set -e

# Print commands as they are executed
set -x

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y ansible
fi

# Run the Ansible playbook as current user
echo "Running code-server installation playbook..."
if ! ansible-playbook install-code-server.yml --ask-become-pass; then
    echo "❌ Ansible playbook failed"
    exit 1
fi 