# $ZSH_CONFIG/prompt.zsh

setopt prompt_subst # enable redrawing of prompt variables (required)

autoload -Uz colors && colors

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Edit of 'Common' zsh theme
# https://github.com/jackharrisonsherlock/common
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# Prompt symbol
COMMON_PROMPT_SYMBOL="❯"

# Colors
COMMON_COLORS_HOST_ME=green
COMMON_COLORS_CURRENT_DIR=blue
COMMON_COLORS_RETURN_STATUS_TRUE=magenta
COMMON_COLORS_RETURN_STATUS_FALSE=yellow
COMMON_COLORS_GIT_STATUS_DEFAULT=default
COMMON_COLORS_GIT_STATUS_STAGED=green
COMMON_COLORS_GIT_STATUS_UNSTAGED=yellow
COMMON_COLORS_BG_JOBS=yellow

# Left Prompt
PROMPT='$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'

# Right Prompt
RPROMPT='$(common_git_status)'

# Host
common_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_ME]%}$me%{$reset_color%}:"
  fi
}

# Current directory
common_current_dir() {
  echo -n "%{$fg[$COMMON_COLORS_CURRENT_DIR]%}%c "
}

# Prompt symbol
common_return_status() {
  echo -n "%(?.%F{$COMMON_COLORS_RETURN_STATUS_TRUE}.%F{$COMMON_COLORS_RETURN_STATUS_FALSE})$COMMON_PROMPT_SYMBOL%f "
}

# Git status
common_git_status() {
    local message=""
    local message_color="%F{$COMMON_COLORS_GIT_STATUS_DEFAULT}"

    # https://git-scm.com/docs/git-status#_short_format
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    if [[ -n ${staged} ]]; then
        message_color="%F{$COMMON_COLORS_GIT_STATUS_STAGED}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{$COMMON_COLORS_GIT_STATUS_UNSTAGED}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="${message_color}${branch}%f"
    fi

    echo -n "${message}"
}

# Background Jobs
common_bg_jobs() {
  bg_status="%{$fg[$COMMON_COLORS_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Change cursor shape for different vi modes
# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

cursor_mode() {
  cursor_block='\e[2 q'
  cursor_beam='\e[6 q'

  function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
      [[ $1 = 'block' ]]; then
      echo -ne $cursor_block
    elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
      echo -ne $cursor_beam
    fi
  }

  zle-line-init() {
    echo -ne $cursor_beam
  }

  zle -N zle-keymap-select
  zle -N zle-line-init
}

cursor_mode

