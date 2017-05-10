# Color defines to use elsewhere
# Reset
Color_Off='\e[0m'       # Text Reset

# High Intensty
Black='\e[0;90m\]'       # Black
Red='\e[0;91m\]'         # Red
Green='\e[0;92m\]'       # Green
Yellow='\e[0;93m\]'      # Yellow
Blue='\e[0;94m\]'        # Blue
Purple='\e[0;95m\]'      # Purple
Cyan='\e[0;96m\]'        # Cyan
White='\e[0;97m\]'       # White

export EDITOR='vim'

# huge history!
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
export TERM=xterm-color
shopt -s cmdhist
shopt -s histappend

if [[ ~/.git-prompt.sh ]]; then
    source ~/.git-prompt.sh
fi

if [ -d ~/usr/ ]; then
    export PATH=$HOME/usr/bin:$HOME/usr/local/bin:$PATH
fi

if [[ $(uname) == 'Darwin' ]]; then
    export PATH=$HOME/usr/local/homebrew/bin:$PATH
fi

# lazy way to ensure it always exists
alias vims="vim --servername VIM"
alias vir="vim --servername VIM --remote"

# Darwin assumes homebrew is installed, Linux is just the git ubuntu/debian package
if [ `uname` == 'Darwin' ]; then
    alias ls='ls -G'
elif [ `uname` == 'Linux' ]; then
    alias ls='ls --color=auto'
fi

export PS1="$Green\u@\h $Blue\w$Purple$(__git_ps1)$White \$$Color_off "

# Keep PATH when using sudo
alias sudo="sudo env PATH=$PATH"
function path () {
    echo $PATH | tr : '\n'
}
