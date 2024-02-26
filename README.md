# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```bash
git clone git@github.com:khernand/dotfiles.git
```
```bash
cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
