function ls --description "List directory contents"
  set -l param --color=auto;
  set param $param --almost-all
  set param $param --human-readable
  set param $param --group-directories-first -v
  if isatty 1
    set param $param --indicator-style=classify
  end
  if type gls 1>/dev/null 2>/dev/null
    gls $param $argv
  else
    command ls $param $argv
  end
end

