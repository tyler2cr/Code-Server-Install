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

# Check if the service is running (requires sudo)
if sudo systemctl is-active --quiet code-server; then
    echo "✅ code-server has been successfully installed and is running"
    echo "You can access it at: http://$(hostname -I | awk '{print $1}'):8080"
    echo "Default password is set in the playbook (you should change it)"
else
    echo "❌ code-server installation may have failed. Please check the logs:"
    echo "sudo journalctl -u code-server"
    exit 1
fi 