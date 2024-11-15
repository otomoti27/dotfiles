# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# ディレクトリスタック
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
PROMPT='
[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{yellow}[%*]%f%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# alias
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias g='git'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gst='git stash'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'

alias dot='cd ~/dotfiles'
alias zshrc='vim ~/dotfiles/.zshrc'

alias sshconfig='vim ~/.ssh/config'

alias d='docker'
alias dco='docker compose'
alias dcoe='docker compose exec'

alias oapp='osascript ~/dotfiles/scpt/open_work_app.scpt'
alias capp='osascript ~/dotfiles/scpt/close_work_app.scpt'

# laravel sail
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# atcoder
alias ojt='oj t -c " go main.go" -d test'

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$PATH:$(go env GOPATH)/bin"

#pyenvの初期化
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
