#!/bin/bash

unamestr=$(uname)

filesToLink=(
  "aliases"
  "ackrc"
  "agignore"
  "apache2"

  "bash_aliases"
  "bash_profile"
  "bashrc"

  "bin"
  "coffeelint.json"
  "config/alacritty/alacritty.yml"
  "config/fontconfig/conf.d/10-powerline-symbols.conf"
  "config/i3/config"
  "config/i3/workspace-1.json"
  "config/i3/workspace-2.json"
  "config/i3/workspace-3.json"
  "config/i3/workspace-4.json"
  "config/i3/polybar.sh"
  "config/i3status/config"
  "config/kitty/kitty.conf"
  "config/i3blocks"
  "config/konsolerc"
  "config/lxterminal/lxterminal.conf"
  "config/neofetch/config.conf"
  "config/nvim/init.vim"
  "config/pcmanfm/default/pcmanfm.conf"
  "config/pcmanfm/lubuntu/desktop-items-0.conf"
  "config/pcmanfm/lubuntu/pcmanfm.conf"
  "config/pcmanfm/LXDE/desktop-items-0.conf"
  "config/pcmanfm/LXDE/pcmanfm.conf"
  "config/picom/config"
  "config/polybar/config"
  "config/powerline/colors.json"
  "config/powerline/colorschemes"
  "config/powerline/config.json"
  "config/powerline/themes"
  "config/qterminal.org/qterminal.ini"
  "config/rofi/config"
  "config/rofi/themes"
  "config/terminator/config"
  "cortex"
  "dircolors"
  "docker"
  "elinks"
  "emacs.d"
  "exports"
  "filezilla"
  "functions"
  "fonts"

  "gcalcli"
  "gemrc"
  "ghci"
  "gitattributes"
  #"gitconfig"
  "gitmodules"
  "gitradarrc"
  "gitignore"

  "httpie"
  "hushlogin"
  "irssi"
  "jupyter"
  "local/share/konsole/Main.profile"
  "local/share/konsole/Shapeshifter.colorscheme"
  "mc"
  "mongo"
  "mutt"
  "muttrc"
  "NERDTreeBookmarks"
  "powerline"
  "powerline-shell"
  "profile"
  "promptrc"
  "pyhn"
  "redis"
  "s3cfg"
  #"ssh"
  "terminal"
  "termite"
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

  #"z"
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
    if [ -d $f ] || [ -f $f ]; then
      if [ -L ~/.$f ]; then
        echo "~/.$f exists and is symlink; skipping."
      else
        echo "~/.$f exists (not a symlink but parent might be); skipping."
      fi
    fi
  else
    if [ -d $f ] || [ -f $f ]; then
      echo "symlinking ~/Dotfiles/dotfiles/$f -> ~/.$f"
      mkdir -p ~/.$(dirname $f)
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
  if [ -d ~/.homebrew ]; then
    if [ -L ~/.homebrew ]; then
      echo "~/.homebrew exists. skipping."
    else
      echo "~/.homebrew exists (not a symlink). skipping."
    fi
  else
    echo "symlinking ~/Dotfiles/dotfiles/homebrew -> ~/.homebrew"
    ln -snf ~/Dotfiles/dotfiles/homebrew ~/.homebrew
  fi
fi


#ln -snf ~/Dotfiles/dotfiles/webstorm ~/.webstorm
#if [[ "$unamestr" == 'Darwin' ]]; then
#ln -snf ~/Dropbox/.webstorm/colors /Users/moogs/Library/Preferences/WebStorm7/colors
#fi

# ln -snf ~/Dotfiles/dotfiles/stickies/StickiesDatabase ~/Library/StickiesDatabase

if [ -f ~/.z.sh ]; then
  if [ -L ~/.z.sh ]; then
    echo "~/.z.sh exists and is symlink. skipping."
  else
    echo "~/.z.sh exists (not a symlink). skipping."
  fi
else
  echo "symlinking ~/Dotfiles/dotfiles/z/z.sh -> ~/.z.sh"
  ln -snf ~/Dotfiles/dotfiles/z/z.sh ~/.z.sh
fi

# Packages
if [[ "$unamestr" == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

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
fi

if [ -f "/etc/debian_version" ]; then
  sudo apt-get update -y
  sudo apt-get install -y git
  sudo apt-get install -y vim
  sudo apt-get install -y tmux
  sudo apt-get install -y wget
  sudo apt-get install -y curl
  sudo apt-get install -y jq
  sudo apt-get install -y make
  sudo apt-get install -y cmake
  sudo apt-get install -y build-essential
  sudo apt-get install -y gnome-tweak-tool
  sudo apt-get install -y dconf-tools
  sudo apt-get install -y xclip
  sudo apt-get install -y net-tools
  sudo apt-get install -y nmap
  sudo apt-get install -y gnome-screenshot
  sudo apt-get install -y font-manager
  sudo apt-get install -y neofetch
fi

if grep NAME=Fedora /etc/os-release; then
  sudo dnf install -y git
  sudo dnf install -y vim
  sudo dnf install -y tmux
  sudo dnf install -y wget
  sudo dnf install -y curl
  sudo dnf install -y jq
  sudo dnf install -y xclip
  sudo dnf install -y tree
  sudo dnf install -y nmap
  sudo dnf install -y gnome-screenshot
  sudo dnf install -y make automake gcc gcc-c++
  sudo dnf install -y light
  sudo dnf install -y neofetch
  sudo dnf install -y bash-completion

  dnf copr enable gregw/i3desktop
  sudo dnf install i3-gaps --allowerasing
fi

if [ -f "/etc/arch-release" ]; then
	sudo pacman -S --noconfirm git
	sudo pacman -S --noconfirm vim
	sudo pacman -S --noconfirm tmux
	sudo pacman -S --noconfirm wget
	sudo pacman -S --noconfirm curl
	sudo pacman -S --noconfirm jq
	sudo pacman -S --noconfirm xclip
	sudo pacman -S --noconfirm tree
	sudo pacman -S --noconfirm nmap
	sudo pacman -S --noconfirm cmake

  # make user is part of 'video' group
	sudo pacman -S --noconfirm light

	sudo pacman -S --noconfirm neofetch
	sudo pacman -S --noconfirm bash-completion

  # adds amixer and alsamixer (tui)
	sudo pacman -S --noconfirm alsa-utils
	sudo pacman -S --noconfirm python-pywal

  # todo: if arch
  # install yay: https://gist.github.com/miguelmota/cd12465fe82548d20d8a8cbadf04732a
  # install vim-11: https://gist.github.com/miguelmota/08c7b5bedda4ba42563594af48618def
  # add user to 'audio' and 'video' groups
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

if [ ! -f "$HOME/.local/share/konsole/Main.profile" ]; then
  echo "Adding konsole profiles"
  mkdir -p $HOME/.local/share/konsole
  ln -snf $HOME/Dotfiles/dotfiles/local/share/konsole/Main.profile $HOME/.local/share/konsole/Main.profile
else
  if [ -L "$HOME/.local/share/konsole/Main.profile" ]; then
    echo "konsolerc profiles exists and is symlink. skipping."
  else
    echo "konsolerc profiles exists (not a symlink). skipping."
  fi
fi

if [ ! -f "$HOME/.local/share/wallpaper.jpg" ]; then
	(
		cd /tmp
		echo "Downloading wallpaper"
		wget https://user-images.githubusercontent.com/168240/73391163-56ca8d80-42cf-11ea-8f37-8693f161b618.jpg -O wallpaper.jpg
		mkdir -p $HOME/.local/share
		mv wallpaper.jpg $HOME/.local/share/wallpaper.jpg
	)
fi

echo "sourcing ~/.bashrc"
source ~/.bashrc


if [ ! -f "$TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load" ]; then
  (
  echo "installing tmux plugin dependencies"
  cd $TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load
  cmake .
  make
)
fi

mkdir -p ~/Desktop
mkdir -p ~/Downloads
mkdir -p ~/Sandbox

# demnu and rofi only read from /usr/bin so need to symlink.
# sudo ln -sf $HOME/.bin/shot /usr/bin/shot
# go get -u rsc.io/2fa

echo "done."
