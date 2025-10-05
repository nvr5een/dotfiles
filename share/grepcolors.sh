# ~/.config/grepcolors.sh
# GREP_COLORS config for GNU grep
# Each key=value sets how grep highlights different parts of output.

# General match
# 'mt' = matched text
# Format: [attributes];[fg];[bg]
# Example: bold white on magenta background
GREP_COLORS="mt=01;37;45"

# Context line
# 'ms' = match selected line
# 'mc' = match context line
# Here: dim text for context
GREP_COLORS="$GREP_COLORS:ms=02:mc=02"

# Filename
# 'fn' = filename
# Bold green
GREP_COLORS="$GREP_COLORS:fn=01;32"

# Line number
# 'ln' = line number
# Yellow
GREP_COLORS="$GREP_COLORS:ln=01;33"

# Separator
# 'se' = separator (the ':' in "file:line:text")
# Cyan
GREP_COLORS="$GREP_COLORS:se=36"

# Column number (if --column used)
# 'cn' = column number
# Blue
GREP_COLORS="$GREP_COLORS:cn=34"

# Byte offset (if -b used)
# 'bn' = byte offset
# Gray
GREP_COLORS="$GREP_COLORS:bn=02;37"

export GREP_COLORS