# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Add bob (nvim version manager) to PATH
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Can choose ZSH Theme here.
ZSH_THEME="powerlevel10k/powerlevel10k"

autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::rust
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Unalias 'zi' for zoxide.
unalias zi

# You may need to manually set your language environment
export LANG=en_AU.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

################################### ALIASES ####################################

alias home="cd ~"
alias nvimconfig="cd '$HOME/.config/nvim/lua/custom/'"
alias connect3d="ssh biqu@192.168.20.22"
if [[ `uname` == "Darwin" ]]; then
    alias onedrive_uni="cd '/Users/huananthonydo/OneDrive - UNSW/2023/T3/'"
    alias personal="cd '/Users/huananthonydo/Documents/code/'"
    alias uni="cd '/Users/huananthonydo/Documents/uni/'"

  elif [[ `uname` == "Linux" ]]; then
    alias onedrivep="cd '/mnt/c/Users/Anthony/OneDrive/Documents/'"
    alias onedrive="cd '/mnt/c/Users/Anthony/OneDrive - UNSW/2023/T3/'"
    alias personal="cd '/home/anthony/code/personal/'"
    alias uni="cd '/home/anthony/code/uni/'"
    alias open="/mnt/c/Windows/explorer.exe"
fi

##################################### TMUX #####################################

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; 
then
  tmux attach 2>/dev/null || tmux
fi

#################################### ZOXIDE ####################################

eval "$(zoxide init zsh)"
