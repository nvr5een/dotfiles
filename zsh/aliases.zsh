# $ZSH_CONFIG/aliases.zsh

alias :q='exit'
alias pro='cd ~/projects'
alias reload='exec zsh'

# Prefer Homebrew GNU ls explicitly without replacing all core tools in PATH.
if (( $+commands[gls] )); then
  alias ls='gls --color=auto --group-directories-first'
elif [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto --group-directories-first'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias df='df -h'
alias du='du -ch'
if (( $+commands[ggrep] )); then
  alias grep='ggrep --color=auto'
elif [[ $OSTYPE != darwin* ]]; then
  alias grep='grep --color=auto'
fi

# Explicit safe variants avoid silently changing the semantics of core commands.
alias md='mkdir -pv'
alias cpi='cp -iv'
alias lni='ln -iv'
alias mvi='mv -iv'
alias rmi='rm -Iv'

mounts() {
  command mount "$@" | column -t
}

alias ga='git add'
alias gb='git branch'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gmv='git mv -v'
alias grm='git rm'
alias gs='git status --short --branch'

alias d='dirs -v'
for _dir_index in {1..9}; do
  alias "$_dir_index"="cd +$_dir_index"
done
unset _dir_index

if (( $+commands[apt-get] )); then
  alias apti='sudo apt install --no-install-recommends'
  alias aptu='sudo apt update'
  alias aptf='sudo apt full-upgrade'
  alias aptr='sudo apt remove'
  alias aptp='sudo apt purge'
  alias apta='sudo apt autoremove'
  alias apts='apt search'
  alias aptq='apt show'
  alias aptli='apt list --installed | less'
  alias aptlu='apt list --upgradeable'
  alias aptstat='dpkg -l | wc -l'
fi

if (( $+commands[pacman] )); then
  if (( $+commands[yay] )); then
    alias paci='yay -S'
    alias pacu='yay -Syu'
    alias pacs='yay -Ss'
    alias pacq='yay -Si'
  else
    alias paci='sudo pacman -S'
    alias pacu='sudo pacman -Syu'
    alias pacs='pacman -Ss'
    alias pacq='pacman -Si'
  fi
  alias pacr='sudo pacman -R'
  alias pacrr='sudo pacman -Rns'
  alias pacli='pacman -Q | less'
  alias pacll='pacman -Qqm'
  alias paco='pacman -Qo'
  alias pacf='pacman -Ql'
  alias pacc='sudo pacman -Sc'
  alias pacm='makepkg -fsic'
  alias pacstat='pacman -Q | wc -l'

  pacro() {
    local orphans
    orphans=$(pacman -Qtdq) || return 0
    if [[ -z $orphans ]]; then
      print -- 'No orphaned packages.'
      return 0
    fi
    print -r -- "$orphans" | sudo pacman -Rns -
  }
fi

(( $+commands[kubectl] )) && alias k='kubectl'

path() {
  print -rl -- $path
}
