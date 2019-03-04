#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#########################

#EDITOR
export EDITOR=/usr/bin/nvim

#cheat
ccht (){
	lang=$1
	shift
	str=$*
	searchStr="${str// /+}"
	curl cht.sh/$lang/$searchStr
}
cchtl (){
	ccht $* | less -R
}

#aliases
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias dir="dir --color=auto --group-directories-first"
alias vdir="vdir --color=auto --group-directories-first"
alias ls='ls --color=auto --group-directories-first'

alias ll='ls -alF'
alias l='ls -CF'
alias la='ls -A'

alias vim="nvim"
alias pacremove="sudo pacman -Rs"
alias pacremoveconfig="sudo pacman -Rsn"
alias rh="ranger --cmd=\"set show_hidden=true\""

alias ...='cd ../..'
alias ..='cd ..'
alias mkdir="mkdir -pv"


#system stuff
alias df="pydf" #must be installed
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" #excludes grep and includes header
alias tree="tree -C"


#functions

cless (){
	pygmentize -f terminal $1 | less -R
}

c() {
	builtin cd "$@" && ls -A #maybe do -lA?
}

mcd(){
	mkdir $1
	cd $1
}

#package manager
pacman() {
    case $1 in
        -S | -D | -S[^sih]* | -R* | -U*)
            /usr/bin/sudo /usr/bin/pacman "$@" ;;
    *)      /usr/bin/pacman "$@" ;;
    esac
}

#clipboard
clipf (){
	cat $* | copyq copy -
}
alias clip="copyq copy -" #pipe to clipboard
alias clipp="copyq clipboard"
