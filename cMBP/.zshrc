# Path to your oh-my-zsh installation.
export ZSH=/Users/hultner/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions)
plugins=(git)

# User configuration

export PATH="$HOME/Development/bin:$PATH"
#export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH="$(brew --prefix)/lib/python3.6/site-packages:$PYTHONPATH"
source "$HOME/.tokenrc"

#export PATH="$HOME/dev/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/sbin:$PATH"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export PATH=/Users/hultner/.local/bin:$PATH
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Colors
# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.light.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias pycharm="sh ~/dev/ide/pycharm/bin/pycharm.sh"
alias l="ls -Glaph"
alias vi="vim"
alias ls="ls -Glaph"
alias ik="mosh hubben.chalmers.it"
alias sl="ls"
alias c="clear"
alias reload="source ~/.zshrc"
export EDITOR="vi -e"
export VISUAL="vim"
#alias open="xdg-open"
alias numfmt="numfmt --to=iec-i"
alias restart='trap zsh EXIT && exit'

function powerline_precmd() {
  # Something in my PYTHONPATH breaks my powerline, so I'm just unsetting it
  # temporarily in the given subshell context for now, might investigate this
  # later.
  PS1="$(export PYTHONPATH=; ~/powerline-shell.py $?  --cwd-max-depth 4 --cwd-max-dir-size 30 --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# base16-shell

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"



# Powerline tmux exports
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
alias killjobs="jobs -p | awk '{print \$3}' | xargs kill"
#alias 0xdbe="sh ~/dev/ide/0xDBE/bin/0xdbe.sh"
#alias datagrip="sh ~/dev/ide/datagrip/bin/datagrip.sh"
#alias jb='python /home/hultner/dev/sandbox/pyjb/jb.py'

bpython() {
    if test -n "$VIRTUAL_ENV"
    then
        PYTHONPATH="$(python -c 'import sys; print( ":".join(sys.path))')" \
        command bpython "$@"
    else
        command bpython "$@"
    fi
}
alias slack="export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; locale; weechat"
alias lgb="export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; locale;"

function gist() {
    repo="$1"
    shift
    if [ "$repo" = "clone" ]; then
        repo="$1"
        shift
    fi
    git clone git@gist.github.com:"$repo".git "$@"
}

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

#export PYTHONPATH="$(brew --prefix)/lib/python3.6/site-packages:$PYTHONPATH"
