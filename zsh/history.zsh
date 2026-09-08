# $ZSH_CONFIG/history.zsh

HISTFILE="$ZSH_CACHE/zhistory"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups

# Keep interactive history navigation local to each tmux pane while appending
# commands promptly to the shared file. Replace these two options with
# `setopt share_history` if live cross-pane history is preferred.
setopt inc_append_history
unsetopt share_history
