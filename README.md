# dotfiles

My dot files. It's not recommended that you install this on your machine since it's highly personalized for my workspace.

The files you might find useful are:

- `functions`
- `bash_aliases`
- `tmux.conf`

My vim config is on a seperate repo [vim-config](https://github.com/miguelmota/vim-config).

Reference

[Tmux](http://tmux.sourceforge.net/)

```bash
brew install tmux
```

```bash
~/.tmux.conf

\# Prefix
Ctrl + b

\# Paste
Prefix + ]

\# Copy mode
Prefix + [

\# Select mode
v

\# Yank
y
```

" macvim
brew install macvim --override-system-vim && brew linkapps"

Terminal

```bash
\# Delete to left
ctr u 

\# Delete to right
ctr k 

\# Delete word backwards
esc delete 
```

[Midnight Commander](https://www.midnight-commander.org/)

```bash
brew install mc
```

```bash
~/.config/mc/hotlist

\# open hotlist
Ctr + \

\# Search
Ctr + s
```


Amazon S3 command line client [S3cmd](http://s3tools.org/s3cmd)

```
brew install s3cmd
```

```bash
~/.s3cfg

\# List Buckets
s3cmd ls

\# Create Bucket
s3cmd mb s3://foo

\# Upload File and make public
s3cmd put --acl-public qux.txt s3://foo/

\# Make all public
s3cmd setacl --acl-public --recursive

\# Upload Directory
s3cmd put -r qux s3://foo/

\# List bucket files
s3cmd ls s3://foo/

\# Download file
s3cmd get s3://foo/qux.txt

\# Delete file
s3cmd del s3://foo/qux.txt

\# Delete directory
s3cmd del s3://foo/qux

\# Delete bucket
s3cmd rb s3://foo

\# File url
http://[bucket].s3.amazonaws.com/[filename]
```

[Pygments](http://pygments.org/)

```bash
sudo easy_install Pygments
```