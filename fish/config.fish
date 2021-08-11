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
function gs; git status; end
function pro; cd ~/projects; end

