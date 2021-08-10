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

