#!/bin/bash

# Exit on any error
set -e

# Print commands as they are executed
set -x

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)"
    exit 1
fi

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    apt update
    apt install -y ansible
fi

# Run the Ansible playbook
echo "Running code-server installation playbook..."
ansible-playbook install-code-server.yml

# Check if the service is running
if systemctl is-active --quiet code-server; then
    echo "✅ code-server has been successfully installed and is running"
    echo "You can access it at: http://$(hostname -I | awk '{print $1}'):8080"
    echo "Default password is set in the playbook (you should change it)"
else
    echo "❌ code-server installation may have failed. Please check the logs:"
    echo "journalctl -u code-server"
    exit 1
fi 