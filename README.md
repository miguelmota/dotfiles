# dotfiles

> My dot files

NOTE: It's not recommended that you install this on your machine since it's highly personalized for my workspace.

But I do recommend checking out these files and directories that contain useful snippets and programs:

- [`functions`](functions)
- [`aliases`](aliases)
- [`tmux.conf`](tmux.conf)
- [`promptrc`](promptrc)
- [`bin`](bin)

My vim config is on a seperate repo [vim-config](https://github.com/miguelmota/vim-config).

**Reference**

Below are references to help me recall certain shortcuts and tips.

[Tmux](http://tmux.sourceforge.net/)

```bash
:resize-pane -D 10
```

```bash
brew install tmux
```

```bash
~/.tmux.conf

# Prefix
Ctrl + b

# Paste
Prefix + ]

# Copy mode
Prefix + [

# Select mode
v

# Yank
y

# Rename session
Prefix + $

# Rename window
Prefix + ,

# Install plugins
prefix + I
# Update plugins
prefix + U
# Resurrect
prefix + Ctrl-s - save
prefix + Ctrl-r - restore

# go to window index
prefix + ' '
Use C-b ' to select the window index.

# select window
prefix + w
```

Terminal

```bash
# Delete to left
ctr u

# Delete to right
ctr k

# Delete word backwards
esc delete
```

<!--
```
Terminal Solarized

https://github.com/tomislav/osx-terminal.app-colors-solarized

brew install python
brew install reattach-to-user-namespace
make reattach-to-user-namespace &&
cp reattach-to-user-namespace ~/bin

Powerline
sudo port selfupdate
sudo port install python27
brew install vim
sudo easy_install pip
sudo pip install --user git+git://github.com/Lokaltog/powerline

https://github.com/milkbikis/powerline-shell
```
-->


[Tmux powerline](https://github.com/erikw/tmux-powerline)

```bash
brew install --use-gcc fontforge
 ```

[fzf](https://github.com/junegunn/fzf) - fuzzy finder

```
Key bindings (CTRL-T, CTRL-R)

sbtrkt	fuzzy-match	Items that match sbtrkt
^music	prefix-exact-match	Items that start with music
.mp3$	suffix-exact-match	Items that end with .mp3
'wild	exact-match (quoted)	Items that include wild
!fire	inverse-exact-match	Items that do not include fire
!.mp3$	inverse-suffix-exact-match

vim **<TAB>
cd **<TAB>
kill -9 <TAB>
ssh **<TAB>
telnet **<TAB>
unset **<TAB>
export **<TAB>
unalias **<TAB>
``

[Midnight Commander](https://www.midnight-commander.org/)

```bash
brew install mc
```

```bash
~/.config/mc/hotlist

# open hotlist
Ctr + \

# Search
Ctr + s
```


Amazon S3 command line client [S3cmd](http://s3tools.org/s3cmd)

```
brew install s3cmd
```

```bash
~/.s3cfg

# List Buckets
s3cmd ls

# Create Bucket
s3cmd mb s3://foo

# Upload File and make public
s3cmd put --acl-public qux.txt s3://foo/

# Make all public
s3cmd setacl --acl-public --recursive

# Upload Directory
s3cmd put -r qux s3://foo/

# List bucket files
s3cmd ls s3://foo/

# Download file
s3cmd get s3://foo/qux.txt

# Delete file
s3cmd del s3://foo/qux.txt

# Delete directory
s3cmd del s3://foo/qux

# Delete bucket
s3cmd rb s3://foo

# File url
http://[bucket].s3.amazonaws.com/[filename]
```

[MacVim](https://code.google.com/p/macvim/)

```bash
brew install macvim --override-system-vim && brew linkapps
```

[Pygments](http://pygments.org/)

```bash
sudo easy_install Pygments
```

# License

[MIT](LICENSE)