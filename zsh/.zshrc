# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

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
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history

# Autoload
autoload -U colors && colors

# Define alias
if [[ $(command -v eza) ]]; then
  alias ls='eza --icons --git'
  alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='eza -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
fi
alias ll='ls -lh'     # Lists human readable sizes
alias la='ls -lah'    # Lists human readable sizes, hidden files
alias lr='ls -R'      # Lists human readable sizes, recursively
alias lar='ls -lahR'  # Lists human readable sizes, hidden files, recursively
alias less='less -R'
if [[ $(command -v colordiff) ]]; then
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
alias gbrd='git branch --merged | grep -vE "^\*|master$|develop$" | xargs -I % git branch -d %'

# Setup anyenv
[ -d ~/.anyenv ] && eval "$(anyenv init -)"

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
