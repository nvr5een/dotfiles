# $ZSH_CONFIG/keybindings.zsh

# Hybrid editing: Vi command mode with Emacs bindings while inserting. Escape or
# `jk` enters Vi command mode; `i`, `a`, etc. return to the Emacs-like insert map.
bindkey -v
bindkey -A emacs viins
bindkey -A viins main
bindkey -M viins '^[' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode
KEYTIMEOUT=10

# In Vi command mode, `v` opens the current command in $VISUAL/$EDITOR.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# History navigation works in both Vi maps without any plugin.
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M vicmd '^P' up-history
bindkey -M vicmd '^N' down-history

# If history substring search is installed, use it in both Vi maps.
if (( $+widgets[history-substring-search-up] )); then
  bindkey -M viins '^P' history-substring-search-up
  bindkey -M viins '^N' history-substring-search-down
  bindkey -M vicmd '^P' history-substring-search-up
  bindkey -M vicmd '^N' history-substring-search-down
  bindkey -M vicmd k history-substring-search-up
  bindkey -M vicmd j history-substring-search-down
  bindkey -M viins '^[[A' history-substring-search-up
  bindkey -M viins '^[[B' history-substring-search-down
fi

# Vim-style navigation in completion menus.
zmodload zsh/complist
bindkey -M menuselect '^H' backward-char
bindkey -M menuselect '^J' down-line-or-history
bindkey -M menuselect '^K' up-line-or-history
bindkey -M menuselect '^L' forward-char
