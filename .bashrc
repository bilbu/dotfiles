###############################################################################
#                                                                             #
# A hacky .bashrc with some bells and whistles.                               #
#                                                                             #
# /!\ Not shellcheck friendly.                                                #
#                                                                             #
# Does not come with batteries but is meant to be as forgivable as possible.  #
#                                                                             #
###############################################################################

# If running interactively, then:
if [ "$PS1" ]; then

    # enable color support of ls and also add handy aliases
    eval $(dircolors)
    alias l='ls --color=auto -lsaF'
    alias ll='ls -l'
    alias la='ls -A'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
    alias ms='echo "Moule Shot !!!"'
    alias list='screen -list'
    alias grep='grep --color=always'
    alias wget='wget -v -S -U "1337 h4x0r rul3z"'
    alias ipinfo='_ipi() { curl -s https://ipapi.co/${1:-""}/json; unset -f _ipi; }; _ipi'
    alias f='_fmd() { find . -maxdepth ${1:-"1"}; unset -f _fmd; }; _fmd'
    alias r='source ~/.bashrc' # remember this one
    alias wifinfo='nmcli d w show-password'
    alias weatherinfo='_wi() { curl -s v2.wttr.in/${1:-""}; unset -f _wi; }; _wi' # TODO add https:// when they fix their certificate

    # set a fancy prompt
    export PS1="\[\033[0;37m\]\t \[\033[1;30m\][\[\033[1;34m\]\u\[\033[0;36m\]@\[\033[1;34m\]\h\[\033[1;30m\]] \[\033[0;36m\]\w\[\033[1;30m\] \$\[\033[0m\] "

    # failsafe shadow some commands with more modern versions
    function _shadow_cmd {
        # $1: intended command
        # $2: failsafe
        # $3: args
        which_cmd=$(which "$1" 2>/dev/null)
        [ $? -eq 0 ] && cmd=${which_cmd} || cmd=$(which $2)

        [ $# -eq 2 ] && $cmd || $cmd $3
    }

    alias df='_shadow_cmd pydf df'
    alias cat='_shadow_cmd bat cat $1'
    alias top='_shadow_cmd btop top'

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
