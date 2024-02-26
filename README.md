# My dotfiles

This directory contains the dotfiles for my system

## Requirements - Mac

Ensure you have the following installed on your system

Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Oh My ZSH:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Antigen:

```bash
brew install antigen
```

Pure Prompt:

```bash
brew install pure
```

Autojump:

```bash
brew install autojump
```

## Terminal

Install Fira fonts

```bash
brew tap homebrew/cask-fonts
```

```bash
brew install --cask font-fira-code
```

In Terminal.app

1. Go to Settings
1. Go to Profiles
1. In the bottom left, next to `+` `-`, Import the `Snazzy.terminal` profile and set it as Default

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```bash
git clone git@github.com:khernand/dotfiles.git
```

```bash
cd dotfiles
```

then use GNU stow to create symlinks

```bash
stow  . -t ~/
```
