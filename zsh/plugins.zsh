# $ZSH_CONFIG/plugins.zsh

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

history_substring_search_keybinds() {
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# Arch Linux and macOS (homebrew)
if [[ -e /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  history_substring_search_keybinds
elif [[ -e /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  . /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  history_substring_search_keybinds
fi

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# fzf
# https://github.com/junegunn/fzf
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

fzf_exports() {
  export FZF_DEFAULT_OPTS="--multi --cycle --prompt='❯ ' --pointer='❯' --marker='❯' --color='16'"
  export FZF_DEFAULT_COMMAND='rg --follow --hidden --files --glob '!.git' 2>/dev/null'
}

# Arch Linux and macOS (homebrew)
if (( $+commands[fzf] )); then
  fzf_exports
  if [[ -d /usr/share/fzf ]]; then
    . /usr/share/fzf/completion.zsh
    . /usr/share/fzf/key-bindings.zsh
  elif [[ -d /usr/local/opt/fzf/shell ]]; then
    . /usr/local/opt/fzf/shell/completion.zsh
    . /usr/local/opt/fzf/shell/key-bindings.zsh
  fi
fi

