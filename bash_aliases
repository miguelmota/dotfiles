# Aliases
#
# add to ~./bashrc:
#
# if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
# fi
#
# then execute:
#
# source ~./bashrc
# or . ~./bashrc
#

# Directory aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias cdh='cd ~/'
alias cddocs='cd ~/Documents/'
alias cdd='cd ~/Downloads/'
alias cddb='cd ~/Dropbox/'
alias cdusrlogs='cd /usr/local/var/log'
alias cdvim='cd ~/.vim'
alias cddot='cd ~/Dropbox/dotfiles'
alias cdmux='cd ~/.tmuxinator'
alias cddesktop='cd ~/Desktop'
alias cdtrash='cd ~/.Trash/'

# Directory listing aliases

alias lsa='ls -al'
alias lshidden='ls -ld .??*'
alias l='ls -lah'
alias ll='tree --dirsfirst -ChFupDaLg 1'
alias df='df -h'
alias disksize='df -h'
alias dirsize='du -sh * | sort -n'
alias dirsize2='du -bsh .'
alias topmem='top -o mem'

# Search aliases

alias g='GREP_COLOR="1;37;45" LANG=C grep --color=auto'
alias egrep='grep --color=always'
alias grep='grep --color=always'
alias a='ack -iR'
alias prettyxml='xmllint --format - | pygmentize -l xml | less -R'

# Sass aliases

alias watchcss='sass --watch css:css --style compressed'

# Vim aliases

alias vim='/usr/local/Cellar/vim/7.4.161/bin/./vim'
alias vp='vim -p'
alias vimaliases='vim ~/.aliases'
alias vimbashaliases='vim ~/.bash_aliases'
alias vimbashrc='vim ~/.bashrc'
alias vimvimrc='vim ~/.vimrc'
alias vimtmux='vim ~/.tmux.conf'
alias viminstall='vim +BundleInstall'
alias vimclean='vim +BundleClean'
alias vimupdate='vim +BundleUpdate'

# Tmux aliases

alias tmux='tmux -2' # force 256 color
alias muxkill='tmux kill-session -t'
alias tmuxkill='muxkill'
alias tmuxkillall="tx ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}"
alias muxkillall='tmuxkillall'
alias muxat='tmux attach -t'
alias tmuxat='muxat'
alias muxls='tmux list-sessions'
alias tmuxls='muxls'
alias rtmux='tmux source-file ~/.tmux.conf'

# Curl aliases

alias curlt='curl -o /dev/null -s -w %{time_total}\\n'
alias curljson=curlJsonPrettyPrint # Ex. curljson <url>

# Git aliases

alias g='git'
alias gita='git add .'
alias gitc='git commit -m'
alias gitp='git push'
alias pa='php artisan'
alias ga='git add .'
alias gm='git commit -m '
alias gam='git add . && git commit -m '
alias gamp=gitAddCommitPush # Ex. gmp "my commit"
alias gp='git push'
alias gch='git checkout '
alias gme='git merge '

# Network aliases

alias ip=ip
alias publicip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"

# Server aliases

alias server=server # Ex. server 3000
alias mysqlstart='mysql.server restart'
alias rsap='sudo apache2ctl restart'

# System aliases

alias lsp=listPortProcceses # Ex. lsp 3000
alias loadavg=loadAverage
alias fw='lsof -p 1 -r 10'
alias cputop='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -11'
alias unixmemtop='ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -10';
alias vmstat='vm_stat'

# Shortcut aliases

alias rsb='. ~/.bashrc'
alias rsz='. ~/.zshrc'
alias rm='rm -r'
alias c='clear'
alias h='history'
alias s3='s3cmd'
alias webstorm='open -b com.jetbrains.webstorm'
alias imgm='imagemin'
alias sprite='spritemapper'
alias jtest='jasmine-node'
alias phan='phantomjs'
alias nodeh='node --use_strict --harmony --harmony_proxies --harmony_generators'

# Misc aliases

alias shorten="PS1='\u:\W\$ '"
