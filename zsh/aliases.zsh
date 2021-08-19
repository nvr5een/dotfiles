# $ZSH_CONFIG/aliases.zsh

alias :q='exit'
alias pro='cd ~/projects'
alias reload='. ~/.zshrc; echo ZSH config reloaded!'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias df='df -h'
alias du='du -ch'
alias grep='grep --color=auto'
alias mkdir='nocorrect mkdir -pv'
alias mount='mount | column -t'

alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp -iv'
alias ln='ln -iv'
alias mv='nocorrect mv -iv'
alias rm='rm -Iv'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

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
    alias paci='yay -S' # install package(s) (incl AUR)
    alias pacu='yay -Syu' # sync, then upgrade all packages (incl AUR)
    alias pacs='yay -Ss' # search for package(s) (incl AUR)
    alias pacq='yay -Si' # show package info (incl AUR)
  else
    alias paci='sudo pacman -S' # install package(s)
    alias pacu='sudo pacman -Syu' # sync, then upgrade all packages
    alias pacs='pacman -Ss' # search for package(s)
    alias pacq='pacman -Si' # show package info
  fi
  alias pacr='sudo pacman -R' # remove package(s) but retain configs and depends
  alias pacrr='sudo pacman -Rns' # remove package(s), configs and depends
  alias pacro='pacman -Qtdq | sudo pacman -Rns -' # remove unused packages
  alias pacli='pacman -Q | less' # list all packages currently installed
  alias pacll='pacman -Qqm' # list all packages locally installed
  alias paco='pacman -Qo' # determine which package owns a given file
  alias pacf='pacman -Ql' # list all files installed by a given package
  alias pacc='sudo pacman -Sc' # delete all packages not currently installed
  alias pacm='makepkg -fsic' # make package from PKGBUILD, install deps, clean
  alias pacstat='pacman -Q | wc -l' # print number of installed packages
fi

