#!/bin/bash

ln -snf ~/Dropbox/dotfiles/aliases ~/.aliases
ln -snf ~/Dropbox/dotfiles/aliases.local ~/.aliases.local

ln -snf ~/Dropbox/dotfiles/agignore ~/.agignore
ln -snf ~/Dropbox/dotfiles/ackrc ~/.ackrc

ln -snf ~/Dropbox/dotfiles/apache2 ~/.apache2
sudo ln -snf ~/Dropbox/.apache2/httpd.conf /etc/apache2/httpd.conf
sudo ln -snf ~/Dropbox/.apache2/httpd.conf /private/etc/apache2/httpd.conf
sudo ln -snf ~/Dropbox/.apache2/users/moogs.conf /etc/apache2/users/moogs.conf

ln -snf ~/Dropbox/dotfiles/bash_aliases ~/.bash_aliases
ln -snf ~/Dropbox/dotfiles/bash_profile ~/.bash_profile
ln -snf ~/Dropbox/dotfiles/bashrc ~/.bashrc
ln -snf ~/Dropbox/dotfiles/bin ~/.bin
ln -snf ~/Dropbox/dotfiles/coffeelint.json ~/.coffeelint.json
ln -snf ~/Dropbox/dotfiles/config ~/.config
ln -snf ~/Dropbox/dotfiles/dircolors ~/.dircolors
ln -snf ~/Dropbox/dotfiles/docker ~/.docker
ln -snf ~/Dropbox/dotfiles/elinks ~/.elinks
ln -snf ~/Dropbox/dotfiles/emacs.d ~/.emacs.d
ln -snf ~/Dropbox/dotfiles/filezilla ~/.filezilla
ln -snf ~/Dropbox/dotfiles/functions ~/.functions

# run ./install in ./fonts afterwards
ln -snf ~/Dropbox/dotfiles/fonts ~/.fonts

ln -snf ~/Dropbox/dotfiles/gcalcli ~/.gcalcli
ln -snf ~/Dropbox/dotfiles/gemrc ~/.gemrc
ln -snf ~/Dropbox/dotfiles/gitattributes ~/.gitattributes
ln -snf ~/Dropbox/dotfiles/gitconfig ~/.gitconfig
ln -snf ~/Dropbox/dotfiles/gitmodules ~/.gitmodules
ln -snf ~/Dropbox/dotfiles/gitradarrc ~/.gitradarrc
ln -snf ~/Dropbox/dotfiles/homebrew ~/.homebrew
ln -snf ~/Dropbox/dotfiles/httpie ~/.httpie
ln -snf ~/Dropbox/dotfiles/irssi ~/.irssi
ln -snf ~/Dropbox/dotfiles/hushlogin ~/.hushlogin
ln -snf ~/Dropbox/dotfiles/mc ~/.mc
ln -snf ~/Dropbox/dotfiles/mongo ~/.mongo
ln -snf ~/Dropbox/dotfiles/mutt ~/.mutt
ln -snf ~/Dropbox/dotfiles/muttrc ~/.muttrc
ln -snf ~/Dropbox/dotfiles/NERDTreeBookmarks ~/.NERDTreeBookmarks
ln -snf ~/Dropbox/dotfiles/powerline ~/.powerline
ln -snf ~/Dropbox/dotfiles/profile ~/.profile
ln -snf ~/Dropbox/dotfiles/promptrc ~/.promptrc
ln -snf ~/Dropbox/dotfiles/redis ~/.redis
ln -snf ~/Dropbox/dotfiles/s3cfg ~/.s3cfg
ln -snf ~/Dropbox/dotfiles/ssh ~/.ssh
ln -snf ~/Dropbox/dotfiles/themes ~/.themes
ln -snf ~/Dropbox/dotfiles/tmux ~/.tmux
ln -snf ~/Dropbox/dotfiles/tmux.conf ~/.tmux.conf
ln -snf ~/Dropbox/dotfiles/tmuxinator ~/.tmuxinator
ln -snf ~/Dropbox/dotfiles/twitter-alarm ~/.twitter-alarm

ln -snf ~/Dropbox/dotfiles/vim ~/.vim
ln -snf ~/Dropbox/dotfiles/vim/.vimrc ~/.vimrc
ln -snf ~/Dropbox/dotfiles/vim/.viminfo ~/.viminfo

ln -snf ~/Dropbox/dotfiles/w3m ~/.w3m

ln -snf ~/Dropbox/dotfiles/webstorm ~/.webstorm
ln -snf ~/Dropbox/.webstorm/colors /Users/moogs/Library/Preferences/WebStorm7/colors

ln -snf ~/Dropbox/dotfiles/weinre ~/.weinre

ln -snf ~/Dropbox/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -snf ~/Dropbox/dotfiles/zshrc ~/.zshrc
ln -snf ~/Dropbox/dotfiles/zshrc-e ~/.zshrc-e
ln -snf ~/Dropbox/dotfiles/zsh-update ~/.zsh-update
ln -snf ~/Dropbox/dotfiles/z/z.sh ~/.z.sh

ln -snf ~/Dropbox/dotfiles/zprezto ~/.zprezto
ln -snf ~/Dropbox/dotfiles/zpreztorc ~/.zpreztorc
ln -snf ~/Dropbox/dotfiles/zlogin ~/.zlogin
ln -snf ~/Dropbox/dotfiles/zlogout ~/.zlogout
ln -snf ~/Dropbox/dotfiles/zshenv ~/.zshenv
ln -snf ~/Dropbox/dotfiles/zshenv ~/.zprofile
ln -snf ~/Dropbox/dotfiles/zprofile ~/.zprofile

# ln -snf ~/Dropbox/dotfiles/stickies/StickiesDatabase ~/Library/StickiesDatabase

# Packages
brew install vim
brew install tmux
brew install wget
brew install michaeldfallen/formula/git-radar
brew install tree
brew install fortune
brew install reattach-to-user-namespace
brew install hub
brew install python # installs pip
pip install powerline

# For powerline
pip install psutil
pip install --upgrade pip
