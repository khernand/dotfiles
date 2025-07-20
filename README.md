# My dotfiles

This directory contains the dotfiles for my MacOS machines

## Requirements - Mac

Ensure you have the following installed on your system

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Ansible

```bash
brew install ansible
```

### Run Ansible playbook

```bash
cd mac-setup
```

```bash
ansible-playbook mac.yml
```

## Installation

then use GNU stow to create symlinks

```bash
stow  . -t ~/
```
