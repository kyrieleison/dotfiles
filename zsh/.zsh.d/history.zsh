# Set opt
# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# Support XDG base directory specification
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# Expand histsize
export HISTSIZE=1000000
export HISTFILESIZE=1000000
