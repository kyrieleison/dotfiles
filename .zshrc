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
export CLICOLOR=1
export TERM=xterm-256color

# Set opt
# see: http://zsh.sourceforge.net/Doc/Release/Options.html
setopt no_beep
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history

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

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Setup zsh-completions
# see: https://formulae.brew.sh/formula/zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Setup curl
export PATH="$PATH:/usr/local/opt/curl/bin"

# Setup openssl@1.1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Setup mysql@5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Setup imagemagick@6
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# For compilers to find imagemagick@6 you may need to set:
export LDFLAGS="-L/usr/local/opt/imagemagick@6/lib"
export CPPFLAGS="-I/usr/local/opt/imagemagick@6/include"
# For pkg-config to find imagemagick@6 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"

# Setup google-cloud-sdk
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

echo 'Loaded ~/.zshrc'
