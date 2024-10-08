# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pokemon-colorscripts -r --no-title

#################################### Paths #####################################
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.go/bin
export PATH=$PATH:/.fzf/bin/fzf
export PATH=$PATH:/home/anthony/.spicetify

##################################### KEYS #####################################
# export OPENAI_API_KEY=$(pass show keys/openai)
# export SUPABASE_URL=$(pass show ynafp/supabase_url)
# export SUPABASE_API=$(pass show ynafp/supabase_api)

#################################### ZINIT #####################################
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

################################### Keybinds ###################################
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

################################### History ####################################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

############################## Completion Styling ##############################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

################################### Aliases ####################################
alias connect3d="ssh biqu@192.168.20.22"

alias ls='ls --color'
alias vim='nvim'
alias c='clear'

## Git Aliases
alias gs="git status"
alias gcl="git clone"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gd="git diff"

############################## Shell Integrations ##############################
eval "$(fzf --zsh)"
unalias zi
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)" # enable/disable starship prompt

##################################### TMUX #####################################
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; 
then
  tmux attach 2>/dev/null || tmux
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
