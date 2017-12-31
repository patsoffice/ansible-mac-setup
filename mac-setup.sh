#!/bin/bash

# Colours
BOLD='\033[1m'
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
ENDC='\033[0m'

# Display a pretty header
echo
echo -e "${BOLD}Mac Setup (using Ansible)${ENDC}"
echo

# Prompt the user for their sudo password
sudo -v

# Enable passwordless sudo for the macbuild run
sudo sed -i -e "s/^%admin.*/%admin  ALL=(ALL) NOPASSWD: ALL/" /etc/sudoers

# Install Homebrew
if ! which brew > /dev/null 2>&1
then
    echo -e "${BLUE}Installing Homebrew${ENDC}"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Install Python 3
if ! brew list python3 > /dev/null 2>&1
then
    echo -e "${BLUE}Installing Python 3.x${ENDC}"
    brew install python3
fi

# Install Ansible (using pip is the officially supported way)
if ! brew list ansible > /dev/null 2>&1
then
    echo -e "${BLUE}Installing Ansible${ENDC}"
    brew install ansible
fi

# Install Ansible galaxy requirements
ansible-galaxy install -r requirements.yml && \

# Perform the build
ansible-playbook -i localhost, -e ansible_python_interpreter=/usr/local/bin/python3 local.yaml --ask-vault-pass && \

# Disable passwordless sudo after the macbuild is complete
sudo sed -i -e "s/^%admin.*/%admin  ALL=(ALL) ALL/" /etc/sudoers