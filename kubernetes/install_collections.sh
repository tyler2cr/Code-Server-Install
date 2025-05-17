#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Installing required Ansible collections...${NC}"

# Create collections directory if it doesn't exist
mkdir -p ~/.ansible/collections

# Install collections with force flag to ensure they're properly installed
ansible-galaxy collection install -r requirements.yml --force

# Set ANSIBLE_COLLECTIONS_PATH to ensure ansible-lint can find the collections
export ANSIBLE_COLLECTIONS_PATH=~/.ansible/collections

echo -e "${GREEN}Collections installed successfully!${NC}"
echo -e "${YELLOW}Running ansible-lint...${NC}"

# Run ansible-lint with the collections path
ANSIBLE_COLLECTIONS_PATH=~/.ansible/collections ansible-lint --offline --nocolor -f codeclimate roles/

echo -e "${GREEN}Linting completed!${NC}" 