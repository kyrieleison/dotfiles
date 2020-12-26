# Source prezto
if [ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set env
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LANG=ja_JP.UTF-8
export PATH="$HOME/bin:$PATH"

# Read plugins
fpath=(
  $HOME/.zsh.d/plugins/zsh-completions/src(N-/)
  $fpath
)

# Autoload
autoload -U colors && colors

# Define alias
alias less='less -R'
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
alias gdfc='git diff --cached'
alias ggr='git grep'
alias gbrd='git branch --merged | grep -vE "^\*|master$|develop$" | xargs -I % git branch -d %'

# Setup anyenv
[ -d ~/.anyenv ] && eval "$(anyenv init -)"

# Setup direnv
[ -x /usr/local/bin/direnv ] && eval "$(direnv hook zsh)"

# Setup npm
# export PATH="$PATH:$(npm bin -g)"

# Setup peco
bindkey -e

if $(which peco > /dev/null); then
  function peco-select-history() {
    local tac
    if $(which tac > /dev/null); then
      tac='tac'
    else
      tac='tail -r'
    fi
    BUFFER=$(history -n 1 | \
      eval $tac | \
      peco --layout=bottom-up --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

# Setup mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Setup imagemagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"

# Setup curl
export PATH="$PATH:/usr/local/opt/curl/bin"

# Setup openssl
# export LDFLAGS='-L/usr/local/opt/openssl/lib'
# export CPPFLAGS='-I/usr/local/opt/openssl/include'
# export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"

# 2020/06/18 Resetup openssl
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Setup yarn
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Setup serverless

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/yuka.sato/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/yuka.sato/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/yuka.sato/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/yuka.sato/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# Disable iterm2 shell integration
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

echo 'Loaded ~/.zshrc'
