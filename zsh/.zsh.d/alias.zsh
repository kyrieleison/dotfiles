if command -v eza > /dev/null 2>&1; then
  alias ls='eza --icons --git'
  alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='eza -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
fi

if command -v nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias ll='ls -lh'     # Lists human readable sizes
alias la='ls -lah'    # Lists human readable sizes, hidden files
alias lr='ls -R'      # Lists human readable sizes, recursively
alias lar='ls -lahR'  # Lists human readable sizes, hidden files, recursively
alias less='less -R'

if command -v eza > /dev/null 2>&1; then
  alias diff='colordiff -u'
fi

alias gst='git status'
alias gco='git checkout'
alias gbr='git branch'
alias gpl='git pull'
alias gplo="git pull origin $(git symbolic-ref --short HEAD 2> /dev/null)"
alias gps='git push'
alias gpsf='git push --force-with-lease'
alias gpso="git push origin $(git symbolic-ref --short HEAD 2> /dev/null)"
alias glg='git log --pretty=full --decorate'
alias gdf='git diff'
alias gdfc='git diff --staged'
alias ggr='git grep'
alias gbrd='git branch | grep -vE "^\* |master$|main$|develop$" | xargs -I{} git branch -D {}'
