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
>
> cd dotfiles

then use GNU stow to create symlinks:

> stow .

## Creating New Symlinks

Mimic the path from the home directory to the desired file/folder to create 
a symlink of in the `dotfiles` folder.

Copy the contents of that file/folder into the `dotfiles` equivalent.

> stow .

# NvChad

For setting up a brand new Neovim config:

> git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

Then delete the necessary folders to create symlinks.

> cd ~/dotfiles && stow .


