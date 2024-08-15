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

### Shyfox

Since firefox has different folder paths for my devices, its easier to manually
make the symlinks once instead.

For MacOS:

> [!IMPORTANT]
> The profile name at the end could change - need to verify which folder to link to
> in firefox's `about:profiles`.

> ln -s user.js ~/Library/Application\ Support/Firefox/Profiles/k4riv92a.default-release-1-1722038075236
>
> ln -s chrome ~/Library/Application\ Support/Firefox/Profiles/k4riv92a.default-release-1-1722038075236
