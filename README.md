# My Dotfiles

## Requirements

Ensure you have the following installed on your system:

### Git

MacOS:

> brew install git

Linux (Debian):

> sudo apt-get install git

### Stow

MacOS:

> brew install stow

Linux (Debian):

> sudo apt-get install stow

## Installation

First, clone and checkout the dotfiles repo in your $HOME directory using git:

> git clone git@github.com/Sheeplet1/dotfiles.git
> cd dotfiles

then use GNU stow to create symlinks:

> stow .
