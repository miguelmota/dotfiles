#!/bin/bash

unamestr=$(uname)

filesToLink=(
	"aliases"
	"ackrc"
	"apache2"

	"bash_aliases"
	"bash_profile"
	"bashrc"

	"bin"
	#"coffeelint.json"
	#"config"
	"cortex"
	"dircolors"
	"docker"
	"elinks" 
	"emacs.d" 
	"filezilla"
	"functions"
	"fonts"

	"gcalcli"
	"gemrc"
	"ghci"
	"gitattributes"
	"gitconfig"
	"gitmodules"
	"gitradarrc"
	"gitignore"

	"httpie"
	"hushlogin"
	"irssi"
	"jupyter"
	"mc"
	"mongo"
	"mutt"
	"muttrc"
	"NERDTreeBookmarks"
	"powerline"
	"profile"
	"promptrc"
	"pyhn"
	"redis"
	"s3cfg"
	#"ssh"

	"tern-config"
	"themes"
	"tmux"
	"tmux.conf"
	"tmuxinator"
	#"twitter-alarm"

	"urxvt"

	#"vim"
	#"vimrc"
	#viminfo"

	"wegorc"
	"w3m"
	"weinre"

	"Xresources"
	"Xdefaults"

	"oh-my-zsh"

	"zshrc"
	"zshrc-e"
	"zsh-update"

	"zprezto"
	"zpreztorc"
	"zlogin"
	"zlogout"
	"zshenv"
	"zprofile"
)

for f in ${filesToLink[@]}; do
	if [ -d ~/.$f ] || [ -f ~/.$f ]; then
		echo "~/.$f exists; skipping."
	else
		if [ -d $f ] || [ -f $f ]; then
			echo "symlinking ~/Dotfiles/dotfiles/$f -> ~/.$f"
			ln -snf ~/Dotfiles/dotfiles/$f ~/.$f
		else
			echo "$f not found; skipping."
		fi
	fi
done

#ln -snf ~/Dotfiles/dotfiles/aliases.local ~/.aliases.local

#sudo ln -snf ~/Dropbox/.apache2/httpd.conf /etc/apache2/httpd.conf
#sudo ln -snf ~/Dropbox/.apache2/httpd.conf /private/etc/apache2/httpd.conf
#sudo ln -snf ~/Dropbox/.apache2/users/moogs.conf /etc/apache2/users/moogs.conf

if [[ "$unamestr" == 'Darwin' ]]; then
	echo "symlinking ~/Dotfiles/dotfiles/homebrew -> ~/.homebrew"
	ln -snf ~/Dotfiles/dotfiles/homebrew ~/.homebrew
fi


#ln -snf ~/Dotfiles/dotfiles/webstorm ~/.webstorm
#if [[ "$unamestr" == 'Darwin' ]]; then
	#ln -snf ~/Dropbox/.webstorm/colors /Users/moogs/Library/Preferences/WebStorm7/colors
#fi

# ln -snf ~/Dotfiles/dotfiles/stickies/StickiesDatabase ~/Library/StickiesDatabase

echo "symlinking ~/Dotfiles/dotfiles/z/z.sh -> ~/.z.sh"
ln -snf ~/Dotfiles/dotfiles/z/z.sh ~/.z.sh

# Packages
if [[ "$unamestr" == 'Darwin' ]]; then
	# TODO install brew if not installed
	
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
	if [ -f "/etc/debian_version" ]; then
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
		sudo apt-get install net-tools -y
		sudo apt-get install nmap -y
	  	sudo apt-get install font-manager -y
	fi
fi

echo "installing fonts"
if [[ "$unamestr" == 'Darwin' ]]; then
	(cd ./fonts && ./install)
else
	fc-cache -f -v ~/.fonts
fi

if [ ! -f $HOME/.tmux/plugins/tpm/bin/install_plugins ]; then
	echo "Installing ~/.tmux/plugins/tpm"
	rm -rf $HOME/.tmux/plugins/*
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# For powerline
#pip install psutil
#pip install --upgrade pip

if [ ! -d "/usr/lib/urxvt/perl" ]; then
	echo "Copying urxvt perls"
	sudo mkdir -p /usr/lib/urxvt/perl
	sudo cp urxvt/ext/* /usr/lib/urxvt/perl/
fi

echo "sourcing ~/.bashrc"
source ~/.bashrc

echo "done."
