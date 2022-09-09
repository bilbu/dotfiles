# If running interactively, then:
if [ "$PS1" ]; then

    # enable color support of ls and also add handy aliases
    eval `dircolors`
    alias l='ls --color=auto -lsaF'
    alias df='_pdf() { wpdf=$(which pydf 2>/dev/null) ; [ $? -eq 0 ] && c=${wpdf} || c=$(which df) ; $c ; unset -f _pdf ; }; _pdf'
    alias ll='ls -l'
    alias la='ls -A'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
    alias ms='echo Moule Shot !!!'
    alias list='screen -list'
    alias grep='grep --color=always'
    alias wget='wget -v -S -U "1337 h4x0r rul3z"'
    alias ipinfo='_ipi() { curl -s https://ipapi.co/${1:-""}/json; unset -f _ipi; }; _ipi'
    alias f='_fmd() { find . -maxdepth ${1:-"1"}; unset -f _fmd; }; _fmd'
    alias r='source ~/.bashrc'
    alias wifinfo='nmcli d w show-password'
    alias cat='_cbat() { wb=$(which bat 2>/dev/null) ; [ $? -eq 0 ] && c=${wb} || c=$(which cat) ; $c $1 ; unset -f _cbat ; }; _cbat'
    alias weatherinfo='_wi() { curl -s v2.wttr.in/${1:-""}; unset -f _wi; }; _wi'

    # set a fancy prompt
    export PS1="\[\033[0;37m\]\t \[\033[1;30m\][\[\033[1;34m\]\u\[\033[0;36m\]@\[\033[1;34m\]\h\[\033[1;30m\]] \[\033[0;36m\]\w\[\033[1;30m\] \$\[\033[0m\] "
fi

# append to the .bash_history everytime session closes
shopt -s histappend
HISTSIZE=9999999
HISTFILESIZE=9999999
# ignore commands starting with space and duplicates
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
# join multiline commands on one line
shopt -s cmdhist
# store history immediately
PROMPT_COMMAND='history -a'
