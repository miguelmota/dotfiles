#!/bin/bash

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles/dotfiles}"
INSTALL_PACKAGES="${INSTALL_PACKAGES:-false}"
WALLPAPER_URL="https://user-images.githubusercontent.com/168240/73391163-56ca8d80-42cf-11ea-8f37-8693f161b618.jpg"

cd "$DOTFILES_DIR" || { echo "Error: DOTFILES_DIR '$DOTFILES_DIR' not found."; exit 1; }

unamestr=$(uname)

filesToLink=(
  "aliases"
  "ackrc"
  "agignore"
  #"apache2" # system service config; machine-specific, not a user dotfile

  "bash_aliases"
  "bash_profile"
  "bashrc"

  "bin"
  "coffeelint.json"
  "config/alacritty/alacritty.toml"
  "config/Code/User/settings.json"
  "config/Code/User/keybindings.json"
  "config/fontconfig/conf.d/10-powerline-symbols.conf"
  "config/fontconfig/fonts.conf"
  "config/bspwm/bspwmrc"
  "config/sxhkd/sxhkdrc"
  "config/dunst/dunstrc"
  "config/i3/config"
  "config/i3/workspace-1.json"
  "config/i3/workspace-2.json"
  "config/i3/workspace-3.json"
  "config/i3/workspace-4.json"
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
  #"config/pgcli/config" # may contain stored database passwords
  "config/picom/config"
  "config/polybar/config"
  "config/polybar/battery-combined.sh"
  "config/polybar/microphone.sh"
  "config/polybar/polybar.sh"
  "config/powerline/colors.json"
  "config/powerline/colorschemes"
  "config/powerline/config.json"
  "config/powerline/themes"
  "config/qterminal.org/qterminal.ini"
  "config/ranger/rc.conf"
  "config/ranger/rifle.conf"
  "config/rofi/config"
  "config/rofi/themes"
  "config/cava/config"
  "config/terminator/config"
  "config/firejail"
  "cortex"
  "dircolors"
  #"docker" # config.json stores registry auth tokens
  "elinks"
  "emacs.d"
  #"exports" # commonly contains exported API keys and secrets
  #"filezilla" # stores saved FTP/SFTP passwords
  "functions"
  "fonts"

  #"gcalcli" # stores Google OAuth tokens
  "gemrc"
  "ghci"
  "gitattributes"
  #"gitconfig"
  "gitmodules"
  "gitradarrc"
  "gitignore"

  #"httpie" # session files can contain auth tokens
  "hushlogin"
  #"irssi" # may contain NickServ and server passwords
  "jupyter/nbconfig/edit.json"
  "local/share/konsole/Main.profile"
  "local/share/konsole/Shapeshifter.colorscheme"
  "local/share/fonts"
  "mc"
  #"mongo" # may contain connection strings with credentials
  #"mutt"  # email client config, may contain passwords
  #"muttrc" # email client config, may contain passwords
  "NERDTreeBookmarks"
  "powerline"
  "powerline-shell"
  "profile"
  "promptrc"
  "pyhn"
  #"redis" # may contain auth passwords
  #"s3cfg" # contains AWS access key and secret key
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

  #"wegorc" # contains weather API key
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

for f in "${filesToLink[@]}"; do
  target=~/."$f"
  if [ -d "$target" ] || [ -f "$target" ] || [ -L "$target" ]; then
    if [ -L "$target" ]; then
      echo "$target already exists (symlink); skipping."
    else
      echo "$target already exists; skipping."
    fi
  elif [ -d "$f" ] || [ -f "$f" ]; then
    echo "symlinking $DOTFILES_DIR/$f -> $target"
    mkdir -p ~/.$(dirname "$f")
    ln -sn "$DOTFILES_DIR/$f" "$target"
  else
    echo "$f not found; skipping."
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
    echo "symlinking $DOTFILES_DIR/homebrew -> ~/.homebrew"
    ln -snf "$DOTFILES_DIR/homebrew" ~/.homebrew
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
  echo "symlinking $DOTFILES_DIR/z/z.sh -> ~/.z.sh"
  ln -snf "$DOTFILES_DIR/z/z.sh" ~/.z.sh
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

if [ -f "/etc/debian_version" ] && [[ "$INSTALL_PACKAGES" == "true" ]]; then
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
  sudo apt-get install -y gnome-tweaks
  sudo apt-get install -y dconf-editor
  sudo apt-get install -y xclip
  sudo apt-get install -y net-tools
  sudo apt-get install -y nmap
  sudo apt-get install -y gnome-screenshot
  sudo apt-get install -y font-manager
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
  sudo pacman -S --noconfirm the_silver_searcher
  sudo pacman -S --noconfirm lsof

  sudo pacman -S --noconfirm qbittorrent

  # make sure to add `numlockx on` to ~/.xinitrc afterwards
  sudo pacman -S --noconfirm numlockx

  # make user is part of 'video' group
  sudo pacman -S --noconfirm light

  sudo pacman -S --noconfirm neofetch
  sudo pacman -S --noconfirm bash-completion

  # adds amixer and alsamixer (tui)
  sudo pacman -S --noconfirm alsa-utils
  sudo pacman -S --noconfirm python-pywal

  # keccak-256sum
  sudo pacman -S --noconfirm sha3sum

  # github hub cli
  sudo pacman -S hub

  if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  fi

  if command -v yay &> /dev/null; then
    # image viewer
    yay -S mirage --noconfirm # right click image -> open with -> set default image viewer

    # pdf viewer
    yay -S okular --noconfirm

    # vim with clipboard support
    yay -S gvim --noconfirm

    # git and hub
    yay -S git
    yay -S github-cli

    # ebook reader
    yay -S calibre --noconfirm

    # GTK+ various command line archivers
    yay -S xarchiver --noconfirm

    # GTK2 file manager (default in LXDE)
    yay -S pcmanfm --noconfirm

    # GTK+ image viewer
    yay -S mirage --noconfirm

    # browsers
    yay -S google-chrome --noconfirm
    yay -S google-chrome-canary --noconfirm
    yay -S google-chrome-dev --noconfirm
    yay -S brave-bin --noconfirm
    yay -S firefox --noconfirm

    # excel, word, etc
    yay -S libreoffice-still --noconfirm

    # emoji fonts
    yay -S noto-fonts-emoji --noconfirm
    fc-cache -fv # update cache, will require restart of applications to take effect

    # other
    yay -S ripgrep --noconfirm
    yay -S vlc --noconfirm
    yay -S mullvad-vpn --noconfirm
    yay -S audacity --noconfirm

    # screenshot
    yay -S deepin-screenshot --noconfirm

    # gif screen recorder
    yay -S peek --noconfirm
  fi

  # add user to 'audio' and 'video' groups
  sudo usermod -aG audio,video $USER
fi

if [[ "$OSTYPE" == "freebsd"* ]]; then
  pkg install sudo
fi

echo "installing fonts"
if [[ "$unamestr" == 'Darwin' ]]; then
  (cd ./fonts && ./install)
else
  fc-cache -vf
fi

if [ ! -f "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
  echo "Installing ~/.tmux/plugins/tpm"
  if [ -d "$HOME/.tmux/plugins" ] && [ -n "$(ls -A "$HOME/.tmux/plugins" 2>/dev/null)" ]; then
    read -r -p "This will remove all existing tmux plugins in ~/.tmux/plugins. Continue? [y/N] " confirm
    [[ "$confirm" =~ ^[Yy]$ ]] || { echo "Skipping tmux plugin install."; goto_end=true; }
  fi
  if [[ "$goto_end" != "true" ]]; then
    rm -rf "$HOME"/.tmux/plugins/*
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi
fi

# For powerline
#pip install psutil
#pip install --upgrade pip

if [ ! -d "/usr/lib/urxvt/perl" ]; then
  read -r -p "Copy urxvt perls to /usr/lib/urxvt/perl? This may overwrite existing files. [y/N] " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "Copying urxvt perls"
    sudo mkdir -p /usr/lib/urxvt/perl
    sudo cp urxvt/ext/* /usr/lib/urxvt/perl/
  else
    echo "Skipping urxvt perl copy."
  fi
fi

if [ ! -f "$HOME/.local/share/konsole/Main.profile" ]; then
  echo "Adding konsole profiles"
  mkdir -p $HOME/.local/share/konsole
  ln -snf "$DOTFILES_DIR/local/share/konsole/Main.profile" "$HOME/.local/share/konsole/Main.profile"
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
    if wget -q --spider "$WALLPAPER_URL" 2>/dev/null; then
      wget -q "$WALLPAPER_URL" -O wallpaper.jpg
      mkdir -p "$HOME/.local/share"
      mv wallpaper.jpg "$HOME/.local/share/wallpaper.jpg"
    else
      echo "Wallpaper URL unavailable; skipping."
    fi
  )
fi

echo "sourcing ~/.bashrc"
source ~/.bashrc


if [ -n "$TMUX_PLUGIN_MANAGER_PATH" ]; then
  if [ ! -f "$TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load" ]; then
    if [ -d "$TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load" ]; then
      echo "installing tmux plugin dependencies"
      (
        cd "$TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load"
        cmake .
        make
      )
    fi
  fi
fi

mkdir -p ~/Desktop
mkdir -p ~/Downloads
mkdir -p ~/Sandbox

# demnu and rofi only read from /usr/bin so need to symlink.
# sudo ln -sf $HOME/.bin/shot /usr/bin/shot
# go get -u rsc.io/2fa

echo "done."
