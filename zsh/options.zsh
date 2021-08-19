# $ZSH_CONFIG/options.zsh

bindkey -e
bindkey 'jk' vi-cmd-mode

# ctrl+Vim keys for menu navigation
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# In 'vi-cmd-mode', 'v' edits current command with $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Misc options
setopt correct # correct spelling of commands
setopt no_correct_all # do not correct spelling of command arguments
setopt interactive_comments # allow comments in interactive shells
setopt auto_cd # perform 'cd' if command is name of directory
setopt auto_pushd # make cd push old directory onto directory stack
setopt pushd_ignore_dups # don't push duplicate directories onto directory stack
setopt pushd_silent # do not print directory stack after pushd or popd
setopt no_check_jobs # don't report on jobs when shell exits
setopt no_hup # don't kill jobs on shell exit
setopt long_list_jobs # list jobs in long format
setopt notify # report status of background/suspended jobs immediately

# History
setopt extended_history # save each command's timestamp
setopt hist_ignore_all_dups # remove duplicate command lines from history
setopt hist_ignore_space # remove commands from history beginning with a space
setopt inc_append_history # add commands immediately to $HISTFILE incrementally
setopt no_share_history # import commands manually with `fc -RI'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST="$HISTSIZE"

