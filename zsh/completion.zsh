# $ZSH_CONFIG/completion.zsh

setopt always_to_end
setopt complete_aliases
setopt complete_in_word
unsetopt menu_complete
setopt extended_glob

typeset -g ZSH_COMPLETION_CACHE="$ZSH_CACHE/completions"
mkdir -p -- "$ZSH_COMPLETION_CACHE"
fpath=("$ZSH_COMPLETION_CACHE" $fpath)

# Generate kubectl's completion only when it is missing or the executable changed.
if (( $+commands[kubectl] )); then
  _kubectl_completion="$ZSH_COMPLETION_CACHE/_kubectl"
  if [[ ! -s $_kubectl_completion || $commands[kubectl] -nt $_kubectl_completion ]]; then
    _kubectl_tmp="$_kubectl_completion.$$.tmp"
    if command kubectl completion zsh >| "$_kubectl_tmp" 2>/dev/null; then
      command mv -f -- "$_kubectl_tmp" "$_kubectl_completion"
    else
      command rm -f -- "$_kubectl_tmp"
    fi
  fi
  unset _kubectl_completion _kubectl_tmp
fi

autoload -Uz compinit compaudit
_comp_dump="$ZSH_CACHE/zcompdump"

if [[ -s $_comp_dump && $_comp_dump(#qNmh-24) ]]; then
  compinit -C -d "$_comp_dump"
else
  _comp_insecure=("${(@f)$(compaudit 2>/dev/null)}")
  _comp_insecure=(${_comp_insecure:#})
  if (( $#_comp_insecure )); then
    print -u2 -- "zsh: ignoring insecure completion directories:"
    print -u2 -l -- $_comp_insecure
    print -u2 -- "Run 'compaudit' and correct their ownership or permissions."
    compinit -i -d "$_comp_dump"
  else
    compinit -d "$_comp_dump"
  fi
  unset _comp_insecure
fi
unset _comp_dump

if (( $+commands[kubectl] )); then
  compdef _kubectl kubectl k
fi

[[ -n $LS_COLORS ]] &&
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$ZSH_CACHE/zcompcache"

# One inexpensive matching pass: case-insensitive with partial-word matching.
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z} r:|[._-]=* r:|=*'
zstyle ':completion:*' completer _expand_alias _complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{magenta}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches --%f'
