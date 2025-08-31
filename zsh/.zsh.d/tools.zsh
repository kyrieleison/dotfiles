# Setup homebrew
test -f /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup homebrew-file
test -f $(brew --prefix)/etc/brew-wrap && source $(brew --prefix)/etc/brew-wrap

# Setup mise
command -v mise > /dev/null 2>&1 && eval "$(mise activate zsh)"

# Setup fzf
command -v fzf > /dev/null 2>&1 && source <(fzf --zsh)

# Setup incremental search history
export FZF_DEFAULT_OPTS="--color='pointer:#81A1C1' --height=80% --tmux=80% --border --margin=1 --padding=1"
incremental_search_history() {
  selected=`history -n 1 | tail -r | fzf --prompt='HIST> ' --query "$LBUFFER" --no-sort`
  BUFFER=`[ ${#selected} -gt 0 ] && echo $selected || echo $BUFFER`
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N incremental_search_history
bindkey "^R" incremental_search_history
