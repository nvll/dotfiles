export EDITOR='vim'

# huge history!
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
export TERM=xterm-color
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
shopt -s globstar

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# Local binaries built will be in ~/usr
if [[ -d ~/usr/bin ]]; then
    export PATH=~/usr/bin:$PATH
fi

if [[ -d ~/usr/local/bin ]]; then
    export PATH=~/usr/local/bin:$PATH
fi

if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin/:$PATH"
fi

# Source a platform specific bashrc
if [[ -f .bashrc.$(uname) ]]; then
    source .bashrc.$(uname)
fi

# IF the local system has bashrc changes include them
if [[ -f .bashrc.local ]]; then
    source .bashrc.local
fi

# Convenient way to view $PATH
function path () {
    echo $PATH | tr : '\n'
}

# For __git_ps1
if [[ -f ~/.git-prompt.sh ]]; then
    source ~/.git-prompt.sh
fi

## Color defines to use elsewhere
#Reset='\e[0m\]'            # Text Reset
## High Intensty
#Bold='\e[1m'
#Black='\e[0;30m'       # Black
#Red='\e[0;31m'         # Red
#Green='\e[0;32m'       # Green
#Yellow='\e[0;33m'      # Yellow
#Blue='\e[0;34m'        # Blue
#Purple='\e[0;35m'      # Purple
#Cyan='\e[0;36m'        # Cyan
#White='\e[0;37m'       # White

export PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[1;33m\]\$(__git_ps1)\[\e[0;37m\] $ "

