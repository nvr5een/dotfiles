# ~/.config/fish/config.fish

set fish_color_command brgreen
set fish_color_comment brblack
set fish_color_end green
set fish_color_error brred
set fish_color_escape cyan
set fish_color_operator cyan
set fish_color_param brblue
set fish_color_quote yellow
set fish_color_redirection blue

function :q; exit; end
function pro; cd ~/projects; end

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

