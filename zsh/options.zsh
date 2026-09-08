# $ZSH_CONFIG/options.zsh

setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

# Warn about jobs and terminate them normally when the shell exits. Deliberately
# detached jobs should use nohup, disown, a tmux pane, or a service manager.
setopt check_jobs
setopt hup
setopt long_list_jobs
setopt notify

# Spell correction is noisy for hosts, contexts, and newly installed commands.
unsetopt correct
unsetopt correct_all
