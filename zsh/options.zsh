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

history_substring_search_bindkeys() {
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# Enable history substring search with Vim and Emacs bindings + arrow keys
# Installing via package manager on Linux and macOS, this may change.
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  history_substring_search_bindkeys
elif [[ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  . /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  history_substring_search_bindkeys
else
  # Enable native history search as fallback with Vim and Emacs bindings + arrow keys
  autoload -U history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey -M emacs '^P' history-beginning-search-backward-end
  bindkey -M emacs '^N' history-beginning-search-forward-end
  bindkey -M vicmd 'k' history-beginning-search-backward-end
  bindkey -M vicmd 'j' history-beginning-search-forward-end
  bindkey '^[[A' history-beginning-search-backward-end
  bindkey '^[[B' history-beginning-search-forward-end
fi

# Changing Directories
setopt auto_cd # perform 'cd' if command is name of directory
setopt auto_pushd # make cd push old directory onto directory stack
setopt pushd_ignore_dups # don't push duplicate directories onto directory stack
setopt pushd_silent # do not print directory stack after pushd or popd

# Completion
setopt always_to_end # move cusor to end of word when completion is inserted
setopt complete_aliases # aliases are distinct commands for completion purposes
setopt complete_in_word # perform completion from both ends of words
setopt no_menu_complete # do not insert first match on ambiguous completion

# Expansion and Globbing
setopt extended_glob # needed for file modification glob modifiers with compinit

# History
setopt extended_history # save each command's timestamp
setopt hist_ignore_all_dups # remove duplicate command lines from history
setopt hist_ignore_space # remove commands from history beginning with a space
setopt inc_append_history # add commands immediately to $HISTFILE incrementally
setopt no_share_history # import commands manually with `fc-RI'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST="$HISTSIZE"

# Input/Output
setopt correct # correct spelling of commands
setopt no_correct_all # do not correct spelling of command arguments
setopt interactive_comments # allow comments in interactive shells

# Job Control
setopt no_check_jobs # don't report on jobs when shell exits
setopt no_hup # don't kill jobs on shell exit
setopt long_list_jobs # list jobs in long format
setopt notify # report status of background/suspended jobs immediately

# Prompting
setopt prompt_subst # perform arithmetic expansion in prompts (required)

