HISTFILE=~/.cache/shell-histfile
HISTSIZE=10000
SAVEHIST=10000

export ZSH_CONFIGURATION=~/.config/zsh
export TASKRC=/home/sarvagya/.config/task/.taskrc
export EDITOR=vim
export TERMINAL=alacritty

# Theming section
autoload -U colors && colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Check in repositories for package if command not found
source /usr/share/doc/pkgfile/command-not-found.zsh
# # Suggest aliases for commands
# source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

# Autocomplete for previous commands
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Completion
zmodload zsh/complist
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Auto complete with case insenstivity
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
compinit
_comp_options+=(globdots)		# Include hidden files.


# Edit line in $EDITOR buffer ctrl-x
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

zmodload zsh/terminfo

# #ci", ci', ci`, di", etc
# autoload -U select-quoted
# zle -N select-quoted
# for m in visual viopp; do
#   for c in {a,i}{\',\",\`}; do
#     bindkey -M $m $c select-quoted
#   done
# done

# # ci{, ci(, ci<, di{, etc
# autoload -U select-bracketed
# zle -N select-bracketed
# for m in visual viopp; do
#   for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
#     bindkey -M $m $c select-bracketed
#   done
# done
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init

# Set aliases
. $ZSH_CONFIGURATION/aliases

# Set options
. $ZSH_CONFIGURATION/options

# Set keybindings
. $ZSH_CONFIGURATION/keybindings

eval "$(starship init zsh)"

task
