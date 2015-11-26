# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
# if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#        . "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Set Ulimit
ulimit -n 2048

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
source ~/.profile
eval "$(rbenv init -)"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH"
source $(rvm default do rvm env --path)
rvm get stable --auto-dotfiles

 # Load NVM
[ -s "/Users/moogs/.nvm/nvm.sh" ] && . "/Users/moogs/.nvm/nvm.sh"
