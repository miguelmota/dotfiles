# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# This will start xinit, but only on TTY1. xinit will read xinitrc and start i3 and keep the X session alive until i3 exists.
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty3 ]]; then
  startx
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# Show timestamp in history
HISTTIMEFORMAT='%F %T %t'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Functions
if [ -f ~/.functions ]; then
	. ~/.functions
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Personalized aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

#if [ -f ~/.bash_profile ]; then
#    . ~/.bash_profile
#fi

if [ -f ~/.profile ] && [ -z "$_BASHRC_SOURCING_PROFILE" ]; then
  _BASHRC_SOURCING_PROFILE=1
  . ~/.profile
  unset _BASHRC_SOURCING_PROFILE
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# fedora
if [ -f /etc/profile.d/bash_completion.sh ] && ! shopt -oq posix; then
	. /etc/profile.d/bash_completion.sh
fi

### Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

#export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
export TERM=screen-256color       # for a tmux -2 session (also for screen) (set this)
#export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session
#export TERM=rxvt-unicode-256colors

parse_git_dirty() {
  # for some reason using just `git` doesn't work with urxvt
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Git radar
if [ -d "$HOME/.git-radar" ]; then
  export PATH=$PATH:$HOME/.git-radar
fi

# z - jump around
if [ -f ~/.z.sh ]; then
  . ~/.z.sh
fi

# Android SDK
ANDROID_PATH="~/Development/adt-bundle-mac-x86_64-20131030/sdk/tools"
if [ -d "$ANDROID_PATH" ]; then
  export PATH="$PATH:$ANDROID_PATH"
fi

# /usr/local/bin/tmux list-sessions
if [ $? -ne 0 ]; then
  if [ -x "/usr/local/bin/tmux" ]; then
    /usr/local/bin/tmux
  fi
fi

# Midnight Commander theme
if [ -f "$HOME/.mc/lib/mc-solarized-skin/solarized.ini" ]; then
  export MC_SKIN="$HOME/.mc/lib/mc-solarized-skin/solarized.ini"
fi

# Preferred editors
export EDITOR="/usr/bin/nvim"
export PAGER="/bin/less"
export VISUAL="/usr/bin/nvim"

# dircolors
export CLICOLOR=YES
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Powerline
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
	export PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

# disabled because it's causing prompt to be slow
#if [ -f ~/.powerline/powerline/bindings/bash/powerline.sh ]; then
  #  source ~/.powerline/powerline/bindings/bash/powerline.sh
  # . $HOME/Dotfiles/dotfiles/powerline/powerline/bindings/bash/powerline.sh
#fi

# Homebrew Github API Token
if [ -f ~/.homebrew/github_api_token ]; then
  export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew/github_api_token)
fi

# Gets rid of "bash: update_terminal_cwd: command not found" error
unset PROMPT_COMMAND

# Git branch prompt
if [ -f ~/.bin/git-prompt.sh ]; then
  source ~/.bin/git-prompt.sh
fi

# Ansible SSH
export ANSIBLE_TRANSPORT="ssh"
export ANSIBLE_SSH_ARGS="-o ForwardAgent=yes"

# Bin path
if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

# ClosureScript
#export CLOJURESCRIPT_HOME="~/Development/workspace/clojurescript"

# Sublime Text Link
# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:$PATH

function _update_ps1() {
    export PS1="$($HOME/Dotfiles/dotfiles/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

# export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# ctrl-r reverse
stty -ixon

# Docker exports
if [ -d ~/.docker/machine/certs/ ]; then
  export DOCKER_CERT_PATH=$(echo $HOME)/.docker/machine/certs/
  export DOCKER_TLS_VERIFY=1
  export DOCKER_HOST=tcp://192.168.59.103:2376
fi

# JDK
if [ -e /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

# Pebble exports
#export PEBBLE_PHONE=192.168.0.2

# Artifactory exports
#export ARTIFACTORY_HOME=$(echo $HOME)/Development/acorns/artifactory-3.9.2

# Alexa Voice Service
#export LD_LIBRARY_PATH=/Applications/VLC.app/Contents/MacOS/lib
#export VLC_PLUGIN_PATH=/Applications/VLC.app/Contents/MacOS/plugins

# git path
export PATH=$PATH:/bin/git

# Fortune quote
alias f='command_exists fortune && command_exists cowsay && command_exists lolcat && fortune | cowsay | lolcat'

if [ -n "$DISPLAY" ] && command -v fortune &>/dev/null && command -v cowsay &>/dev/null && command -v lolcat &>/dev/null; then
  fortune | cowsay | lolcat
fi

#export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox
#export PATH=$PATH:$HOME/Sandbox/reportal-e2e/slimerjs-0.10.0

if [ -f ~/.env ]; then
  source ~/.env
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d "$HOME/.rvm/bin" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

#export FZF_CTRL_R_OPTS='--sort --exact'

# Turn off Ubuntu bell error bell sound
#bind 'set bell-style none'

export SANDBOX="$HOME/Sandbox"

# keep this at the bottom
if [ -f ~/.promptrc ]; then
  source ~/.promptrc
fi

# make this be very last
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	#exec tmux
#fi

if [ -d "$HOME/.deno" ]; then
  export DENO_INSTALL="$HOME/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi
#[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# go path
if [ -d "$HOME/go" ]; then
  export GOPATH=$HOME/go
  #export GOROOT=$GOPATH/bin
  #export GOROOT=/usr/bin/go
  export PATH=$PATH:$GOPATH/bin
  unset GOROOT
fi

# https://github.com/mattn/go-sqlite3/issues/803
# export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"

export STATUSBAR=polybar

# brew on linux
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# snapcraft
if [ -d "/var/lib/snapd/snap/bin" ]; then
  export PATH=$PATH:/var/lib/snapd/snap/bin
fi

# Fix ugly fonts in Java applications
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
# Fix menu click issues in Java applications
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -d "$HOME/.foundry/bin" ]; then
  export PATH="$PATH:$HOME/.foundry/bin"
fi

if command -v fnm &> /dev/null; then
  # fnm
  FNM_PATH="$HOME/.local/share/fnm"
  if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "`fnm env`"
  fi

  eval "$(fnm env --use-on-cd --shell bash)"
fi

if [ -d "/opt/cuda" ]; then
  export PATH=/opt/cuda/bin:$PATH
  export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH
fi

# Added by LM Studio CLI (lms)
if [ -d "$HOME/.lmstudio/bin" ]; then
  export PATH="$PATH:$HOME/.lmstudio/bin"
fi

# Start ssh-agent on login
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

# Ensure SSH_AUTH_SOCK is set for this shell (in case agent was already running)
if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK=$(find /tmp -type s -user "$USER" -name agent.\* 2>/dev/null | head -n 1)
fi

# add Pulumi to the PATH
if [ -d "$HOME/.pulumi/bin" ]; then
  export PATH=$PATH:$HOME/.pulumi/bin
fi
