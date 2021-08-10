# ~/.config/fish/config.fish

set -gx fish_greeting ''

set fish_color_command brgreen
set fish_color_comment brblack
set fish_color_end green
set fish_color_error brred
set fish_color_escape cyan
set fish_color_operator cyan
set fish_color_param brblue
set fish_color_quote yellow
set fish_color_redirection blue

function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
  for mode in default insert visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings

function vim_esc_remap --description "Remap 'ESC' to 'jk' for Vi-style bindings"
  if commandline -P
    commandline -f cancel
  else
    set fish_bind_mode default
    commandline -f backward-char force-repaint
  end
end
bind -M insert jk vim_esc_remap

set -g __fish_git_prompt_showdirtystate
set -g __fish_git_prompt_showuntrackedfiles

set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_color normal
set -g __fish_git_prompt_color_branch normal

set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_invalidstate '#'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_invalidstate yellow
set -g __fish_git_prompt_color_stagedstate green

set -g __fish_git_prompt_char_untrackedfiles '%'
set -g __fish_git_prompt_color_untrackedfiles yellow

function fish_prompt

  set_color blue
  printf '%s' (prompt_pwd)
  printf '%s' (__fish_git_prompt)

  if test -z (string match -ri '^no|false|0$')
    switch $fish_bind_mode
      case default
        echo -en "\e[2 q"
        printf '> '
      case insert
        echo -en "\e[6 q"
        printf '> '
      case replace_one
        echo -en "\e[4 q"
        printf '> '
      case visual
        echo -en "\e[2 q"
        printf '> '
      case '*'
        echo -en "\e[2 q"
        printf '> '
    end
  end

end

function :q; exit; end
function pro; cd ~/projects; end

function grep; grep --color=auto; end
function ls; ls --color=auto --group-directories-first; end
function ll; ls -alF; end
function la; ls -A; end
function l; ls -CF; end

function df; df -h; end
function du; du -ch; end
function mkdir; mkdir -pv; end
function mount; mount | column -t; end

function chgrp; chgrp --preserve-root; end
function chmod; chmod --preserve-root; end
function chown; chown --preserve-root; end
function cp; cp -iv; end
function ln; ln -iv; end
function mv; mv -iv; end
function rm; rm -Iv; end

function ga; git add; end
function gb; git branch; end
function gcm; git commit -v -m; end
function gco; git checkout; end
function gcl; git clone; end
function gd; git diff; end
function gl; git pull; end
function gmv; git mv -v; end
function gp; git push; end
function grm; git rm; end
function gs; git status; end

if type -p apt-get &>/dev/null
  function apti; sudo apt install --no-install-recommends; end
  function aptu; sudo apt update; end
  function aptug; sudo apt upgrade; end
  function aptf; sudo apt full-upgrade; end
  function aptr; sudo apt remove; end
  function aptp; sudo apt purge; end
  function apta; sudo apt autoremove; end
  function apts; apt search; end
  function aptq; apt show; end
  function aptli; apt list --installed | less; end
  function aptlu; apt list --upgradeable; end
  function aptstat; dpkg -l | wc -l; end
end

if type -p pacman &>/dev/null
  if type -p yay &>/dev/null
    function paci; yay -S; end
    function pacu; yay -Syu; end
    function pacs; yay -Ss; end
    function pacq; yay -Si; end
  else
    function paci; sudo pacman -S; end
    function pacu; sudo pacman -Syu; end
    function pacs; pacman -Ss; end
    function pacq; pacman -Si; end
  end
  function pacr; sudo pacman -R; end
  function pacrr; sudo pacman -Rns; end
  function pacro; pacman -Qtdq | sudo pacman -Rns -; end
  function pacli; pacman -Q | less; end
  function pacll; pacman -Qqm; end
  function pacf; pacman -Ql; end
  function pacc; sudo pacman -Sc; end
  function pacm; makepkg -fsic; end
  function pacstat; pacman -Q | wc -l; end
end

