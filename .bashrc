# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




#------------------------------------------------------------------------------------
#Bash Colors

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White


















#-----------------------------------------------------------------------------------



#Custom Aliases:
alias sshcaen="/mnt/c/A_scripts/SSH_caen_script.sh"
#alias comhis="git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s""
alias comhist="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias lastdir='cd $(ls -dtr */ | tail -1)'
alias gac="git add . && git commit -a -m "
alias hs='history | grep'
#alias reloadterminal="source ~/.bashrc && echo "${White}Bash config reloaded${Color_Offi}""
#read disk but in human readable form
alias readdisk="du -sh"
#displays drives and drives space
alias drives='df -h'
# Clear the screen of your clutter
alias c="clear"
alias cl="clear;ls;pwd"
#makes sure all other aliases defined work when using SUDO. 
alias sudo='sudo '
#new colored LS
########alias lss='ls -AlhF --color=auto'
#colorized grep
alias grep='grep --color=auto -n'


#print commands when terminal starts


function helpterminal()
{
	#print commands when terminal starts
	echo -e "${White} ${On_IPurple}custom command list${Color_Off}: " && echo  ""

	echo -e "${Red}sshcaen${Color_Off}: auto ssh caen, still need to DUO"

	echo -e "${Cyan}comhist${Color_Off}: displays commit history for git in custom format & color"

	echo -e "${Cyan}lastdir${Color_Off}: last visited directory"

	echo -e "${Cyan}readdisk${Color_Off}: read disk but in human readable form(du -sh)"

	echo -e "${Cyan}drives${Color_Off}: displays drives and drives space"

	echo -e "${Cyan}hs${Color_Off}: [search criteria], required argument history of commands."

	echo -e "${Cyan}reloadterminal${Color_Off}: reloads terminal without closing window"

	echo -e "${Cyan}editterminal${Color_Off}: edit .bashrc for this computers terminal"

	echo -e "${Cyan}c${Color_Off}: clear screen"

	echo -e "${Cyan}cl${Color_Off}: clear + ls + pwd"

	echo -e "${Cyan}comhist${Color_Off}: custom commit history"

	echo -e "${Cyan}desktop${Color_Off}: auto path to desktop folder"
	echo -e "${Cyan}gpush${Color_Off}: gs, gac date, git f, git rebase, git push"
	echo "---------------------------------------------------------------"
	
	echo -e "${Cyan}eecs201${Color_Off}: eecs 201 folder"

	echo -e "${Cyan}eecs280${Color_Off}: eecs 280 folder"

	echo -e "${Cyan}eecs281${Color_Off}: eecs 281 folder"

	echo -e "${Cyan}eecs370${Color_Off}: eecs 370 folder"

	echo -e "${Cyan}eecs484${Color_Off}: eecs 484 folder"

	echo -e "${Cyan}eecs598${Color_Off}: eecs 598 folder"

	echo -e "${Cyan}p1${Color_Off}: eecs 484 project 1 folder"
	echo -e "${Cyan}p2a${Color_Off}: OFFLINE: p2a folder"
	echo -e "${Cyan}p2b${Color_Off}: OFFLINE: p2b folder"
	echo -e "${Cyan}p3${Color_Off}: OFFLINE: p3"
	echo -e "${Cyan}p4${Color_Off}: OFFLINE: p4"

	#echo -e "${Cyan}old281${Color_Off}: old 281 folder"

	#echo -e "${Cyan}old281labs${Color_Off}: old 281 labs folder"


	echo -e "${Cyan}gac${Color_Off}: combined git add & git commit"

	echo -e "${Cyan}gpush${Color_Off}: combined git add, commit, fetch, rebase"

	echo -e "${Purple}helpterminal${Color_Off}: shows this command list again" && echo ""
}
helpterminal

function reloadterminal ()
{
	cl
	source ~/.bashrc
	echo -e "${IRed}---------------------------------------------------------------${Color_Off}"
	echo -e "${IRed}Bash config reloaded${Color_Off}"
}

function eecs201 ()
{
	cd /mnt/c/EECS/EECS_201
}

function eecs280 ()
{
	cd /mnt/c/EECS/reecs280
}

function eecs281 () 
{
	cd /mnt/c/EECS/eecs281 
}
function eecs370 ()
{
	cd /mnt/c/EECS/eecs370
}

function eecs484 ()
{
	cd /mnt/c/EECS/eecs484
}

function p1 ()
{
	cd /mnt/c/EECS/eecs484/p1
}

function p2 ()
{
	cd /mnt/c/EECS/eecs484/p2
}

function p3 ()
{
	cd /mnt/c/EECS/eecs484/p3
}

function p4 ()
{
	cd /mnt/c/EECS/eecs484/p4
}

function hw2 ()
{
	cd /mnt/c/EECS/eecs484/hw2/EECS484_HW2
}


function editterminal ()
{
	cd ~
	vim .bashrc
}

function lss ()
{
	ls -al | awk '
        BEGIN {
            FPAT = "([[:space:]]*[^[:space:]]+)";
            OFS = "";
        }
        {
            $2 = "\033[31m" $2 "\033[0m";
            $3 = "\033[36m" $3 "\033[0m";
	    $4 = "\033[36m" $4 "\033[0m";
            $5 = "\033[31m" $5 "\033[0m";
            $6 = "\033[36m" $6 "\033[0m";
            $7 = "\033[36m" $7 "\033[0m";
            $8 = "\033[31m" $8 "\033[0m";
            print
        }
    '
}
function desktop ()
{
	cd '/mnt/c/Users/Cosmic Asparagus/Desktop'
}

function class ()
{
	cd '/mnt/c/Users/Cosmic Asparagus/Documents/1. Classes'
}

function eecs598 ()
{
	cd '/mnt/c/Users/Cosmic Asparagus/Documents/1. Classes/EECS 598'
}

function gpush ()
{
	timestamp=$(date +" %D %r")
	echo -e "${Cyan}comhis-------------------------------------------------------------------${Color_Off}"
	comhist
	#echo -e "${Green}makcln-------------------------------------------------------------------${Color_Off}"
	#make clean
	echo -e "${Cyan}gitsts-------------------------------------------------------------------${Color_Off}"
	git status
	echo -e "${Blue}gaccom-------------------------------------------------------------------${Color_Off}"
	git add -A
	git commit -m "$timestamp: GPUSH Auto Commit:ZJYIN local -> server only"
	echo -e "${Cyan}gfetch-------------------------------------------------------------------${Color_Off}"
	git fetch
	echo -e "${Green}grbase-------------------------------------------------------------------${Color_Off}"
	git rebase 
	echo -e "${Blue}gitsts-------------------------------------------------------------------${Color_Off}"
	git status
	echo -e "${Cyan}gtpush-------------------------------------------------------------------${Color_Off}"
	git push
	echo -e "${Green}comhis-------------------------------------------------------------------${Color_Off}"
	comhist
}

function gppush ()
{
	timestamp=$(date +" %D %r")
	echo -e "${Cyan}comhis-------------------------------------------------------------------${Color_Off}"
	comhist
	echo -e "${Cyan}gitsts-------------------------------------------------------------------${Color_Off}"
	git status
}












