#!/bin/bash

set -e

# Run the playbook
echo "Running Ansible playbook..."
if ansible-playbook \
    -i inventory.ini \
    playbook.yml; then
    echo "Playbook completed successfully!"
else
    echo "Playbook failed!"
    exit 1
fi

