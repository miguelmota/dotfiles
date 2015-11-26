# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Exports
if [ -f ~/.exports ]; then
   . ~/.exports
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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

# Aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# Bash Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

#if [ -f ~/.bash_profile ]; then
#    . ~/.bash_profile
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

###
# Prompt display current directory only in green
#export PS1="\n\n\[\033[0;32m\]\W\[\033[00m\]: "
#export PS2="\[\033[0;32m\]>\[\033[00m\] "
####

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

#export PS1="\n\n\[\033[0;36m\]\u@$(hostname)\[\033[00m\]\[\033[0;32m\] : \w\[\033[00m\]\n\[\033[00;32m\]\$\[\033[00m\] "
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
export PS1='\n\n\[\033[0;36m\]\u@$(hostname)\[\033[00m\]\[\033[0;96m\] : \w\[\033[00m\] \[\033[00;96m\]$(parse_git_branch)\n\[\033[00;96m\]\$\[\033[00m\] '
export PS2="\[\033[0;96m\]>\[\033[00m\] "

# z - jump around
. ~/.z.sh

# /usr/local/bin/tmux list-sessions
if [ $? -ne 0 ]; then
	/usr/local/bin/tmux
fi

# Gets rid of "bash: update_terminal_cwd: command not found" error
unset PROMPT_COMMAND

# Git branch prompt
source ~/.bin/git-prompt.sh

# . /Users/moogs/Dropbox/dotfiles/powerline/powerline/bindings/bash/powerline.sh

function _update_ps1() {
    export PS1="$(~/Dropbox/dotfiles/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

# export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# ctrl-r reverse
stty -ixon
