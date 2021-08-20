# $ZSH_CONFIG/completion.zsh

setopt always_to_end # move cusor to end of word when completion is inserted
setopt complete_aliases # aliases are distinct commands for completion purposes
setopt complete_in_word # perform completion from both ends of words
setopt no_menu_complete # do not insert first match on ambiguous completion
setopt extended_glob # needed for file modification glob modifiers with compinit

fpath=("${ZSH_CONFIG}/completion" $fpath)

# Load and initialize completion system with a cache time of 20 hours.
autoload -Uz compinit
_comp_path="$ZSH_CACHE/zcompdump"
if [[ $_comp_path(#qNmh-20) ]]; then
  compinit -C -d "$_comp_path"
else
  mkdir -p "$_comp_path:h"
  compinit -i -d "$_comp_path"
  touch "$_comp_path"
fi
unset _comp_path

# Defaults.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Enable caching for command completion
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$ZSH_CACHE/zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _expand_alias _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

