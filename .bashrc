#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#EDITOR
export EDITOR=/usr/bin/nvim

export CHEATCOLORS=true

#mycustom aliases
alias grep="grep --color"
alias vim="nvim"
alias pacremove="sudo pacman -Rs"
alias pacremoveconfig="sudo pacman -Rsn"
alias rangerh="ranger --cmd=\"set show_hidden=true\""


#mycustom functions
cdl()
{
	cd $1
	ls .
}
mkdirc(){
	mkdir $1
	cd $1
}

pacman() 
{
    case $1 in
        -S | -D | -S[^sih]* | -R* | -U*)
            /usr/bin/sudo /usr/bin/pacman "$@" ;;
    *)      /usr/bin/pacman "$@" ;;
    esac
}

