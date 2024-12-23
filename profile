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

# Set Ulimit
ulimit -n 2048

# RVM
# Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/bin" ]] && export PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH"
[[ -s "$HOME/.rvm/bin" ]] && export PATH=$PATH:$HOME/.rvm/bin
[[ -d "$HOME/.rvm/gems/ruby-2.6.3/bin" ]] && export PATH=$PATH:$HOME/.rvm/gems/ruby-2.6.3/bin
[[ -d "$HOME/.gem/ruby/2.6.3/bin" ]] && export PATH=$PATH:$HOME/.gem/ruby/2.6.3/bin
[[ -d "$HOME/.gem/ruby/2.7.0/bin" ]] && export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
# Source if rvm exists
#command -v rvm >/dev/null 2>&1 && source $(rvm default do rvm env --path) && rvm get stable --auto-dotfiles

# Eval if rbenv exists
#command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

 # Load NVM

# nvm() {
#     unset -f nvm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     nvm "$@"
# }

# node() {
#     unset -f node
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     node "$@"
# }

# npm() {
#     unset -f npm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     npm "$@"
# }

# jest() {
#     unset -f jest
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     jest "$@"
# }

# yarn() {
#     unset -f yarn
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     yarn "$@"
# }

# export PATH=~/.nvm/versions/node/v16.5.0/bin:$PATH
# export NVM_DIR=~/.nvm
# [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

export NVM_DIR="$HOME/.nvm"

# This lazy loads nvm
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  nvm $@
}

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# This resolves the default node version
DEFAULT_NODE_VER="$((cat "$NVM_DIR/alias/default" || cat ~/.nvmrc) 2> /dev/null)"
while [ -s "$NVM_DIR/alias/$DEFAULT_NODE_VER" ] && [ ! -z "$DEFAULT_NODE_VER" ]; do
  DEFAULT_NODE_VER="$(cat "$NVM_DIR/alias/$DEFAULT_NODE_VER")"
done

# This resolves the path to the default node version
DEFAULT_NODE_VER_PATH="$(find $NVM_DIR/versions/node -maxdepth 1 -name "v${DEFAULT_NODE_VER#v}*" | sort -rV | head -n 1)"

# This adds the default node version path to PATH
if [ ! -z "$DEFAULT_NODE_VER_PATH" ]; then
  export PATH="$DEFAULT_NODE_VER_PATH/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
