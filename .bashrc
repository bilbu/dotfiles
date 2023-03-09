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
    # alias l='ls --color=auto -lsaF'
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
    alias weatherinfo='_wi() { curl -s https://v2.wttr.in/${1:-""}; unset -f _wi; }; _wi'

    # "failsafely" shadow some commands with more modern versions of them
    function _shadow_cmd {
        # $1: modern command
        # $2: failsafe command
        # $3: args
        which_cmd=$(which "$1" 2>/dev/null)
        [ $? -eq 0 ] && cmd=${which_cmd} || cmd=$(which $2)

        [ $# -eq 2 ] && $cmd || $cmd $3
    }

    alias l='_shadow_cmd exa ls "-lFahuUmg --icons --octal-permissions --git" $1' # see https://the.exa.website/
    alias df='_shadow_cmd pydf df'                                                # see https://pypi.org/project/pydf/
    alias cat='_shadow_cmd bat cat $1'                                            # see https://github.com/sharkdp/bat
    alias top='_shadow_cmd btop top'                                              # see https://github.com/aristocratos/btop
    alias vi='_shadow_cmd nvim vi $1'                                             # see https://neovim.io/

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
