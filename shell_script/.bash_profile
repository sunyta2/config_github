

# export Variables
## $PATH configuration
export PATH="$HOME/anaconda/bin:$PATH:/opt/local/bin"
export CDPATH=$HOME:$HOME/Music


## Design Prompt in Bash _ olo∮√I
export PS1='[\t]\W by \u            @\h\n $ '
#export PS1='\h: %K{green}%F{black} \W%k%f        \u\$ [\t] \n$ '
# export PS1='%K{green}%F{black} %n@%M %k%f%F{green}%K{blue}▶︎%k%f%F{white}%K{blue} %d%F{blue} %F{blue}%K{white}▶︎%F{white}%F{black}%K{white}$(git_prompt_info)$(git_prompt_status)%F{white} %k▶︎%f '
# export PS1='%K{green}%F{black} %n@%M %k%f%F{green}%K{blue}▶︎%k%f%F{white}%K{blue} %d%F{blue} ▶︎%F{white} %k▶︎%f '
export PS1="[\t=\u@\h] \W/\n $ "
export PS1="                   [\[\e[32m\]\t            \u\[\e[m\]@\[\e[36m\]\H\[\e[m\]]\n\[\e[32m\]../\W/ !     \[\e[m\]\\$ "
export PS1="          \[\e[m\][\[\e[32m\]\u\[\e[m\]@\[\e[36m\]\H \[\e[m\]\[\e[31m\]√\t∮\[\e[m\]]\[\e[33m\]!\!\n\[\e[32m\]../\W/\[\e[33m\] \\$ \[\e[m\]"
export PS1="\n\#.     \[\e[33m\]!\!\[\e[32m\]\s \[\e[m\][\[\e[32m\]\u\[\e[m\]@\[\e[36m\]\H \[\e[m\]\[\e[31m\]√\t∮\[\e[m\]]\[\e[33m\]\n\[\e[32m\]../\W/\[\e[33m\] \\$ \[\e[m\]\a"


## $EDITOR configuration
export EDITOR="emacsclient -a '' -c "
export EDITOR='emacsclient -nw -t -a "" ' 
export EDITOR="/usr/local/bin/emacsclient -nw -t -a=\"\""
export EDITOR='emacsclient' 


# files to source
source ~/.alias_bash 를 실행할 것.  # alias를 모아 분류해 둔 곳.
source ~/.bash_profile_iruby # jupyter에서 ruby엔진을 사용할 수 있도록 되어있음

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

source $HOME/.sh_profile
