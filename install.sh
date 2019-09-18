#!/bin/bash

# TODO: only link if exists exists in directory. Throw error if exists in home

unamestr=$(uname)

ln -snf ~/Dotfiles/dotfiles/aliases ~/.aliases
#ln -snf ~/Dotfiles/dotfiles/aliases.local ~/.aliases.local

ln -snf ~/Dotfiles/dotfiles/agignore ~/.agignore
ln -snf ~/Dotfiles/dotfiles/ackrc ~/.ackrc

ln -snf ~/Dotfiles/dotfiles/apache2 ~/.apache2
#sudo ln -snf ~/Dropbox/.apache2/httpd.conf /etc/apache2/httpd.conf
#sudo ln -snf ~/Dropbox/.apache2/httpd.conf /private/etc/apache2/httpd.conf
#sudo ln -snf ~/Dropbox/.apache2/users/moogs.conf /etc/apache2/users/moogs.conf

ln -snf ~/Dotfiles/dotfiles/bash_aliases ~/.bash_aliases
ln -snf ~/Dotfiles/dotfiles/bash_profile ~/.bash_profile
ln -snf ~/Dotfiles/dotfiles/bashrc ~/.bashrc
ln -snf ~/Dotfiles/dotfiles/bin ~/.bin
#ln -snf ~/Dotfiles/dotfiles/coffeelint.json ~/.coffeelint.json
#ln -snf ~/Dotfiles/dotfiles/config ~/.config
ln -snf ~/Dotfiles/dotfiles/cortex ~/.cortex
ln -snf ~/Dotfiles/dotfiles/dircolors ~/.dircolors
ln -snf ~/Dotfiles/dotfiles/docker ~/.docker
ln -snf ~/Dotfiles/dotfiles/elinks ~/.elinks
ln -snf ~/Dotfiles/dotfiles/emacs.d ~/.emacs.d
ln -snf ~/Dotfiles/dotfiles/filezilla ~/.filezilla
ln -snf ~/Dotfiles/dotfiles/functions ~/.functions

# Mac
# run ./install in ./fonts afterwards
# Linux
# fc-cache -f -v ~/.fonts
ln -snf ~/Dotfiles/dotfiles/fonts ~/.fonts

ln -snf ~/Dotfiles/dotfiles/gcalcli ~/.gcalcli
ln -snf ~/Dotfiles/dotfiles/gemrc ~/.gemrc
ln -snf ~/Dotfiles/dotfiles/ghci ~/.ghci
ln -snf ~/Dotfiles/dotfiles/gitattributes ~/.gitattributes
ln -snf ~/Dotfiles/dotfiles/gitconfig ~/.gitconfig
ln -snf ~/Dotfiles/dotfiles/gitmodules ~/.gitmodules
ln -snf ~/Dotfiles/dotfiles/gitradarrc ~/.gitradarrc
ln -snf ~/Dotfiles/dotfiles/gitignore ~/.gitignore

if [[ "$unamestr" == 'Darwin' ]]; then
ln -snf ~/Dotfiles/dotfiles/homebrew ~/.homebrew
fi

ln -snf ~/Dotfiles/dotfiles/httpie ~/.httpie
ln -snf ~/Dotfiles/dotfiles/hushlogin ~/.hushlogin
ln -snf ~/Dotfiles/dotfiles/irssi ~/.irssi
ln -snf ~/Dotfiles/dotfiles/jupyter ~/.jupyter
ln -snf ~/Dotfiles/dotfiles/mc ~/.mc
ln -snf ~/Dotfiles/dotfiles/mongo ~/.mongo
ln -snf ~/Dotfiles/dotfiles/mutt ~/.mutt
ln -snf ~/Dotfiles/dotfiles/muttrc ~/.muttrc
ln -snf ~/Dotfiles/dotfiles/NERDTreeBookmarks ~/.NERDTreeBookmarks
ln -snf ~/Dotfiles/dotfiles/powerline ~/.powerline
ln -snf ~/Dotfiles/dotfiles/profile ~/.profile
ln -snf ~/Dotfiles/dotfiles/promptrc ~/.promptrc
ln -snf ~/Dotfiles/dotfiles/pyhn ~/.pyhn
ln -snf ~/Dotfiles/dotfiles/redis ~/.redis
ln -snf ~/Dotfiles/dotfiles/s3cfg ~/.s3cfg
#ln -snf ~/Dotfiles/dotfiles/ssh ~/.ssh
ln -snf ~/Dotfiles/dotfiles/tern-config ~/.tern-config
ln -snf ~/Dotfiles/dotfiles/themes ~/.themes
ln -snf ~/Dotfiles/dotfiles/tmux ~/.tmux
ln -snf ~/Dotfiles/dotfiles/tmux.conf ~/.tmux.conf
ln -snf ~/Dotfiles/dotfiles/tmuxinator ~/.tmuxinator
#ln -snf ~/Dotfiles/dotfiles/twitter-alarm ~/.twitter-alarm

#ln -snf ~/Dotfiles/dotfiles/vim ~/.vim
#ln -snf ~/Dotfiles/dotfiles/vim/.vimrc ~/.vimrc
#ln -snf ~/Dotfiles/dotfiles/vim/.viminfo ~/.viminfo

ln -snf ~/Dotfiles/dotfiles/wegorc ~/.wegorc
ln -snf ~/Dotfiles/dotfiles/w3m ~/.w3m

#ln -snf ~/Dotfiles/dotfiles/webstorm ~/.webstorm
#if [[ "$unamestr" == 'Darwin' ]]; then
	#ln -snf ~/Dropbox/.webstorm/colors /Users/moogs/Library/Preferences/WebStorm7/colors
#fi

ln -snf ~/Dotfiles/dotfiles/weinre ~/.weinre

ln -snf ~/Dotfiles/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -snf ~/Dotfiles/dotfiles/zshrc ~/.zshrc
ln -snf ~/Dotfiles/dotfiles/zshrc-e ~/.zshrc-e
ln -snf ~/Dotfiles/dotfiles/zsh-update ~/.zsh-update
ln -snf ~/Dotfiles/dotfiles/z/z.sh ~/.z.sh

ln -snf ~/Dotfiles/dotfiles/zprezto ~/.zprezto
ln -snf ~/Dotfiles/dotfiles/zpreztorc ~/.zpreztorc
ln -snf ~/Dotfiles/dotfiles/zlogin ~/.zlogin
ln -snf ~/Dotfiles/dotfiles/zlogout ~/.zlogout
ln -snf ~/Dotfiles/dotfiles/zshenv ~/.zshenv
ln -snf ~/Dotfiles/dotfiles/zshenv ~/.zprofile
ln -snf ~/Dotfiles/dotfiles/zprofile ~/.zprofile

# ln -snf ~/Dotfiles/dotfiles/stickies/StickiesDatabase ~/Library/StickiesDatabase

# Packages
if [[ "$unamestr" == 'Darwin' ]]; then
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
else
	sudo apt-get update -y
	sudo apt-get install git -y
	sudo apt-get install vim -y
	sudo apt-get install tmux -y
	sudo apt-get install wget -y
	sudo apt-get install curl -y
	sudo apt-get install make -y
	sudo apt-get install cmake -y
	sudo apt-get install build-essential -y
	sudo apt install gnome-tweak-tool -y
	sudo apt-get install dconf-tools -y
	sudo apt-get install xclip -y
fi

# For powerline
#pip install psutil
#pip install --upgrade pip

source ~/.bashrc
