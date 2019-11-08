# Exports
if [ -f ~/.exports ]; then
   . ~/.exports
fi

# User configuration

#export PATH="/Users/moogs/.rbenv/shims:/Users/moogs/Library/Python/2.7/bin:/usr/local/heroku/bin:/Users/moogs/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/moogs/.rbenv/shims:/Users/moogs/Library/Python/2.7/bin:/usr/local/heroku/bin:/Users/moogs/bin:~/Dropbox/Development/adt-bundle-mac-x86_64-20131030/sdk/tools:~/Dropbox/Development/adt-bundle-mac-x86_64-20131030/sdk/tools:/Users/moogs/.rvm/bin:/Users/moogs/.rvm/bin:/Users/moogs/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Functions
if [ -f ~/.functions ]; then
   . ~/.functions
fi

# Aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# z - jump around
. ~/.z.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
