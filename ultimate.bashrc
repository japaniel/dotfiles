######################################################################################################################################################
################################### MY BASHRC FILE ################################### MY BASHRC FILE ################################### MY BASHRC FILE
######################################################################################################################################################








# .bashrc
# Creator:	inameiname
# Version:	3.41
# Last modified: 30 May 2011
# Found through various sources (including several things by me)
# Commented out stuff is what I personally don't need,
# so use at your own risk
# Feel free to copy, share, tweak, eat, or whatever








######################################################################################################################################################
#----- ORIGINAL CONTENT ------ ORIGINAL CONTENT ------ ORIGINAL CONTENT ------ ORIGINAL CONTENT ------ ORIGINAL CONTENT ------ ORIGINAL CONTENT ------
######################################################################################################################################################








# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi








######################################################################################################################################################
#----- CUSTOM STARTS HERE ------ CUSTOM STARTS HERE ------ CUSTOM STARTS HERE ------ CUSTOM STARTS HERE ------ CUSTOM STARTS HERE ------ CUSTOM STARTS HERE
######################################################################################################################################################








######################################################################################################################################################
###### MISCELLANEOUS ###### MISCELLANEOUS ###### MISCELLANEOUS ###### MISCELLANEOUS ###### MISCELLANEOUS ###### MISCELLANEOUS ###### MISCELLANEOUS ######
######################################################################################################################################################








if [ "$PS1" ]; then	# if running interactively, then run till 'fi' at EOF:

# source ~/.bashlocalrc	# settings that vary per workstation
OS=$(uname)		# for resolving pesky os differing switches








######################################################################################################################################################
###### COMMAND PROMPT & CLI ###### COMMAND PROMPT & CLI ###### COMMAND PROMPT & CLI ###### COMMAND PROMPT & CLI ###### COMMAND PROMPT & CLI ######
######################################################################################################################################################








##################################################
# Prompt escapes				 #
##################################################

# Bash allows these prompt strings to be customized by inserting a
# number of backslash-escaped special characters that are
# decoded as follows:

#  \a         an ASCII bell character (07)
#  \d         the date in "Weekday Month Date" format (e.g., "Tue May 26")
#  \D{format} the format is passed to strftime(3) and the result
#             is inserted into the prompt string an empty format
#             results in a locale-specific time representation.
#             The braces are required
#  \e         an ASCII escape character (033)
#  \h         the hostname up to the first `.'
#  \H         the hostname
#  \j         the number of jobs currently managed by the shell
#  \l         the basename of the shell's terminal device name
#  \n         newline
#  \r         carriage return
#  \s         the name of the shell, the basename of $0 (the portion following
#             the final slash)
#  \t         the current time in 24-hour HH:MM:SS format
#  \T         the current time in 12-hour HH:MM:SS format
#  \@         the current time in 12-hour am/pm format
#  \A         the current time in 24-hour HH:MM format
#  \u         the username of the current user
#  \v         the version of bash (e.g., 2.00)
#  \V         the release of bash, version + patch level (e.g., 2.00.0)
#  \w         the current working directory, with $HOME abbreviated with a tilde
#  \W         the basename of the current working directory, with $HOME
#             abbreviated with a tilde
#  \!         the history number of this command
#  \#         the command number of this command
#  \$         if the effective UID is 0, a #, otherwise a $
#  \nnn       the character corresponding to the octal number nnn
#  \\         a backslash
#  \[         begin a sequence of non-printing characters, which could be used
#             to embed a terminal control sequence into the prompt
#  \]         end a sequence of non-printing characters
#
#  The command number and the history number are usually different:
#  the history number of a command is its position in the history
#  list, which may include commands restored from the history file
#  (see HISTORY below), while the command number is the position in
#  the sequence of commands executed during the current shell session.
#  After the string is decoded, it is expanded via parameter
#  expansion, command substitution, arithmetic expansion, and quote
#  removal, subject to the value of the promptvars shell option (see
#  the description of the shopt command under SHELL BUILTIN COMMANDS
#  below).



##################################################
# Color chart					 #
##################################################

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset



##################################################
# This bashrc's current prompt		 	 #
##################################################

PS1='\[\033]0;\w\007\]\[\e[35;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[34m\]\w \[\e[33m\]\$ \[\e[0m\]'	# purple, green, blue prompt w/default black & dir title



##################################################
# More command prompt choices (CHOOSE ONE, either#
# one of single lines below, or one of the	 #
# fancier ones farther below - just uncomment	 #
# one want and comment mine above)		 #
##################################################

# PS1='\[\033[01;31m\]\u\[\033[01;36m\]@\[\033[01;32m\]\h\[\033[01;33m\]:\[\033[01;33m\]\w\n\[\033[01;31m\]\$ \[\033[00;32m\]'	# red, cyan, green, yellow with green output
# PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "					# green and blue prompt with pc name & default black output
# PS1="\[\033[0;31m\][\u] [ \w ] \[\033[0m\] \n # "						# red with default black output (2-tier)
# PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"	# yellow and green with default black output
# PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"	# yellow, green, w/black output w/color change upon bad command
# PS1="\[\033[0;34m\][\u] \[\033[0;0m\]\w \[\033[0m\]$ "					# blue username and default black output
# PS1="\[\033[0;34m\][\u] \[\033[0;31m\][ \w ] \[\033[0m\] \n >> "				# blue and red with default black output (2-tier)
# PS1="\[\033[0;34m\][\u] \[\033[0;33m\][ \t ] \[\033[0;31m\][ \w ] \[\033[0m\] \n >> "		# blue, yellow, red with default black output (2-tier)
# PS1='\[\033[1;30m\][\[\033[0;37m\]${PIPESTATUS}\[\033[1;30m\]:\[\033[0;37m\]${SHLVL}\[\033[1;30m\]:\[\033[0;37m\]\j\[\033[1;30m\]][\[\033[1;34m\]\u\[\033[0;34m\]@\[\033[1;34m\]\h\[\033[1;30m\]:\[\033[0;37m\]`tty | sed s/\\\\\/dev\\\\\/\//g`\[\033[1;30m\]]\[\033[0;37m\][\[\033[1;37m\]\W\[\033[0;37m\]]\[\033[1;30m\] \$\[\033[00m\] '									# grey and blue with default black output
# PS1="[\[\033[1;34m\]\u\[\033[0m\]@\h \W]\\$ "							# blue username with default colors (black)
# PS1="[\!] \033[1;36m[ \u@\h ]\033[1;32m\] [ \t ] [ \d ]\n\033[1;33m\[[ \w ] \033[00m\\n\[\e[30;1m\](\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\]) \[\e[0m\] $: "	# black, cyan, green, yellow, default black output (2-tier)
# PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"		# black, green, cyan, yellow, w/black output w/full path (2-tier)
# PS1="\[\033[34m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[35m\]\w/ \n\[\033[34m\] $\[\033[0m\] "	# cyan with green output
# PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "	# purple, cyan, black, green, yellow, default black
# PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "	# purple, cyan, black, green, yellow, w/black output
# PS1="\[\033[36m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[32m\]\w/ \n\[\033[36m\] $\[\033[0m\] "	# blue with purple output
# PS1=">\[\033[s\]\[\033[1;\$((COLUMNS-4))f\]\$(date +%H:%M)\[\033[u\]"				# trimmed up prompt with clock using default colors (black)
# PS1='C:${PWD//\//\\\}>'									# change prompt to MS-DOS one (joke)
# PS1='${debian_chroot:+($debian_chroot)}\[[ \033[01;31m\]\w\[\033[00m\]] '			# basic red with default black output
# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'	# red and blue prompt with green output
# PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'	# green and blue prompt with light grey output
# PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\]'			# green and blue prompt with default black output
# PS1='\e[1;31;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;31m[dir.= \w] \# > \e[0;0m'	# red, green, purple, red with default black output
# PS1='\[\e[1;31m\][\[\e[0;37m\]\u\[\e[1;31m\]@\[\e[0;37m\]\h \W\[\e[1;31m\]]\$\[\e[0m\] '	# red and grey with default black output
# PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '							# red color with default black output
# PS1='\[\e[1;32m\]\u@\H:\[\e[m\] \[\e[1;37m\]\w\[\e[m\]\n\[\e[1;33m\]hist:\! \[\e[0;33m\] \[\e[1;31m\]jobs:\j \$\[\e[m\] '	# green, yellow, red, grey and default black output (2-tier)
# PS1='\[\e[1;32m\]\u@\H:\[\e[m\] \[\e[1;37m\]\w\[\e[m\]\n\[\e[1;33m\]hist:\! \[\e[0;33m\] \[\e[1;31m\]jobs:\j \$\[\e[m\] '	# green, yellow, red, w/black output (2-tier) w/background job count
# PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '							# green color with default black output
# PS1='\e[1;33;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;34m[dir.= \w] \# > \e[0;0m'	# yellow, green, purple, cyan with default black output
# PS1="\[\e[1;33m\] > \[\033[0m\]"								# basic yellow with default black output & nothing else
# PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '								# black-bold with default colors (black)
# PS1="\[\e]2;\u@\H \w\a\e[30;1m\]>\[\e[0m\] "							# trimmed up prompt w/black arrow & title is current dir.
# PS1="\[\e[30;1m\]\w> \[\e[0m\]"								# trimmed up prompt with just black arrow and default colors
# PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H> \[\e[0m\]"						# cyan and green prompt with default black output
# PS1="\[\e[37;1m\]-{\[\e[34;1m\]\u@\h\[\e[37;1m\]}-\n\[\e[37;1m\](\[\e[34;1m\]\w: \$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[37;1m\])\n--> \[\e[0m\]"		# grey and cyan w/black output (2-tier) w/dir size
# PS1='\[\e[41m\]\[\e[1;37m\] \u \[\e[47m\]\[\e[1;30m\] \W \[\e[0m\]\[\e[1;37m\]\[\e[42m\] # \[\033[0m\] '	# red, grey, green boxed with default black
# PS1='\[\e[45m\]\[\e[1;37m\] \u@\h \[\e[47m\]\[\e[1;30m\] \W \[\e[0m\]\[\e[1;37m\]\[\e[42m\] > \[\033[0m\] '	# purple, grey, green boxed with default black
# PS1='\[\e[m\n\e[0;33m\][$$:$PPID \j:\!\[\e[0;33m\]]\[\e[0;36m\] \T \d \[\e[1;34m\][\[\e[1;34m\]\u@\H\[\e[1;31m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;31m\]\w\[\e[0;30m\] \n($SHLVL:\!)\$ '				# yellow, cyan, red, blue, white, green, black, red w/ default black output
# PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "	# all black with happy face (yellow/red) upon successful completion
# PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "	# basic prompt but with yellow smiley
# PS1="\n\[\033[32;1m\]It's \t\[\033[33;1m\] Currently browsing \[\033[1;36m\]\w \[\033[33;1m\]directory\n\[\033[34;1m\]\`if [ \$? = 0 ]; then echo \[\e[37m\]Last Command Was Successfully Executed \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[37m\]Smeggin Hell !!! Last Command Was Unknown \[\e[32m\]O_O\[\e[0m\]; fi\` \n\[\033[31m\]What is thy bidding, my master? \n\n\[\033[34;1m\]"				# green, yellow, grey, green, red, w/cyan output (3-tier) Star Wars version
# PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"	- purple, green, blue, cyan, yellow, with default black output (3-tier)
# PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"												# purple, red, blue, cyan, yellow, w/white output (3-tier)
# PS1="\n\[$bldgrn\][\[$txtrst\]\w\[$bldgrn\]]\[$bldwht\]\n\[$bldwht\][\[$txtrst\]\t\[$bldwht\]]\[$bldylw\]$ \[$txtrst\]"	# green, black, grey, yellow with default black output (3-tier)
# PS1="\n#--[\[\e[1;36m\]\u@\h\[\e[m\]]-[\[\e[1;34m\]\w\[\e[m\]]-[\$(date +%k:%M)]-->\n"	# black, cyan, blue, black, w/black output (2-tier)
# PS1="\n\[\e[30;1m\]\[\016\]l\[\017\](\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\j\[\e[30;1m\])-(\[\e[34;1m\]\@ \d\[\e[30;1m\])->\[\e[30;1m\]\n\[\016\]m\[\017\]-(\[\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\])--> \[\e[0m\]"				# grey, cyan, green, w/black output (2-tier) w/ dir. info
# PS1="\n\[\e[30;1m\]?(\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\j\[\e[30;1m\])-(\[\e[34;1m\]\@ \d\[\e[30;1m\])->\[\e[30;1m\]\n??(\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, $(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\])--> \[\e[0m\]"	# black, cyan, green w/black output (2-tier)
# PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"	# grey and green with default black output (3-tier)
# PS1="\n\[\e[m\][\[\033[01;32m\]\w\[\e[m\]] [\t] \n\[\033[01;33m\]$ \[\033[00m\]"		# green, black, yellow, with default black output (3-tier)
# PS1="\t \u@\h\$ "										# simple prompt with time (black)
# PS1="\t \u@\h `tty | sed 's/\/dev\///'` \w \$ "						# longer prompt with time (black)
# PS1="\u@\h\$ "										# simple default prompt (black)
# PS1="\u@\h `tty | sed 's/\/dev\///'` \w \$ "							# longer prompt with brief info (black)
# PS1='[\u@\h \W]\$ '										# default colors (black)
# PS1="\u@\h [\w] \$ "										# simple prompt with directory (black)
# PS1="\u `tty | sed 's/\/dev\///'` [\W] \$ "							# prompt with brief info (black)



##################################################
# Jsnx's prompt of power (disabled by a single 	 #
# "#")			 			 #
##################################################

## I used to have the prompt set up as a bunch of functions; but that
## didn't work very well with sh. Now, I have mastered the various
## levels of evaluation and quoting of the shell and can confidently
## write hideous macros!
# DARK="\[\e[01;34m\]"
# NORM="\[\e[01;32m\]"
# FADE="\[\e[01;30m\]"
# REST="\[\e[00;00m\]"
# HIGH="\[\e[01;33m\]"
# dir="pwd -P | awk '{ printf \"%-65.65s\", \$1 }'"
# sub="sed -r 's/^/$NORM/ ; s|/|$FADE&$NORM|g ; s/:/$DARK&$NORM/g'"
# t="date +%H:%M"
# hist="history 1 | xargs echo '' | awk '{ printf \"%03.3d\", \$1 + 1 }'"
# warn="[ $USER = root ] && echo -n '$HIGH' || echo -n '$FADE'"
# bang="echo -ne '\x21'"  ## this gives me a single '!' in bash and sh
# prompt=" $DARK: \`$dir | $sub\` \`$warn;$bang;\`$NORM\`$hist\` \`$t | $sub\`
# $DARK:\`$warn\`; $REST"
# prepend=''
# if [ "${TERM}" = "xterm" ]
# then
#  my_tty=`tty | awk -F/ '{ print $3 $4}'`
#  xterm_title="\[\e]0;${my_tty} \u@\H\007\]"
#  prepend="${xterm_title}"
# fi
## export  PROMPT_COMMAND="export PS1=\"${prepend}${prompt}\""
# export  PS1="${prepend}${prompt}"
# export  PS2='  '



##################################################
# Nate Mitchell's (Kasyx's) Bash Prompt (red with#
# green dashes and black output) (disabled by a	 #
# single "#")		 			 #
##################################################

# function prompt() {
# Black="\e[30m"
# Red="\e[31m"
# Green="\e[32m"
# LightGreen="\e[32;1m"
# Blue="\e[34m"
# LightBlue="\e[34;1m"
# NC="\e[0m" # No Color
# PS1="\[$LightGreen\033(0\154\033(B\][\[\033(0\161\161\033(B$Green\][\[$Red\]\u@\h\[$Green\]]\[\033(0\161\033(B\][\[$Red\]\w\[$Green\]]\[\033(0\161\033(B\][\[$Red\]\!\[$Green\]]\[\033(0\161\161\033(B\]]\n\[$LightGreen\033(0\155\161\033(B$Green\][\[$Red\]\#\[$Green\]]\[\033(0\161\033(B\][\[$Red\]\$\[$Green\]]\[\033(0\161\161\033(B\][\[$NC\]"
# PS2="> "
# }
# prompt



##################################################
# Wolfman's prompt (disabled by a single "#")	 #
##################################################

## Fancy PWD display function
## The home directory (HOME) is replaced with a ~
## The last pwdmaxlen characters of the PWD are displayed
## Leading partial directory names are striped off
## /home/me/stuff          -> ~/stuff               if USER=me
## /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
# function bash_prompt_command() {
#    # How many characters of the $PWD should be kept
#    local pwdmaxlen=25
#    # Indicate that there has been dir truncation
#    local trunc_symbol=".."
#    local dir=${PWD##*/}
#    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
#    NEW_PWD=${PWD/#$HOME/\~}
#    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
#    if [ ${pwdoffset} -gt "0" ]
#    then
#        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
#        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
#    fi
# }
# function bash_prompt() {
#    case $TERM in
#     xterm*|rxvt*)
#         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
#          ;;
#     *)
#         local TITLEBAR=""
#          ;;
#    esac
#    local NONE="\[\033[0m\]"    # unsets color to term's fg color
#    # regular colors
#    local K="\[\033[0;30m\]"    # black
#    local R="\[\033[0;31m\]"    # red
#    local G="\[\033[0;32m\]"    # green
#    local Y="\[\033[0;33m\]"    # yellow
#    local B="\[\033[0;34m\]"    # blue
#    local M="\[\033[0;35m\]"    # magenta
#    local C="\[\033[0;36m\]"    # cyan
#    local W="\[\033[0;37m\]"    # white
#    # emphasized (bolded) colors
#    local EMK="\[\033[1;30m\]"
#    local EMR="\[\033[1;31m\]"
#    local EMG="\[\033[1;32m\]"
#    local EMY="\[\033[1;33m\]"
#    local EMB="\[\033[1;34m\]"
#    local EMM="\[\033[1;35m\]"
#    local EMC="\[\033[1;36m\]"
#    local EMW="\[\033[1;37m\]"
#    # background colors
#    local BGK="\[\033[40m\]"
#    local BGR="\[\033[41m\]"
#    local BGG="\[\033[42m\]"
#    local BGY="\[\033[43m\]"
#    local BGB="\[\033[44m\]"
#    local BGM="\[\033[45m\]"
#    local BGC="\[\033[46m\]"
#    local BGW="\[\033[47m\]"
#    local UC=$W                 # user's color
#    [ $UID -eq "0" ] && UC=$R   # root's color
##    PS1="$TITLEBAR ${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
#    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
#    # extra backslash in front of \$ to make bash colorize the prompt
# }
# PROMPT_COMMAND=bash_prompt_command
# bash_prompt
# unset bash_prompt



##################################################
# Emmanuel Rouat's shell prompt (fancy all	 #
# black with info)				 #
##################################################

# if [[ "${DISPLAY%%:0*}" != "" ]]; then
#    HILIT=${red}   # remote machine: prompt will be partly red
# else
#    HILIT=${cyan}  # local machine: prompt will be partly cyan
# fi
##   --> Replace instances of \W with \w in prompt functions below
## + --> to get display of full path name.
# function fastprompt()
# {
#    unset PROMPT_COMMAND
#    case $TERM in
#        *term | rxvt )
#            PS1="${HILIT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
#        linux )
#            PS1="${HILIT}[\h]$NC \W > " ;;
#        *)
#            PS1="[\h] \W > " ;;
#    esac
# }
# function _powerprompt()
# {
#    LOAD=$(uptime|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
# }
#
# function powerprompt()
# {
#    PROMPT_COMMAND=_powerprompt
#    case $TERM in
#        *term | rxvt  )
#            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > \
#                 \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
#        linux )
#            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
#        * )
#            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
#    esac
# }
# powerprompt     # This is the default prompt -- might be slow.
#                # If too slow, use fastprompt instead. ...



##################################################
# Xterm windowdressing (cyan and black with	 #
# grey output info prompt( (disabled by a	 #
# single '#')					 #
##################################################

# function elite()
#  {
#  local GRAY="\[\033[1;30m\]"
#  local LIGHT_GRAY="\[\033[0;37m\]"
#  local CYAN="\[\033[0;36m\]"
#  local LIGHT_CYAN="\[\033[1;36m\]"
#  case $TERM in
#      xterm*)
#          local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
#          ;;
#      *)
#          local TITLEBAR=""
#          ;;
#  esac
#  local GRAD1=$(tty|cut -d/ -f3)
#  PS1="$TITLEBAR\
#  $GRAY-$CYAN-$LIGHT_CYAN(\
#  $CYAN\u$GRAY@$CYAN\h\
#  $LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
#  $CYAN\#$GRAY/$CYAN$GRAD1\
#  $LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
#  $CYAN\$(date +%H%M)$GRAY/$CYAN\$(date +%d-%b-%y)\
#  $LIGHT_CYAN)$CYAN-$GRAY-\
#  $LIGHT_GRAY\n\
#  $GRAY-$CYAN-$LIGHT_CYAN(\
#  $CYAN\$$GRAY:$CYAN\w\
#  $LIGHT_CYAN)$CYAN-$GRAY-$LIGHT_GRAY "
#  PS2="$LIGHT_CYAN-$CYAN-$GRAY-$LIGHT_GRAY "
#  }
# PROMPT_COMMAND=elite



##################################################
# Another prompt =				 #
# (PS1="\[\e]2;\u@\H \w\a\e[30;1m\]>\[\e[0m\]	 #
# " but fixed for various systems - simple	 #
# prompt that shows currently directory in	 #
# title)					 #
##################################################

# if [ "$TERM" = "linux" ]
# then
#	# we're on the system console or maybe telnetting in
#	export PS1="\[\e[32;1m\]\u@\H > \[\e[0m\]"
# else
#	# we're not on the console, assume an xterm
#	export PS1="\[\e]2;\u@\H \w\a\e[32;1m\]>\[\e[0m\] "
# fi



##################################################
# Yet another prompt (simple black prompt with	 #
# the word 'bash$' only)			 #
##################################################

## Check if running in an xterm and give a more suitable prompt
## (two alternative blocks given below)
## mesg y allows talk(1) requests, here only if not an xterm
## Gives informative prompt, puts user,host,path in xterm title
## Comment or uncomment all of the following lines ('case' to 'esac')
# case $TERM in
#     xterm*)
#        PS1="\[\033]0;\u@\h: \w\007\]bash\$ "
#       ;;
#  *)
#      PS1="\t \u@\h `tty | sed 's/\/dev\///'`\$ "
#       mesg y
#        ;;
# esac



##################################################
# Still another prompt (cyan and red with	 #
# green output info prompt) (disabled by a	 #
# single '#')					 #
##################################################

### Colourful prompts
### Comment or uncomment all of the following lines ('case' to 'esac')
## case $TERM in
##      xterm*)
##          TERM=xterm-color; export TERM
##          PS1="\[\033[36m\]   \u@my_computer `tty | sed 's/\/dev\///'` \t \d \[\033[35m\]\w/ \n\[\033[36m\] $\[\033[0m\] "
##          ;;
##      *)
#          PS1="`setterm -bold on` \[\033[36m\] \u@my_computer `tty | sed 's/\/dev\///'` \t \d \[\033[1;31m\]\w/ \n\[\033[36m\]! \[\033[1;32m\] `setterm -#bold off`"
#    # this adds a bg color; comment out the above
##      PS1="\[\033[35m\]   \u@my_computer `tty | sed 's/\/dev\///'` \t \d \[\033[32m\]\w/ \n\[\033[36m\] $\[\033[44;1;36m\] `setterm -bold on` "
##          mesg y
##          ;;
## esac



##################################################
# More PROMPT_COMMANDS				 #
##################################################

###### Annoying PROMPT_COMMAND animation
# PROMPT_COMMAND='seq $COLUMNS | xargs -IX printf "%Xs\r" @'



###### Share history between using multiple commands (press enter before get history from other bash shells)
# PROMPT_COMMAND='history -a && history -n'



###### Shows date
# PROMPT_COMMAND='date +%k:%m:%S'



###### Shows memory, load average, and history
# PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( `sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[38;5;22m/"$((`sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"'



###### Shows the return value of the last executed command (using smileys as to whether it was successful or not)
# PROMPT_COMMAND='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'



##################################################
##################################################
##################################################








######################################################################################################################################################
###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ######
######################################################################################################################################################








# autoload -U compinit
# compinit
export BLOCKSIZE=K
export BROWSER='chromium-browser'
# export BROWSER=$(find_alternatives chromium-browser google-chrome opera firefox firefox-bin iceweasel konqueror w3m lynx)	# uses function 'find_alternatives'
# export CDPATH=.:~:~/src:/etc
# export DISPLAY=:79
# export EDITOR="gedit -w --resume" Typing 'fc'	# open last command for editing in gedit, then execute on save
export EDITOR='vim'
# export ftp_proxy=${MY_PROXY}
# export GPG_TTY='tty'				# gpg-agent says it needs this
# export GREP_OPTIONS='-D skip --binary-files=without-match --ignore-case'		# most commonly used grep options
export HISTCONTROL=ignoreboth:erasedups		# for 'ignoreboth': ignore duplicates and /^\s/
# export HISTCONTROL=ignoreboth			# ignore spaced commands and prevents storing of duplicate commands (ie, ignoredups & ignorespace)
# export HISTCONTROL=ignoredups			# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignorespace		# will make sure that bash don’t store any command beginning with the space character
# export HISTFILE=/dev/null			# disable history for current shell session
# export HISTFILE='$HOME/.history'
# export HISTFILESIZE=10000			# increase or decrease the size of the history to '10,000'
# export HISTFILESIZE=${HISTSIZE}		# bash will remember 'N' commands
export HISTIGNORE='&:bg:fg:ll:h'
# export HISTIGNORE='${HISTIGNORE:+$HISTIGNORE:}la:ll:lah:lat:;a:-:fg:bg:j:sync:esu:rma:rmp:fol:pfol'
# export HISTIGNORE="&:ls:[bf]g:exit"		# duplicate entries in bash history, as well as ls, bg, fg & exit, making for cleaner bash history
# export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
# export HISTIGNORE='pwd:cd:ls:ls -l:'		# ignore commands given
export HISTSIZE=10000				# increase or decrease the size of the history to '10,000'
# export HISTTIMEFORMAT='| %d/%m/%y %T | '	# make 'History' Show The Date For Each Command
# export HISTTIMEFORMAT='%F %T '		# adds date and time to history
export HISTTIMEFORMAT='%H:%M > '
# export HISTTIMEFORMAT='%s' 			# the beloved Second of Our Linux
# export HISTTIMEFORMAT='%Y-%b-%d::%Hh:%Mm:%Ss '
export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a  '	# makes history display in YYYY-MM-DD_HH:MM:SS_3CharWeekdaySpaceSpace format
export HOSTFILE=$HOME/.hosts    		# put list of remote hosts in ~/.hosts ...
# export http_proxy=${MY_PROXY}
# export https_proxy=${MY_PROXY}
# export IGNOREEOF=1				# prevent CTRL-D from immediately logging out
# export INPUTRC=/etc/inputrc			# it's possible that this will make bash find my delete key (and everything else)((but i don't think it did))
# export INPUTRC=$HOME/.inputrc			# type in ‘whatever’ and press ‘Page Up’ key and bash automatically fetches last command that starts with whatever and completes the command for you (requires '$HOME/.inputrc' with these lines: #Page up/page down && "\e[5~": history-search-backward && "\e[6~": history-search-forward)
# export LC_COLLATE="en_CA.utf8"		# change sorting methods [a-Z] instead of [A-Z]
export LESSCHARSET='latin1'
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \'
# export LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'	# use this if lesspipe.sh exists
# export LESS="-QR"				# tell less not to beep and also display colours
# export LESS='-R'
# export LESS_TERMCAP_mb=$'\E[01;31m'      	# less colors for Man pages # begin blinking
# export LESS_TERMCAP_md=$'\E[01;38;5;74m'  	# less colors for Man pages # begin bold
# export LESS_TERMCAP_me=$'\E[0m'           	# less colors for Man pages # end mode
# export LESS_TERMCAP_se=$'\E[0m'           	# less colors for Man pages # end standout-mode
# export LESS_TERMCAP_so=$'\E[38;5;246m'    	# less colors for Man pages # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'           	# less colors for Man pages # end underline
# export LESS_TERMCAP_us=$'\E[04;38;5;146m' 	# less colors for Man pages # begin underline
# export MY_PROXY='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# export OOO_FORCE_DESKTOP=gnome   		# openoffice preferences
export PAGER='less -e'
# export PATH=$PATH:$HOME/scripts
# export PILOTRATE=57600			# make pilot-xfer go faster than 9600
export TERM='xterm'
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export TMOUT=86400				# auto logout after n seconds of inactivity
# export USER_CLIENT=deluge
# export USER_DPRT=22218
# export USER_OPRT=47426
# export USER_VPRT=79
# export USER_WPRT=30818
export VISUAL='vi'
# export wpsetters=feh
# ${file%\.[^.]*}				# to remove filename extensions in bash
# fortune -a					# fortunes at each new shell
# mesg n              				#
set -b						# causes output from background processes to be output right away, not on wait for next primary prompt
# set bell-style visible			# I hate noise
# set completion-ignore-case on 		# complete things that have been typed in the wrong case
# set -o ignoreeof				# can't c-d out of shell
# set -o noclobber				# disallow > to work on files that already exist (prevents catting over file)
set -o notify					# notify when jobs running in background terminate
# set -o nounset				# attempt to use undefined variable outputs error message and forces exit (messes up completion if enabled)
# set +o nounset          			# otherwise some completions will fail
# setopt autopushd pushdminus pushdsilent pushdtohome
# setopt correct
# setopt extendedglob
# setopt hist_ignore_space    			# prepend ' ' to not be saved
# setopt hist_verify          			# verify when using !
# setopt nocheckjobs          			# don't complain about background jobs on e
# setopt no_clobber           			# don't overwrite files when redirect
# setopt nohup               			# don't kill bg jobs when tty quits
# setopt printexitvalue       			# print exit value from jobs
# setopt share_history
# set -o xtrace					# useful for debuging
# setterm -blength 0				# set the bell duration in milliseconds (silence the beeps)
# set visible-stats on 				# when listing possible file completions, put / after directory names and * after programs
shopt -s cdable_vars				# set the bash option so that no '$' is required (disallow write access to terminal)
shopt -s cdspell				# this will correct minor spelling errors in a cd command
shopt -s checkhash
shopt -s checkwinsize				# update windows size on command
shopt -s cmdhist          			# save multi-line commands in history as single line
# shopt -s dotglob				# files beginning with . to be returned in the results of path-name expansion
# shopt -s expand aliases			# expand aliases
shopt -s extglob				# necessary for bash completion (programmable completion)
# shopt -s globstar				# enables the ** globbing operator
# shopt -s histappend				# bash history is only saved when close terminal, not after each command and this fixes it
shopt -s histappend histreedit histverify
# shopt -s histreedit
# shopt -s histverify
# shopt -s hostcomplete     			# attempt hostname expansion when @ is at the beginning of a word
# shopt -s huponexit
shopt -s mailwarn				# keep an eye on the mail file (access time)
# shopt -s nocaseglob cdspell histappend
shopt -s nocaseglob       			# pathname expansion will be treated as case-insensitive (auto-corrects the case)
shopt -s no_empty_cmd_completion		# no empty completion (bash>=2.04 only)
# shopt -s nullglob dotglob
shopt -s sourcepath
# shopt -u cmdhist				# do not treat multiple line commands as a single entry
# shopt -u force_fignore			# expand to complete an ignored word, if no other words match.
# shopt -u mailwarn
# shopt -u sourcepath
# stty -ixon					# disable XON/XOFF flow control (^s/^q)
stty start undef
stty stop undef
# stty stop ''					# use C-s to search forward through history (do not block output)
# ulimit -c unlimited				# let me have core dumps
ulimit -S -c 0          			# (core file size) don't want any coredumps
# ulimit -S -f 1024   				# open files
# ulimit -S -s 8192  				# stack size
# ulimit -S -u 256    				# max user processes
# umask 007    					# all files created 660, dirs 770
# umask 022					# makes new files have permissions: rwxr-xr-x
# umask 077           				# after everything is installed, uncomment this and the mkdir alias below ((base 8) 777 & ~077 = 700 = u=rwx,g=,o=)
# unset HISTFILESIZE				# infinite History
# unset HISTSIZE				# infinite History
unset MAILCHECK        				# don't want my shell to warn me of incoming mail
# unsetopt bgnice            			# don't nice bg command

if [ -d $HOME/Maildir/ ]; then
    export MAIL=$HOME/Maildir/
    export MAILPATH=$HOME/Maildir/
    export MAILDIR=$HOME/Maildir/
elif [ -f /var/mail/$USER ]; then
    export MAIL="/var/mail/$USER"
fi

if [ "$TERM" = "screen" ]; then
    export TERM=$TERMINAL
fi

# if [ "$OS" = "Linux" ]; then
#     source ~/.lscolorsrc
# elif [ "$OS" = "Darwin" ]; then
#     export LSCOLORS='gxfxcxdxbxegedabagacad'
# fi

function get_xserver()
{
    case $TERM in
       xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            # I_AM=$(who am i)
            # SERVER=${I_AM#*(}
            # SERVER=${SERVER%*)}
            XSERVER=${XSERVER%%:*}
            ;;
        aterm | rxvt)
        # Find some code that works here. ...
            ;;
    esac
}
if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || \
      ${XSERVER} == "unix" ]]; then
        DISPLAY=":0.0"          # Display on local host.
    else
        DISPLAY=${XSERVER}:0.0  # Display on remote host.
    fi
fi
export DISPLAY

# if [ -f ~/.bash_exports ]; then . ~/.bash_exports ; fi
# if [ -f ~/.bash_functions ]; then . ~/.bash_functions ; fi
# if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases ; fi
# if [ -f ~/.bash_completion ]; then . ~/.bash_completion ; fi
# if [ -f /etc/bash_completion ]; then . /etc/bash_completion ; complete -cf sudo; fi



##################################################
# Alternative To The "200 Lines Kernel Patch That#
# Does Wonders" - not needed if have Linux kernel#
# 2.6.37 and higher				 #
##################################################

###### FOR DISTROS THAT USE '/cgroup/cpu' & '/etc/init.d/rc.local' (REDHAT/CENTOS?)
# Run sudo gedit /etc/init.d/rc.local & add following lines above "exit 0":
# 	mkdir -p /cgroup/cpu
# 	mount -t cgroup cgroup /cgroup/cpu -o cpu
# 	mkdir -m 0777 /cgroup/cpu/user
# 	echo "/usr/local/sbin/cgroup_clean" > /cgroup/cpu/release_agent
# Now, make it executable:
# sudo chmod +x /etc/init.d/rc.local
# To make sure that cgroups are deleted whenever the last task
# leaves, run sudo gedit /usr/local/sbin/cgroup_clean and copy-paste this:
# 	#!/bin/sh
# 	if [ "$*" != "/user" ]; then
# 	rmdir /cgroup/cpu/$*
# 	fi
# Now, make it executable:
# sudo chmod +x /usr/local/sbin/cgroup_clean
# Ensure the below ~/.bashrc section is uncommented
# Restart your computer to apply the changes.
#
#
#
# BEFORE YOU UNCOMMENT THE BELOW, MAKE SURE YOU'VE DONE THE ABOVE
#   if [ "$PS1" ] ; then
# 	mkdir -p -m 0700 /cgroup/cpu/user/$$ > /dev/null 2>&1
#       echo $$ > /cgroup/cpu/user/$$/tasks
#	echo "1" > /cgroup/cpu/user/$$/notify_on_release
#   fi



###### FOR DISTROS THAT USE '/sys/fs/cgroup/cpu' & '/etc/init.d/rc.local'
# Run sudo gedit /etc/init.d/rc.local & add following lines above "exit 0":
# 	mkdir -p /sys/fs/cgroup/cpu
# 	mount -t cgroup cgroup /sys/fs/cgroup/cpu -o cpu
# 	mkdir -m 0777 /sys/fs/cgroup/cpu/user
# 	echo "/usr/local/sbin/cgroup_clean" > /sys/fs/cgroup/cpu/release_agent
# Now, make it executable:
# sudo chmod +x /etc/init.d/rc.local
# To make sure that cgroups are deleted whenever the last task
# leaves, run sudo gedit /usr/local/sbin/cgroup_clean and copy-paste this:
# 	#!/bin/sh
# 	if [ "$*" != "/user" ]; then
# 	rmdir /sys/fs/cgroup/cpu/$*
# 	fi
# Now, make it executable:
# sudo chmod +x /usr/local/sbin/cgroup_clean
# Ensure the below ~/.bashrc section is uncommented
# Restart your computer to apply the changes.
#
#
#
# BEFORE YOU UNCOMMENT THE BELOW, MAKE SURE YOU'VE DONE THE ABOVE
#   if [ "$PS1" ] ; then
# 	mkdir -p -m 0700 /sys/fs/cgroup/cpu/user/$$ > /dev/null 2>&1
#       echo $$ > /sys/fs/cgroup/cpu/user/$$/tasks
#	echo "1" > /sys/fs/cgroup/cpu/user/$$/notify_on_release
#   fi



###### FOR UBUNTU (AND OTHER DISTROS THAT USE '/dev/cgroup/cpu' & '/etc/rc.local')
# Run sudo gedit /etc/rc.local & add following lines above "exit 0":
# 	mkdir -p /dev/cgroup/cpu
# 	mount -t cgroup cgroup /dev/cgroup/cpu -o cpu
# 	mkdir -m 0777 /dev/cgroup/cpu/user
# 	echo "/usr/local/sbin/cgroup_clean" > /dev/cgroup/cpu/release_agent
# Now, make it executable:
# sudo chmod +x /etc/rc.local
# To make sure that cgroups are deleted whenever the last task
# leaves, run sudo gedit /usr/local/sbin/cgroup_clean and copy-paste this:
# 	#!/bin/sh
# 	if [ "$*" != "/user" ]; then
# 	rmdir /dev/cgroup/cpu/$*
# 	fi
# Now, make it executable:
# sudo chmod +x /usr/local/sbin/cgroup_clean
# Ensure the below ~/.bashrc section is uncommented
# Restart your computer to apply the changes.
#
#
#
# BEFORE YOU UNCOMMENT THE BELOW, MAKE SURE YOU'VE DONE THE ABOVE
#    if [ "$PS1" ] ; then
# 	mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#   	echo $$ > /dev/cgroup/cpu/user/$$/tasks
#   	echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#    fi



##################################################
# PATH						 #
##################################################

if [ "$UID" -eq 0 ]; then
    PATH=$PATH:/usr/local:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
fi

# remove duplicate path entries
export PATH=$(echo $PATH | awk -F: '
{ for (i = 1; i <= NF; i++) arr[$i]; }
END { for (i in arr) printf "%s:" , i; printf "\n"; } ')

# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh



##################################################
# Redirect bash built-in output to stdout	 #
##################################################

# TIME=$( { time YOUR_COMMAND_HERE; } 2>&1 ) ; echo $TIME



##################################################
# Startup programs				 #
##################################################

# if [ "$USE_SCREEN" = "Y" ]; then
#     if [ "$UID" -ne 0 ]; then
#         if [ "$SHLVL" -eq 1 ]; then
#             /usr/bin/screen -d -RR
#         fi
#     fi
# fi

# if [ -e "/usr/games/fortune" ]; then
#     echo "Fortune: "
#     /usr/games/fortune
#     echo
# fi

# if [ -e "/usr/bin/uptime" ]; then
#     echo "Uptime: ` /usr/bin/uptime`"
# fi
# echo
# ~/bin/rc_sync.sh
# $HOME/bin/motd.pl



##################################################
# Various options to make $HOME comfy		 #
##################################################

# if [ ! -d "${HOME}/bin" ]; then
#     mkdir ${HOME}/bin
#     chmod 700 ${HOME}/bin
#     echo "${HOME}/bin was missing.  I created it for you."
# fi

# if [ ! -d "${HOME}/Documents" ]; then
#     if ! [  -d "${HOME}/data" ]; then
#         mkdir ${HOME}/data
#         chmod 700 ${HOME}/data
#         echo "${HOME}/data was missing.  I created it for you."
#     fi
# fi

# if [ ! -d "${HOME}/tmp" ]; then
#     mkdir ${HOME}/tmp
#     chmod 700 ${HOME}/tmp
#     echo "${HOME}/tmp was missing.  I created it for you."
# fi



##################################################
##################################################
##################################################








######################################################################################################################################################
###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS
######################################################################################################################################################








##################################################
# Completion functions (only since Bash-2.04)	 #
##################################################

###### This is a 'universal' completion function - it works when commands have
# a so-called 'long options' mode , ie: 'ls --all' instead of 'ls -a'
# Needs the '-o' option of grep
# (try the commented-out version if not available).
# First, remove '=' from completion word separators
# (this will allow completions like 'ls --color=auto' to work correctly).



COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}



###### avoid tilde expansion from the bash_completion script
function _expand()
{
    [ "$cur" != "${cur%\\}" ] && cur="$cur\\";
    if [[ "$cur" == \~*/* ]]; then
        #eval cur=$cur;
		:;
    else
        if [[ "$cur" == \~* ]]; then
            cur=${cur#\~};
            COMPREPLY=($( compgen -P '~' -u $cur ));
            return ${#COMPREPLY[@]};
        fi;
    fi
}



function _get_longopts()
{
    # $1 --help | sed  -e '/--/!d' -e 's/.*--\([^[:space:].,]*\).*/--\1/'| \
# grep ^"$2" |sort -u ;
    $1 --help | grep -o -e "--[^[:space:].,]*" | grep -e "$2" |sort -u
}



function _killall()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    # get a list of processes (the first sed evaluation
    # takes care of swapped out processes, the second
    # takes care of getting the basename of the process)
    COMPREPLY=( $( /usr/bin/ps -u $USER -o comm  | \
        sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
        awk '{if ($0 ~ /^'$cur'/) print $0}' ))
    return 0
}
complete -F _killall killall killps



function _longopts()
{
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    case "${cur:-*}" in
       -*)      ;;
        *)      return ;;
    esac
    case "$1" in
      \~*)      eval cmd="$1" ;;
        *)      cmd="$1" ;;
    esac
    COMPREPLY=( $(_get_longopts ${1} ${cur} ) )
}
complete  -o default -F _longopts configure bash
complete  -o default -F _longopts wget id info a2ps ls recode



function _make()
{
    local mdef makef makef_dir="." makef_inc gcmd cur prev i;
    COMPREPLY=();
    cur=${COMP_WORDS[COMP_CWORD]};
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in
        -*f)
            COMPREPLY=($(compgen -f $cur ));
            return 0
        ;;
    esac;
    case "$cur" in
        -*)
            COMPREPLY=($(_get_longopts $1 $cur ));
            return 0
        ;;
    esac;
    # make reads `GNUmakefile', then `makefile', then `Makefile'
    if [ -f ${makef_dir}/GNUmakefile ]; then
        makef=${makef_dir}/GNUmakefile
    elif [ -f ${makef_dir}/makefile ]; then
        makef=${makef_dir}/makefile
    elif [ -f ${makef_dir}/Makefile ]; then
        makef=${makef_dir}/Makefile
    else
        makef=${makef_dir}/*.mk        # Local convention.
    fi
    # Before we scan for targets, see if a Makefile name was
    # specified with -f ...
    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
        if [[ ${COMP_WORDS[i]} == -f ]]; then
           # eval for tilde expansion
           eval makef=${COMP_WORDS[i+1]}
           break
        fi
    done
    [ ! -f $makef ] && return 0
    # deal with included Makefiles
    makef_inc=$( grep -E '^-?include' $makef | \
    sed -e "s,^.* ,"$makef_dir"/," )
    for file in $makef_inc; do
        [ -f $file ] && makef="$makef $file"
    done
    # If we have a partial word to complete, restrict completions to
    # matches of that word.
    if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi
    COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ \
                                {split($1,A,/ /);for(i in A)print A[i]}' \
                                $makef 2>/dev/null | eval $gcmd  ))
}
complete -F _make -X '+($*|*.[cho])' make gmake pmake\



###### A meta-command completion function for commands like sudo(8), which need to
# first complete on a command, then complete according to that command's own
# completion definition - currently not quite foolproof,
# but still quite useful (By Ian McDonald, modified by me).
function _meta_comp()
{
    local cur func cline cspec
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    cmdline=${COMP_WORDS[@]}
    if [ $COMP_CWORD = 1 ]; then
         COMPREPLY=( $( compgen -c $cur ) )
    else
        cmd=${COMP_WORDS[1]}            # Find command.
        cspec=$( complete -p ${cmd} )   # Find spec of that command.
        # COMP_CWORD and COMP_WORDS() are not read-only,
        # so we can set them before handing off to regular
        # completion routine:
        # Get current command line minus initial command,
        cline="${COMP_LINE#$1 }"
        # split current command line tokens into array,
        COMP_WORDS=( $cline )
        # set current token number to 1 less than now.
        COMP_CWORD=$(( $COMP_CWORD - 1 ))
        # If current arg is empty, add it to COMP_WORDS array
        # (otherwise that information will be lost).
        if [ -z $cur ]; then COMP_WORDS[COMP_CWORD]=""  ; fi
        if [ "${cspec%%-F *}" != "${cspec}" ]; then
      # if -F then get function:
            func=${cspec#*-F }
            func=${func%% *}
            eval $func $cline   # Evaluate it.
        else
            func=$( echo $cspec | sed -e 's/^complete//' -e 's/[^ ]*$//' )
            COMPREPLY=( $( eval compgen $func $cur ) )
        fi
    fi
}
complete -o default -F _meta_comp nohup \
eval exec trace truss strace sotruss gdb
complete -o default -F _meta_comp command type which man nice time



function _tar()
{
    local cur ext regex tar untar
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    # If we want an option, return the possible long options.
    case "$cur" in
        -*)     COMPREPLY=( $(_get_longopts $1 $cur ) ); return 0;;
    esac
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $( compgen -W 'c t x u r d A' -- $cur ) )
        return 0
    fi
    case "${COMP_WORDS[1]}" in
        ?(-)c*f)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
            +([^Izjy])f)
            ext='tar'
            regex=$ext
            ;;
        *z*f)
            ext='tar.gz'
            regex='t\(ar\.\)\(gz\|Z\)'
            ;;
        *[Ijy]*f)
            ext='t?(ar.)bz?(2)'
            regex='t\(ar\.\)bz2\?'
            ;;
        *)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
    esac
    if [[ "$COMP_LINE" == tar*.$ext' '* ]]; then
        # Complete on files in tar file.
        #
        # Get name of tar file from command line.
        tar=$( echo "$COMP_LINE" | \
               sed -e 's|^.* \([^ ]*'$regex'\) .*$|\1|' )
        # Devise how to untar and list it.
        untar=t${COMP_WORDS[1]//[^Izjyf]/}
        COMPREPLY=( $( compgen -W "$( echo $( tar $untar $tar \
                    2>/dev/null ) )" -- "$cur" ) )
        return 0

    else
        # File completion on relevant files.
        COMPREPLY=( $( compgen -G $cur\*.$ext ) )
    fi
    return 0
}
complete -F _tar -o default tar



##################################################
##################################################
##################################################








######################################################################################################################################################
###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS
######################################################################################################################################################








##################################################
# Download all images from a 4chan thread	 #
##################################################

function 4chanimages()
{
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget
}



##################################################
# Add a function you've defined to .bashrc	 #
##################################################

function addfunction() { declare -f $1 >> ~/.bashrc ; }



##################################################
# Text alignment				 #
##################################################

###### center text in console with simple pipe like
function align_center() { l="$(cat -)"; s=$(echo -e "$l"| wc -L); echo "$l" | while read l;do j=$(((s-${#l})/2));echo "$(while ((--j>0)); do printf " ";done;)$l";done;} #; ls --color=none / | center



###### right-align text in console using pipe like ( command | right )
function align_right() { l="$(cat -)"; [ -n "$1" ] && s=$1 || s=$(echo -e "$l"| wc -L); echo "$l" | while read l;do j=$(((s-${#l})));echo "$(while ((j-->0)); do printf " ";done;)$l";done;} #; ls --color=none / | right 150



##################################################
# Show all strings (ASCII & Unicode) in a file	 #
##################################################

function allStrings() { cat "$1" | tr -d "\0" | strings ; }



##################################################
# Miscellaneous Fun				 #
##################################################

###### anagrams
function anagrams()
{
cat > "/tmp/anagrams.py" <<"End-of-message"
#!/usr/bin/python
infile = open ("/usr/share/dict/words", "r")
## "dict" is a reserved word
words_in = infile.readlines()
scrambled = raw_input("Enter the scrambled word: ")
scrambled = scrambled.lower()
scrambled_list = list(scrambled)
scrambled_list.sort()
for word in words_in:
    word_list = list(word.strip().lower())
    word_list.sort()
    ## you don't really have to compare lengths when using lists as the
    ## extra compare takes about as long as finding the first difference
    if word_list == scrambled_list:
        print word, scrambled
End-of-message
chmod +x "/tmp/anagrams.py"
"/tmp/anagrams.py" "$1"
rm "/tmp/anagrams.py"
}



function anagram_() { function s() { sed 's/[[:space:]]*//g;s/./\n\0/g'<<<"$@"|tr A-Z a-z|sort;};cmp -s <(s $1) <(s $2)||echo -n "not ";echo anagram; }



###### random Cyanide and Happiness comics from explosm.net
function cyanide() { display "$(wget -q http://explosm.net/comics/random/ -O - | grep -Po 'http://www.explosm.net/db/files/Comics/*/[^"]+(png|jpg|jpeg)')"; }



###### fake error string
function error()
{
while true; do awk '{ print ; system("let R=$RANDOM%10; sleep $R") }' compiler.log; done
}



###### stupid funny face
function funny_face() {
  _ret=$?; if test $_ret -ne 0; then echo "0_0->ret=$_ret"; set ?=$_ret; unset _ret; else echo "^_^"; fi
}



###### pretend to be busy in office to enjoy a cup of coffee
function grepcolor()
{
cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"
}



###### a simple number guessing game
function hilow()
{
biggest=1000                            # maximum number possible
guess=0                                 # guessed by player
guesses=0                               # number of guesses made
number=$(( $$ % $biggest ))             # random number, 1 .. $biggest
while [ $guess -ne $number ] ; do
  echo -n "Guess? " ; read guess
  if [ "$guess" -lt $number ] ; then
    echo "... bigger!"
  elif [ "$guess" -gt $number ] ; then
    echo "... smaller!"
  fi
  guesses=$(( $guesses + 1 ))
done
echo "Right!! Guessed $number in $guesses guesses."
}



###### watch the National debt clock
function natdebt()
{
watch -n 10 "wget -q http://www.brillig.com/debt_clock -O - | grep debtiv.gif | sed -e 's/.*ALT=\"//' -e 's/\".*//' -e 's/ //g'"
}



function oneliners()
{
w3m -dump_source http://www.onelinerz.net/random-one-liners/1/ | awk ' /.*<div id=\"oneliner_[0-9].*/ {while (! /\/div/ ) { gsub("\n", ""); getline; }; gsub (/<[^>][^>]*>/, "", $0); print $0}'
}



###### random cowsay stuff
function random_cow()
{
  files=(/usr/share/cowsay/cows/*)
  printf "%s\n" "${files[RANDOM % ${#files}]}"
}



##################################################
# Temporarily add to PATH			 #
##################################################

function apath()
{
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "Temporarily add to PATH"
        echo "usage: apath [dir]"
    else
        PATH=$1:$PATH
    fi
}



##################################################
# Function you want after you've overwritten some#
# important file using > instead of >> ^^	 #
##################################################

function append() {
        lastarg="${!#}"
        echo "${@:1:$(($#-1))}" >> "$lastarg"
}



##################################################
# Common commands piped through grep		 #
##################################################

function aptg()		# debian specific.
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "search debian package list"
        echo "usage: aptg [program/keyword]"
    else
        apt-cache search $1 | sort | less
    fi
}



###### grep by paragraph instead of by line
function grepp() { [ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if /$1/i" < "$2";}



function hgg()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "search bash history"
        echo "usage: mg [search pattern]"
    else
        history | grep -i $1 | grep -v hg
    fi
}



function lsofg()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "grep lsof"
        echo "usage: losfg [port/program/whatever]"
    else
        lsof | grep -i $1 | less
    fi
}



function psg()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "grep running processes"
        echo "usage: psg [process]"
    else
        ps aux | grep USER | grep -v grep
        ps aux | grep -i $1 | grep -v grep
    fi
}



##################################################
# Sudo stuff					 #
##################################################

###### Apt-get via sudo
# An apt-get wrapper function which will run the command via sudo, but will run it normally if you're only downloading source files.
# function apt-get() { [ "$1" = source ] && (command apt-get "$@";true) || sudo apt-get "$@" }



# function sudo()
# {
#   command="$@"
#   if [ -z "$command" ]; then
#     command sudo -s
#   else
#      command sudo "$@"
#   fi
# }



###### Wrap sudo to handle aliases and functions
# (enabled means all 'sudo' in this file need
# to be removed) (disabled for now by adding
# a single '#')
# function sudo()
# {
# local c o t parse
## Parse sudo args
# OPTIND=1
# while getopts xVhlLvkKsHPSb:p:c:a:u: t; do
# if [ "$t" = x ]; then
# parse=true
# else
# o="$o -$t"
# [ "$OPTARG" ] && o="$o $OPTARG"
# fi
# done
# shift $(( $OPTIND - 1 ))
## If no arguments are left, it's a simple call to sudo
# if [ $#  -ge 1 ]; then
# c="$1";
# shift;
# case $(type -t "$c") in
# "")
# echo No such command "$c"
# return 127
# ;;
# alias)
# c="$(type "$c"|sed "s/^.* to \`//;s/.$//")"
# ;;
# function)
# c=$(type "$c"|sed 1d)";\"$c\""
# ;;
# *)
# c="\"$c\""
# ;;
# esac
# if [ -n "$parse" ]; then
## Quote the rest once, so it gets processed by bash.
## Done this way so variables can get expanded.
# while [ -n "$1" ]; do
# c="$c \"$1\""
# shift
# done
# else
## Otherwise, quote the arguments. The echo gets an extra
## space to prevent echo from parsing arguments like -n
## Note the lovely interactions between " and ' ;-)
# while [ -n "$1" ]; do
# c="$c '$(echo " $1"|sed -e "s/^ //" -e "s/'/'\"'\"'/")'"
# shift
# done
# fi
## Run the command with verbose options
## echo Executing sudo $o -- bash -x -v -c "$c" >&2
# command sudo $o bash -xvc "$c"
# else
## echo sudo $o >&2
# command sudo $o
# fi
# }



###### Sudo for entire line (including pipes and redirects)
# USAGE: $ sudor your command
# This command uses a dirty hack with history, so be sure you not turned it off.
# WARNING!: This command behavior differ from other commands. It more like text macro, so you shouldn't use it in subshells, non-interactive sessions, other # functions/aliases and so on. You shouldn't pipe into sudor (any string that prefixes sudor will be removed), but if you really want, use this commands:
function proceed_sudo() { sudor_command="`HISTTIMEFORMAT=\"\" history 1 | sed -r -e 's/^.*?sudor//' -e 's/\"/\\\"/g'`" ; sudo sh -c "$sudor_command"; }; alias sudor="proceed_sudo # "



##################################################
# To show Apt Log History			 #
##################################################

function apt-history() {
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}



##################################################
# Undo apt-get build-dep (remove build		 #
# dependencies)					 #
##################################################

function aptitude-remove-dep() { sudo aptitude markauto $(apt-cache showsrc "$1" | grep Build-Depends | perl -p -e 's/(?:[\[(].+?[\])]|Build-Depends:|,|\|)//g'); }



##################################################
# Arch-wiki-docs simple search			 #
##################################################

function archwikisearch() {
	# old version
	# cd /usr/share/doc/arch-wiki/html/
	# grep -i "$1" index.html | sed 's/.*HREF=.\(.*\.html\).*/\1/g' | xargs opera -newpage
	cd /usr/share/doc/arch-wiki/html/
	for i in $(grep -li $1 *)
	do
		STRING=`grep -m1 -o 'wgTitle = "[[:print:]]\+"' $i`
		LEN=${#STRING}
		let LEN=LEN-12
		STRING=${STRING:11:LEN}
		LOCATION="/usr/share/doc/arch-wiki/html/$i"
		echo -e " \E[33m$STRING   \E[37m$LOCATION"
	done
}



##################################################
# Numerical conversions and numbers stuff	 #
##################################################

###### convert arabic to roman numerals
# Copyright 2007 - 2010 Christopher Bratusek
function arabic2roman() {

  echo $1 | sed -e 's/1...$/M&/;s/2...$/MM&/;s/3...$/MMM&/;s/4...$/MMMM&/
s/6..$/DC&/;s/7..$/DCC&/;s/8..$/DCCC&/;s/9..$/CM&/
s/1..$/C&/;s/2..$/CC&/;s/3..$/CCC&/;s/4..$/CD&/;s/5..$/D&/
s/6.$/LX&/;s/7.$/LXX&/;s/8.$/LXXX&/;s/9.$/XC&/
s/1.$/X&/;s/2.$/XX&/;s/3.$/XXX&/;s/4.$/XL&/;s/5.$/L&/
s/1$/I/;s/2$/II/;s/3$/III/;s/4$/IV/;s/5$/V/
s/6$/VI/;s/7$/VII/;s/8$/VIII/;s/9$/IX/
s/[0-9]//g'

}



###### convert ascii
# copyright 2007 - 2010 Christopher Bratusek
function asc2all() {
	if [[ $1 ]]; then
		echo "ascii $1 = binary $(asc2bin $1)"
		echo "ascii $1 = octal $(asc2oct $1)"
		echo "ascii $1 = decimal $(asc2dec $1)"
		echo "ascii $1 = hexadecimal $(asc2hex $1)"
		echo "ascii $1 = base32 $(asc2b32 $1)"
		echo "ascii $1 = base64 $(asc2b64 $1)"
	fi
}



function asc2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; $(asc2dec $1)" | bc
	fi
}



function asc2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; $(asc2dec $1)" | bc
	fi
}



function asc2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; $(asc2dec $1)" | bc
	fi
}



function asc2dec() {
	if [[ $1 ]]; then
		printf '%d\n' "'$1'"
	fi
}



function asc2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; $(asc2dec $1)" | bc
	fi
}



function asc2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; $(asc2dec $1)" | bc
	fi
}



###### Averaging columns of numbers
# Computes a columns average in a file. Input parameters = column number and optional pattern.
function avg() { awk "/$2/{sum += \$$1; lc += 1;} END {printf \"Average over %d lines: %f\n\", lc, sum/lc}"; }



###### convert binaries
# copyright 2007 - 2010 Christopher Bratusek
function bin2all() {
	if [[ $1 ]]; then
		echo "binary $1 = octal $(bin2oct $1)"
		echo "binary $1 = decimal $(bin2dec $1)"
		echo "binary $1 = hexadecimal $(bin2hex $1)"
		echo "binary $1 = base32 $(bin2b32 $1)"
		echo "binary $1 = base64 $(bin2b64 $1)"
		echo "binary $1 = ascii $(bin2asc $1)"
	fi
}



function bin2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o $((2#$1)))"
	fi
}



function bin2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; ibase=2 ; $1" | bc
	fi
}



function bin2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; ibase=2 ; $1 " | bc
	fi
}



function bin2dec() {
	if [[ $1 ]]; then
		echo $((2#$1))
	fi
}



function bin2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; ibase=2 ; $1" | bc
	fi
}



function bin2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; ibase=2 ; $1" | bc
	fi
}



###### simple calculator to 4 decimals
function calc() {
echo "scale=4; $1" | bc
}



###### temperature conversion
# Copyright 2007 - 2010 Christopher Bratusek
function cel2fah() {

  if [[ $1 ]]; then
	echo "scale=2; $1 * 1.8  + 32" | bc
  fi

}



function cel2kel() {

  if [[ $1 ]]; then
	echo "scale=2; $1 + 237.15" | bc
  fi

}



function fah2cel() {

  if [[ $1 ]]; then
	echo "scale=2 ; ( $1 - 32  ) / 1.8" | bc
  fi

}



function fah2kel() {

  if [[ $1 ]]; then
	echo "scale=2; ( $1 + 459.67 ) / 1.8 " | bc
  fi

}



function kel2cel() {

  if [[ $1 ]]; then
	echo "scale=2; $1 - 273.15" | bc
  fi

}



function kel2fah() {

  if [[ $1 ]]; then
	echo "scale=2; $1 * 1.8 - 459,67" | bc
  fi

}



###### Output an ASCII character given its decimal equivalent
function chr() { printf \\$(($1/64*100+$1%64/8*10+$1%8)); }



###### the notorious "hailstone" or Collatz series.
function collatz()
{
# get the integer "seed" from the command-line to generate the integer "result"
# if NUMBER is even, divide by 2, or if odd, multiply by 3 and add 1
# the theory is that every sequence eventually settles down to repeating "4,2,1..." cycles
MAX_ITERATIONS=200
# For large seed numbers (>32000), try increasing MAX_ITERATIONS.
h=${1:-$$}                      #  Seed. #  Use $PID as seed, #+ if not specified as command-line arg.
echo
echo "C($h) --- $MAX_ITERATIONS Iterations"
echo
for ((i=1; i<=MAX_ITERATIONS; i++))
do
COLWIDTH=%7d
printf $COLWIDTH $h
  let "remainder = h % 2"
  if [ "$remainder" -eq 0 ]   # Even?
  then
    let "h /= 2"              # Divide by 2.
  else
    let "h = h*3 + 1"         # Multiply by 3 and add 1.
  fi
COLUMNS=10                    # Output 10 values per line.
let "line_break = i % $COLUMNS"
if [ "$line_break" -eq 0 ]
then
  echo
fi
done
echo
}



###### temperature conversion script that lets the user enter
# a temperature in any of Fahrenheit, Celsius or Kelvin and receive the
# equivalent temperature in the other two units as the output.
# usage:	convertatemp F100 (if don't put F,C, or K, default is F)
function convertatemp()
{
if uname | grep 'SunOS'>/dev/null ; then
  echo "Yep, SunOS, let\'s fix this baby"
  PATH="/usr/xpg4/bin:$PATH"
fi
if [ $# -eq 0 ] ; then
  cat << EOF >&2
Usage: $0 temperature[F|C|K]
where the suffix:
   F	indicates input is in Fahrenheit (default)
   C	indicates input is in Celsius
   K	indicates input is in Kelvin
EOF
fi
unit="$(echo $1|sed -e 's/[-[[:digit:]]*//g' | tr '[:lower:]' '[:upper:]' )"
temp="$(echo $1|sed -e 's/[^-[[:digit:]]*//g')"
case ${unit:=F}
in
  F ) # Fahrenheit to Celsius formula:  Tc = (F -32 ) / 1.8
  farn="$temp"
  cels="$(echo "scale=2;($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  ;;
  C ) # Celsius to Fahrenheit formula: Tf = (9/5)*Tc+32
  cels=$temp
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  farn="$(echo "scale=2;((9/5) * $cels) + 32" | bc)"
  ;;
  K ) # Celsius = Kelvin + 273.15, then use Cels -> Fahr formula
  kelv=$temp
  cels="$(echo "scale=2; $kelv - 273.15" | bc)"
  farn="$(echo "scale=2; ((9/5) * $cels) + 32" | bc)"
esac
echo "Fahrenheit = $farn"
echo "Celsius    = $cels"
echo "Kelvin     = $kelv"
}



###### convert hexadecimal numbers to decimals
function dec()		{ printf "%d\n" $1; }



###### convert decimals to hexadecimal numbers
function hex()		{ printf "0x%08x\n" $1; }



###### convert decimals
# copyright 2007 - 2010 Christopher Bratusek
function dec2all() {
	if [[ $1 ]]; then
		echo "decimal $1 = binary $(dec2bin $1)"
		echo "decimal $1 = octal $(dec2oct $1)"
		echo "decimal $1 = hexadecimal $(dec2hex $1)"
		echo "decimal $1 = base32 $(dec2b32 $1)"
		echo "decimal $1 = base64 $(dec2b64 $1)"
		echo "deciaml $1 = ascii $(dec2asc $1)"
	fi
}



function dec2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o 97)"
	fi
}



function dec2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; $1" | bc
	fi
}



function dec2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; $1" | bc
	fi
}



function dec2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; $1" | bc
	fi
}



function dec2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; $1" | bc
	fi
}



function dec2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; $1" | bc
	fi
}



###### number --- convert decimal integer to english words
# total number
# Usage:	dec2text 1234 -> one thousand two hundred thirty-four
# Author: Noah Friedman <friedman@prep.ai.mit.edu>
function dec2text()
{
prog=`echo "$0" | sed -e 's/[^\/]*\///g'`
garbage=`echo "$*" | sed -e 's/[0-9,.]//g'`
if test ".$garbage" != "."; then
  echo "$prog: Invalid character in argument." 1>&2
fi
case "$*" in
# This doesn't always seem to work.
#   *[!0-9,.]* ) echo "$prog: Invalid character in argument." 1>&2; ;;
   *.* ) echo "$prog: fractions not supported (yet)." 1>&2; ;;
   '' ) echo "Usage: $prog [decimal integer]" 1>&2; ;;
esac
result=
eval set - "`echo ${1+\"$@\"} | sed -n -e '
  s/[, ]//g
  s/^00*/0/g
  s/\(.\)\(.\)\(.\)$/\"\1 \2 \3\"/
  :l
  /[0-9][0-9][0-9]/{
     s/\([^\" ][^\" ]*\)\([^\" ]\)\([^\" ]\)\([^\" ]\)/\1\"\2 \3 \4\"/g
     t l
  }
  /^[0-9][0-9][0-9]/s/\([^\" ]\)\([^\" ]\)\([^\" ]\)/\"\1 \2 \3\"/
  /^[0-9][0-9]/s/\([^\" ]\)\([^\" ]\)/\"\1 \2\"/
  /^[0-9]/s/^\([^\" ][^\" ]*\)/\"\1\"/g;s/\"\"/\" \"/g
  p'`"
while test $# -ne 0 ; do
  eval `set - $1;
        d3='' d2='' d1=''
        case $# in
          1 ) d1=$1 ;;
          2 ) d2=$1 d1=$2 ;;
          3 ) d3=$1 d2=$2 d1=$3 ;;
        esac
        echo "d3=\"$d3\" d2=\"$d2\" d1=\"$d1\""`
  val1='' val2='' val3=''
  case "$d3" in
    1 ) val3=one   ;;     6 ) val3=six   ;;
    2 ) val3=two   ;;     7 ) val3=seven ;;
    3 ) val3=three ;;     8 ) val3=eight ;;
    4 ) val3=four  ;;     9 ) val3=nine  ;;
    5 ) val3=five  ;;
  esac
  case "$d2" in
    1 ) val2=teen   ;;    6 ) val2=sixty   ;;
    2 ) val2=twenty ;;    7 ) val2=seventy ;;
    3 ) val2=thirty ;;    8 ) val2=eighty  ;;
    4 ) val2=forty  ;;    9 ) val2=ninety  ;;
    5 ) val2=fifty  ;;
  esac
  case "$val2" in
    teen )
      val2=
      case "$d1" in
        0 ) val1=ten      ;;     5 ) val1=fifteen   ;;
        1 ) val1=eleven   ;;     6 ) val1=sixteen   ;;
        2 ) val1=twelve   ;;     7 ) val1=seventeen ;;
        3 ) val1=thirteen ;;     8 ) val1=eighteen  ;;
        4 ) val1=fourteen ;;     9 ) val1=nineteen  ;;
      esac
     ;;
    0 ) : ;;
    * )
      test ".$val2" != '.' -a ".$d1" != '.0' \
       && val2="${val2}-"
      case "$d1" in
        0 ) val2="$val2 " ;;     5 ) val1=five  ;;
        1 ) val1=one      ;;     6 ) val1=six   ;;
        2 ) val1=two      ;;     7 ) val1=seven ;;
        3 ) val1=three    ;;     8 ) val1=eight ;;
        4 ) val1=four     ;;     9 ) val1=nine  ;;
      esac
     ;;
  esac
  test ".$val3" != '.' && result="$result$val3 hundred "
  test ".$val2" != '.' && result="$result$val2"
  test ".$val1" != '.' && result="$result$val1 "
  if test ".$d1$d2$d3" != '.000' ; then
    case $# in
       0 | 1 ) ;;
       2 ) result="${result}thousand "          ;;
       3 ) result="${result}million "           ;;
       4 ) result="${result}billion "           ;;
       5 ) result="${result}trillion "          ;;
       6 ) result="${result}quadrillion "       ;;
       7 ) result="${result}quintillion "       ;;
       8 ) result="${result}sextillion "        ;;
       9 ) result="${result}septillion "        ;;
      10 ) result="${result}octillion "         ;;
      11 ) result="${result}nonillion "         ;;
      12 ) result="${result}decillion "         ;;
      13 ) result="${result}undecillion "       ;;
      14 ) result="${result}duodecillion "      ;;
      15 ) result="${result}tredecillion "      ;;
      16 ) result="${result}quattuordecillion " ;;
      17 ) result="${result}quindecillion "     ;;
      18 ) result="${result}sexdecillion "      ;;
      19 ) result="${result}septendecillion "   ;;
      20 ) result="${result}octodecillion "     ;;
      21 ) result="${result}novemdecillion "    ;;
      22 ) result="${result}vigintillion "      ;;
      * ) echo "Error: number too large (66 digits max)." 1>&2; ;;
    esac
  fi
  shift
done
set $result > /dev/null
case "$*" in
  '') set zero ;;
esac
echo ${1+"$@"}
# number ends here
}



# individual numbers
# Usage:	dec2text 1234 -> one two three four
function dec2text_()
{
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
n=$1
len=$(echo $n | wc -c)
len=$(( $len - 1 ))
for (( i=1; i<=$len; i++ ))
do
   # get one digit at a time
    digit=$(echo $n | cut -c $i)
   # use case control structure to find digit equivalent in words
    case $digit in
        0) echo -n "zero " ;;
        1) echo -n "one " ;;
        2) echo -n "two " ;;
        3) echo -n "three " ;;
        4) echo -n "four " ;;
        5) echo -n "five " ;;
        6) echo -n "six " ;;
        7) echo -n "seven " ;;
        8) echo -n "eight " ;;
        9) echo -n "nine " ;;
    esac
done
# just print new line
echo ""
}



function d2u() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ -e "$1" ]]; then
		sed -r 's/\r$//' -i "$1"
	fi
}



function u2d() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ -e "$1" ]]; then
		sed -r 's/$/\r/' -i "$1"
	fi
}



###### factorial for integers
function factorial()
{
echo "Enter an integer: "
read n
# Below we define the factorial function in bc syntax
fact="define f (x) {
i=x
fact=1
while (i > 1) {
fact=fact*i
i=i-1
}
return fact
}"
# Below we pass the function defined above, and call it with n as a parameter and pipe it to bc
factorial=`echo "$fact;f($n)" | bc -l`
echo "$n! = $factorial"
}



###### convert hexadecimal numbers
# copyright 2007 - 2010 Christopher Bratusek
function hex2all() {
	if [[ $1 ]]; then
		echo "hexadecimal $1 = binary $(hex2bin $1)"
		echo "hexadecimal $1 = octal $(hex2oct $1)"
		echo "hexadecimal $1 = decimal $(hex2dec $1)"
		echo "hexadecimal $1 = base32 $(hex2b32 $1)"
		echo "hexadecimal $1 = base64 $(hex2b64 $1)"
		echo "hexadecimal $1 = ascii $(hex2asc $1)"
	fi
}



function hex2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o $((16#$1)))"
	fi
}



function hex2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; ibase=16 ; $1" | bc
	fi
}



function hex2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; ibase=16 ; $1" | bc
	fi
}



function hex2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; ibase=16 ; $1" | bc
	fi
}



function hex2dec() {
	if [[ $1 ]]; then
		 echo $((16#$1))
	fi
}



function hex2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; ibase=16 ; $1" | bc
	fi
}



###### length
function length()
{
    if [ $# -lt 1 ]; then
        echo "count # of chars in arugment"
        echo "usage: length [string]"
    else
        echo -n $@ | wc -c
    fi
}



###### finding logs for numbers
function math-log()
{
echo "Enter value: "
read x
echo "Natural Log: ln($x) :"
echo "l($x)" | bc -l
echo "Ten Base Log: log($x) :"
echo "l($x)/l(10)" | bc -l
}



###### magic square generator (odd-order squares only!)
function msquare()
{
# Author: mendel cooper
EVEN=2
MAXSIZE=31   # 31 rows x 31 cols.
E_usage=90   # Invocation error.
dimension=
declare -i square
function usage_message()
{
  echo "Usage: $0 square-size"
  echo "   ... where \"square-size\" is an ODD integer"
  echo "       in the range 3 - 31."  #  Works for squares up to order 159
}
function calculate()       # Here's where the actual work gets done.
{
  local row col index dimadj j k cell_val=1
  dimension=$1
  let "dimadj = $dimension * 3"; let "dimadj /= 2"   # x 1.5, then truncate.
  for ((j=0; j < dimension; j++))
  do
    for ((k=0; k < dimension; k++))
    do  # Calculate indices, then convert to 1-dim. array index.
        # Bash doesn't support multidimensional arrays. Pity.
      let "col = $k - $j + $dimadj"; let "col %= $dimension"
      let "row = $j * 2 - $k + $dimension"; let "row %= $dimension"
      let "index = $row*($dimension) + $col"
      square[$index]=cell_val; ((cell_val++))
    done
  done
}     # Plain math, no visualization required.
function print_square()               # Output square, one row at a time.
{
  local row col idx d1
  let "d1 = $dimension - 1"   # Adjust for zero-indexed array.
  for row in $(seq 0 $d1)
  do
    for col in $(seq 0 $d1)
    do
      let "idx = $row * $dimension + $col"
      printf "%3d " "${square[idx]}"; echo -n "  "
    done   # Displays up to 13-order neatly in 80-column term window.
    echo   # Newline after each row.
  done
}
if [[ -z "$1" ]] || [[ "$1" -gt $MAXSIZE ]]
then
  usage_message
fi
let "test_even = $1 % $EVEN"
if [ $test_even -eq 0 ]
then           # Can't handle even-order squares.
  usage_message
fi
calculate $1
print_square   # echo "${square[@]}"   # DEBUG
}



###### given a number, show it with comma separated values
function nicenumber()
{
# expects DD and TD to be instantiated. instantiates nicenum
# or, if a second arg is specified, the output is echoed to stdout
function nice_number()
{
  # Note that we use the '.' as the decimal separator for parsing
  # the INPUT value to this script. The output value is as specified
  # by the user with the -d flag, if different from a '.'
  integer=$(echo $1 | cut -d. -f1)		# left of the decimal
  decimal=$(echo $1 | cut -d. -f2)		# right of the decimal
  if [ $decimal != $1 ]; then
    # there's a fractional part, let's include it.
    result="${DD:="."}$decimal"
  fi
  thousands=$integer
  while [ $thousands -gt 999 ]; do
    remainder=$(($thousands % 1000))	# three least significant digits
    while [ ${#remainder} -lt 3 ] ; do	# force leading zeroes as needed
      remainder="0$remainder"
    done
    thousands=$(($thousands / 1000))	# to left of remainder, if any
    result="${TD:=","}${remainder}${result}"	# builds right-to-left
  done
  nicenum="${thousands}${result}"
  if [ ! -z $2 ] ; then
    echo $nicenum
  fi
}
DD="."	# decimal point delimiter, between integer & fractional value
TD=","	# thousands delimiter, separates every three digits
while getopts "d:t:" opt; do
  case $opt in
    d ) DD="$OPTARG"	;;
    t ) TD="$OPTARG"	;;
  esac
done
shift $(($OPTIND - 1))
if [ $# -eq 0 ] ; then
  cat << "EOF" >&2
Usage: $(basename $0) [-d c] [-t c] numeric value
       -d specifies the decimal point delimiter (default '.')
       -t specifies the thousands delimiter (default ',')
EOF
fi
nice_number $1 1	# second arg forces this to 'echo' output
}



###### convert normal to unix
function normal2unix()
{
    echo "${@}" | awk '{print mktime($0)}';
}



###### convert unix to normal
function unix2normal()
{
    echo $1 | awk '{print strftime("%Y-%m-%d %H:%M:%S",$1)}';
}



###### list of numbers with equal width
function nseq()
{
seq -w 0 "$1"
}



###### convert octals
# copyright 2007 - 2010 Christopher Bratusek
function oct2all() {
	if [[ $1 ]]; then
		echo "octal $1 = binary $(oct2bin $1)"
		echo "octal $1 = decimal $(oct2dec $1)"
		echo "octal $1 = hexadecimal $(oct2hex $1)"
		echo "octal $1 = base32 $(oct2b32 $1)"
		echo "octal $1 = base64 $(oct2b64 $1)"
		echo "octal $1 = ascii $(oct2asc $1)"
	fi
}



function oct2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o $((8#$1)))"
	fi
}



function oct2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; ibase=8 ; $1" | bc
	fi
}



function oct2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; ibase=8 ; $1" | bc
	fi
}



function oct2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; ibase=8 ; $1" | bc
	fi
}



function oct2dec() {
	if [[ $1 ]]; then
		echo $((8#$1))
	fi
}



function oct2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; ibase=8 ; $1" | bc
	fi
}



###### Pascal's triangle
function pascal() { l=15;for((i=0;i<$l;i++));do eval "a$i=($(pv=1;v=1;for((j=0;j<$l-$i;j++));do [ $i -eq 0 -o $j -eq 0 ]&&{ v=1 && pv=1; }||v=$((pv+a$((i-1))[$((j))]));echo -n "$v ";pv=$v;done;));";o="$(eval echo "$(for((k=0;k<=$i;k++)); do eval "echo -n \"\$((a\$((i-k))[k])) \""; done)")";echo "$o";s="${#o}"; done; } | while read l; do j=$((s-${#l}/2)); echo "$(while ((i++ < j)); do echo -n " ";done;)$l";done



###### convert phone numbers to letters/potentially english words
# Creator:	asmoore82
function phone2text()
{
echo -n "Enter number: "
read num
# Create a list of possibilites for expansion by the shell
# the "\}" is an ugly hack to get "}" into the replacment string -
# this is not a clean escape sequence - the litteral "\" is left behind!
num="${num//2/{a,b,c\}}"
num="${num//3/{d,e,f\}}"
num="${num//4/{g,h,i\}}"
num="${num//5/{j,k,l\}}"
num="${num//6/{m,n,o\}}"
num="${num//7/{p,q,r,s\}}"
num="${num//8/{t,u,v\}}"
num="${num//9/{w,x,y,z\}}"
# cleaup from the hack - remove all litteral \'s
num="${num//\\/}"
echo ""
echo "Possible words are:"
for word in $( eval echo "$num" )
do
    echo '>' "$word"
done
# End of File
}



###### powers of numerals
# copyright 2007 - 2010 Christopher Bratusek
function power() {
	if [[ $1 ]]; then
		if [[ $2 ]]; then
			echo "$1 ^ $2" | bc
		else	echo "$1 ^ 2" | bc
		fi
	fi
}



###### generate prime numbers, without using arrays.
# script contributed by Stephane Chazelas.
function primes()
{
LIMIT=1000                    # Primes, 2 ... 1000.
Primes()
{
 (( n = $1 + 1 ))             # Bump to next integer.
 shift                        # Next parameter in list.
#  echo "_n=$n i=$i_"
 if (( n == LIMIT ))
 then echo $*
 return
 fi
 for i; do                    # "i" set to "@", previous values of $n.
#   echo "-n=$n i=$i-"
   (( i * i > n )) && break   # Optimization.
   (( n % i )) && continue    # Sift out non-primes using modulo operator.
   Primes $n $@               # Recursion inside loop.
   return
   done
   Primes $n $@ $n            #  Recursion outside loop.
                              #  Successively accumulate
			      #+ positional parameters.
                              #  "$@" is the accumulating list of primes.
}
Primes 1
}



###### radicals of numbers
# copyright 2007 - 2010 Christopher Bratusek
function radical() {
	if [[ $1 ]]; then
		echo "sqrt($1)" | bc -l
	fi
}



###### convert to roman numerals
function roman-numeral()
{
python -c 'while True: print (lambda y,x=[],nums={ 1000:"M",900:"CM",500:"D",400:"CD",100:"C",90:"XC",
50:"L",40:"XL",10:"X",9:"IX",5:"V",4:"IV",1:"I"}: (lambda ro=(lambda : map(lambda g,r=lambda b:x.append(
y[-1]/b),t=lambda v:y.append(y[-1]%v):map(eval,["r(g)","t(g)"]),sorted(nums.keys())[::-1]))():"".join(
map(lambda fg: map(lambda ht: nums[ht],sorted(nums.keys())[::-1])[fg] * x[fg],range(len(x)))))())([int(
raw_input("Please enter a number between 1 and 4000: "))])'
}



###### round numerals to whole numbers
# copyright 2007 - 2010 Christopher Bratusek
function round() {
	if [[ $1 ]]; then
		if [[ $2 ]]; then
			echo "$(printf %.${2}f $1)"
		else	echo "$(printf %.0f $1)"
		fi
	fi
}



###### ruler that stretches across the terminal
function ruler() { for s in '....^....|' '1234567890'; do w=${#s}; str=$( for (( i=1; $i<=$(( ($COLUMNS + $w) / $w )) ; i=$i+1 )); do echo -n $s; done ); str=$(echo $str | cut -c -$COLUMNS) ; echo $str; done; }



###### convert seconds to minutes, hours, days, and etc.
# inputs a number of seconds, outputs a string like "2 minutes, 1 second"
# $1: number of seconds
function sec2all()
{
    local millennia=$((0))
    local centuries=$((0))
    local years=$((0))
    local days=$((0))
    local hour=$((0))
    local mins=$((0))
    local secs=$1
    local text=""
    # convert seconds to days, hours, etc
    millennia=$((secs / 31536000000))
    secs=$((secs % 31536000000))
    centuries=$((secs / 3153600000))
    secs=$((secs % 3153600000))
    years=$((secs / 31536000))
    secs=$((secs % 31536000))
    days=$((secs / 86400))
    secs=$((secs % 86400))
    hour=$((secs / 3600))
    secs=$((secs % 3600))
    mins=$((secs / 60))
    secs=$((secs % 60))
    # build full string from unit strings
    text="$text$(seconds-convert-part $millennia "millennia")"
    text="$text$(seconds-convert-part $centuries "century")"
    text="$text$(seconds-convert-part $years "year")"
    text="$text$(seconds-convert-part $days "day")"
    text="$text$(seconds-convert-part $hour "hour")"
    text="$text$(seconds-convert-part $mins "minute")"
    text="$text$(seconds-convert-part $secs "second")"
    # trim leading and trailing whitespace
    text=${text## }
    text=${text%% }
    # special case for zero seconds
    if [ "$text" == "" ]; then
        text="0 seconds"
    fi
    # echo output for the caller
    echo ${text}
}
# formats a time unit into a string
# $1: integer count of units: 0, 6, etc
# $2: unit name: "hour", "minute", etc
function seconds-convert-part()
{
    local unit=$1
    local name=$2
    if [ $unit -ge 2 ]; then
        echo " ${unit} ${name}s"
    elif [ $unit -ge 1 ]; then
        echo " ${unit} ${name}"
    else
        echo ""
    fi
}



###### finding the square root of numbers
function sqrt()
{
echo "sqrt ("$1")" | bc -l
}



###### converts a string (words, text) to binary
function string2bin()
{
perl -nle 'printf "%0*v8b\n"," ",$_'
}



###### trigonmetry calculations with angles
function trig-angle()
{
echo "Enter angle in degree: "
read deg
# Note: Pi calculation
# tan(pi/4) = 1
# atan(1) = pi/4 and
# pi = 4*atan(1)
pi=`echo "4*a(1)" | bc -l`
rad=`echo "$deg*($pi/180)" | bc -l`
echo "$deg Degree = $rad Radian"
echo "Sin($deg): "
echo "s($rad)" | bc -l
echo "Cos($deg): "
echo "c($rad)" | bc -l
echo "Tan($deg): "
echo "s($rad)/c($rad)" | bc -l
}



##################################################
# Ask						 #
##################################################

function ask()
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}



##################################################
# Escape potential tarbombs			 #
##################################################

function atb() { l=$(tar tf $1); if [ $(echo "$l" | wc -l) -eq $(echo "$l" | grep $(echo "$l" | head -n1) | wc -l) ]; then tar xf $1; else mkdir ${1%.tar.gz} && tar xf $1 -C ${1%.tar.gz}; fi ; }



##################################################
# Get the headlines of an atom feed		 #
##################################################

function atomtitles()
{
curl --silent $1 | xmlstarlet sel -N atom="http://www.w3.org/2005/Atom" -t -m /atom:feed/atom:entry -v atom:title -n
}



##################################################
# TV/DVD Copying, ripping, and backing up stuff	 #
##################################################

###### ANALOG TV to AVI
function atv2avi()
{
# great xvid quality (11mb/min)
echo -n "What analog/cable tv channel would you like to convert? (1-99)?:
"
read ANALOGSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder -tv driver=v4l2:device=/dev/video1:input=0:norm=ntsc:chanlist=us-cable:channel="$ANALOGSTATION":alsa=1:adevice=hw.1:audiorate=48000:immediatemode=0:amode=1 tv:// -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=2000:v4mv:keyint=250 -vf pullup,softskip -oac mp3lame -lameopts br=128 -ffourcc xvid -o "$AVINAME".avi -endpos "$ENDPOSITION"
}



alias atvrip='atv2avi'



function atv2avi_w()
{
# great xvid quality (11mb/min) (watch the recording at the same time)
echo -n "What analog/cable tv channel would you like to convert? (1-99)?:
"
read ANALOGSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder -tv driver=v4l2:device=/dev/video1:input=0:norm=ntsc:chanlist=us-cable:channel="$ANALOGSTATION":alsa=1:adevice=hw.1:audiorate=48000:immediatemode=0:amode=1 tv:// -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=2000:v4mv:keyint=250 -vf pullup,softskip -oac mp3lame -lameopts br=128 -ffourcc xvid -o "$AVINAME".avi -endpos "$ENDPOSITION" & (sleep 5 && mplayer "$AVINAME".avi)
}



alias atvrip_w='atv2avi_w'



###### WATCH ANALOG TV
function atv()
{
echo -n "What analog/cable tv channel would you like to watch? (1-99)?:
"
read ANALOGSTATION
sh -c "mplayer -tv driver=v4l2:device=/dev/video1:input=0:norm=ntsc:chanlist=us-cable:channel="$ANALOGSTATION" tv:// & sox -r 48000 -t alsa hw:1,0 -t alsa hw:0,0"
}



function atv_()
{
sh -c "tvtime & sox -r 48000 -t alsa hw:1,0 -t alsa hw:0,0"
}



function ATV()
{
sox -s -r 32000 -c 2 -t alsa hw:1,0 -s -r 32000 -c 2 -t alsa hw:0,0 &
tvtime
t=`pidof sox`;
kill $t;
}



###### WATCH DIGITAL TV
function dtv()
{
dtvchannels
echo -n "What digital tv channel would you like to watch?:
"
read DIGITALSTATION
mplayer dvb://"$DIGITALSTATION"
}



###### DIGITAL TV to AVI
function dtv2avi()
{
# great xvid quality (13mb/min)
dtvchannels
echo -n "What digital tv channel would you like to convert?:
"
read DIGITALSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder dvb://"$DIGITALSTATION" -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1600:v4mv:keyint=250 -vf pullup,softskip,scale=624:352 -oac mp3lame -lameopts br=128 -ffourcc xvid -o "$AVINAME".avi -endpos "$ENDPOSITION"
}



alias dtvrip='dtv2avi'



function dtv2avi_w()
{
# great xvid quality (13mb/min) (watch the recording at the same time)
dtvchannels
echo -n "What digital tv channel would you like to convert?:
"
read DIGITALSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder dvb://"$DIGITALSTATION" -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1600:v4mv:keyint=250 -vf pullup,softskip,scale=624:352 -oac mp3lame -lameopts br=128 -ffourcc xvid -o "$AVINAME".avi -endpos "$ENDPOSITION" & (sleep 5 && mplayer "$AVINAME".avi)
}



alias dtvrip_w='dtv2avi_w'



function dtv2avi_()
{
# excellent ffmpeg4 quality (13mb/min), but needs strong signal)
dtvchannels
echo -n "What digital tv channel would you like to convert?:
"
read DIGITALSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder dvb://"$DIGITALSTATION" -o "$AVINAME".avi -oac mp3lame -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1500:vhq -endpos "$ENDPOSITION"
}



alias dtvrip_='dtv2avi_'



function DTV2AVI()
{
# best quality; big file size (100mb/min), but needs strong signal
dtvchannels
echo -n "What digital tv channel would you like to convert?:
"
read DIGITALSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder dvb://"$DIGITALSTATION" -o "$AVINAME".avi -oac copy -ovc copy -endpos "$ENDPOSITION"
}



alias DTVRIP='DTV2AVI'



###### DIGITAL TV to YouTube-compliant AVI
function dtv2yt()
{
# ok quality (YouTube) (5mb/min)
dtvchannels
echo -n "What digital tv channel would you like to convert?:
"
read DIGITALSTATION
echo -n "Please enter a name for the AVI file you will convert:
"
read AVINAME
echo -n "Please enter how long you want to record (in this format: 02:08:17):
"
read ENDPOSITION
mencoder dvb://"$DIGITALSTATION" -oac mp3lame -lameopts cbr=128 -ovc lavc -lavcopts vcodec=mpeg4 -ffourcc xvid -vf scale=320:-2,expand=:240:::1 -o "$AVINAME".avi -endpos "$ENDPOSITION"
}



####### list of all of the local digital tv channels
#function dtvchannels() {
#cat <<EOF
#<INSERT YOUR LOCAL DIGITAL TV STATIONS HERE>
#EOF
#}




###### DVD to ISO
function dvd2iso()
{
# to get desired device
df -h -x tmpfs -x usbfs
echo -n "Using the information in the terminal window, please enter the appropriate DVD drive:
"
read DVDDEVICE
echo -n "Please enter a name for the ISO file you will create:
"
read XVIDNAME
dd if="$DVDDEVICE" of="$XVIDNAME".iso
}



alias dvdcopy='dvd2iso'



###### DVD to MPG
alias dvd2mpeg='dvd2mpg'


function dvd2mpg()
{
# to get desired device
df -h -x tmpfs -x usbfs
echo -n "Using the information in the terminal window, please enter the appropriate DVD drive:
"
read DVDDEVICE
# to get desired title on dvd
# requires lsdvd: sudo apt-get install lsdvd
lsdvd "$DVDDEVICE"
echo -n "Using the information in the terminal window, please enter the title number you will convert (usually the longest one):
"
read DVDTITLE
echo -n "Please enter a name for the MPG/MPEG file you will convert:
"
read MPEGNAME
mplayer dvd://"$DVDTITLE" -dumpstream -alang es -dumpfile "$MPEGNAME".mpg
}



###### DVD to VOB
# requires vobcopy: sudo apt-get install vobcopy
# alias dvd2vob='vobcopy -i /dev/dvd -o ~/ -l'



alias dvd2vob='dvd2mpg'



###### extract audio from DVD VOB files
# USAGE:	dvdaudio input_file.vob output_file.ac3
function dvdaudio()
{
echo -n "Please enter the name (full path) for the MPG/MPEG/VOB file you will extract the audio from:
"
read VOBNAME
echo -n "Please enter a name for the audio file you will extract from the MPG/MPEG/VOB file:
"
read AC3NAME
mplayer "$VOBNAME" -aid 128 -dumpaudio -dumpfile "$AC3NAME"
}



###### Video to AVI
alias dvdrip='video2avi'



alias rip='video2avi'



function video2avi()
{
# Video To Avi
# Created:	Inameiname
# Version:	3.2
####################### Run in the terminal on double-click
tty -s; if [ $? -ne 0 ] ; then gnome-terminal -e "$0"; exit; fi
####################### If it doesn't run in the terminal on double-click, say so
[ -t 0 ] && [ -t 1 ] || { zenity --warning --text="${0}: this script must be run from a terminal." ; exit 1 ;}
####################### Check whether environment variables are empty
###### see if the Nautilus environment variable is empty
# if it exists, set it equal to 'INPUT_FILE'
for ARCHIVE_FULLPATH in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
    ARCHIVE_PATH=${ARCHIVE_FULLPATH%.*}
if [ -f $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS ] ; then
# if select iso file:
if [ $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS = $ARCHIVE_PATH.iso ] ; then
# to get desired title on dvd
# requires lsdvd: sudo apt-get install lsdvd
lsdvd $ARCHIVE_PATH.iso
echo -n "Please enter the title number you will convert (usually the longest one):

Press 'Enter' for default (default is '1')...

"
read TITLE
# extra blank space
echo "
"
# default
if [[ -z $TITLE ]] ; then
# If no title passed, default to 1
    TITLE=1
fi
    INPUT_FILE="dvd://$TITLE -dvd-device $ARCHIVE_PATH.iso"
fi
# if select video file:
if [ $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS != $ARCHIVE_PATH.iso ] ; then
    INPUT_FILE=$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
fi
fi
done
# if it's blank, set it equal to $1
if [ -z $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS ] ; then
    # If it's blank, set it equal to $1
    NAUTILUS_SCRIPT_SELECTED_FILE_PATHS=$1
###### see if the '$1' variable is empty
# if it exists, set it equal to 'INPUT_FILE'
for ARCHIVE_FULLPATH in $1; do
    ARCHIVE_PATH=${ARCHIVE_FULLPATH%.*}
if [ -f $1 ] ; then
# if select iso file:
if [ $1 = $ARCHIVE_PATH.iso ] ; then
# to get desired title on dvd
# requires lsdvd: sudo apt-get install lsdvd
lsdvd $ARCHIVE_PATH.iso
echo -n "Please enter the title number you will convert (usually the longest one):

Press 'Enter' for default (default is '1')...

"
read TITLE
# extra blank space
echo "
"
# default
if [[ -z $TITLE ]] ; then
# If no title passed, default to 1
    TITLE=1
fi
    INPUT_FILE="dvd://$TITLE -dvd-device $ARCHIVE_PATH.iso"
fi
# if select video file:
if [ $1 != $ARCHIVE_PATH.iso ] ; then
    INPUT_FILE=$1
fi
fi
done
# if it's blank, do the following:
if [ -z "$1" ] ; then
####################### Input DVD/ISO/VIDEO file menu
echo -n "What do you want to convert to AVI?:

(1) DVD
(2) ISO file
(3) Video file (such as MKV, VOB, MPEG, AVI, WMV, and etc.)

Press 'Enter' for default (default is '1')...

"
read TYPE
# extra blank space
echo "
"
###### Input DVD/ISO/VIDEO source default ######
if [[ -z $TYPE ]] ; then
    # If no media passed, default to 1
    TYPE=1
fi
###### Input DVD/ISO/VIDEO source ######
###### DVD to AVI
if [[ $TYPE = 1 ]] ; then
# to get desired device
df -h -x tmpfs -x usbfs
echo -n "Please enter the appropriate DVD drive:

(1) /dev/dvd
(2) /dev/sr0
(3) /dev/sr1
(4) /dev/sr2
(5) custom

Press 'Enter' for default (default is '1')...

"
read DEVICE_NUMBER
# extra blank space
echo "
"
# default
if [[ -z $DEVICE_NUMBER ]] ; then
# If no device passed, default to /dev/dvd
    DEVICE=/dev/dvd
fi
# preset
if [[ $DEVICE_NUMBER = 1 ]] ; then
    DEVICE=/dev/dvd
fi
if [[ $DEVICE_NUMBER = 2 ]] ; then
    DEVICE=/dev/sr0
fi
if [[ $DEVICE_NUMBER = 3 ]] ; then
    DEVICE=/dev/sr1
fi
if [[ $DEVICE_NUMBER = 4 ]] ; then
    DEVICE=/dev/sr2
fi
# custom
if [[ $DEVICE_NUMBER = 5 ]] ; then
    echo -n "Please enter the appropriate DVD drive:  "
    echo -n "...like this: '/dev/dvd'..."
    read CUSTOM_DEVICE
    DEVICE=$CUSTOM_DEVICE
fi
# to get desired title on dvd
# requires lsdvd: sudo apt-get install lsdvd
lsdvd $DEVICE
echo -n "Please enter the title number you will convert (usually the longest one):

Press 'Enter' for default (default is '1')...

"
read TITLE
# extra blank space
echo "
"
# default
if [[ -z $TITLE ]] ; then
# If no title passed, default to 1
TITLE=1
fi
# to decide to copy straight from the DVD or first copy to hard drive to ISO
echo -n "Would you first like to copy the DVD onto your hard drive (to ISO)?:

(1) Yes (Highly Recommended)
(2) No

Press 'Enter' for default (default is '1')...

"
read DVD2ISO
# extra blank space
echo "
"
# default
if [[ -z $DVD2ISO ]] ; then
# If no DVD2ISO passed, default to 1
dd if=$DEVICE of=NEW.iso
INPUT_FILE="dvd://$TITLE -dvd-device NEW.iso"
fi
# preset
if [[ $DVD2ISO = 1 ]] ; then
dd if=$DEVICE of=NEW.iso
INPUT_FILE="dvd://$TITLE -dvd-device NEW.iso"
fi
if [[ $DVD2ISO = 2 ]] ; then
INPUT_FILE="dvd://$TITLE -dvd-device $DEVICE"
fi
fi
###### ISO to AVI
if [[ $TYPE = 2 ]] ; then
echo -n "Please enter the full path for the ISO:

Example: /home/(your username)/Videos/NEW.iso...

"
read ISO
# extra blank space
echo "
"
# to get desired title on dvd
# requires lsdvd: sudo apt-get install lsdvd
lsdvd $ISO
echo -n "Please enter the title number you will convert (usually the longest one):

Press 'Enter' for default (default is '1')...

"
read TITLE
# extra blank space
echo "
"
# default
if [[ -z $TITLE ]] ; then
# If no title passed, default to 1
TITLE=1
fi
INPUT_FILE="dvd://$TITLE -dvd-device $ISO"
fi
###### Video to AVI
if [[ $TYPE = 3 ]] ; then
echo -n "Please enter the name for the input file (full path, with extension):

It can be any type, such as MKV, VOB, MPEG, AVI, WMV, and etc...

Example: /home/(your username)/Videos/NEW.avi...

"
read VIDEO_FILE
# extra blank space
echo "
"
INPUT_FILE=$VIDEO_FILE
fi
####################### Close the variable statements
fi
fi
####################### Cropping (done automatically)
###### start a timer to kill mplayer
echo "Cropdetect is now running...

A few seconds of your video should now be playing...
"
###### start a timer to kill mplayer
(sleep 6 && killall mplayer)&
###### start the mplayer cropdetect on on the DVD at a random time
mplayer $INPUT_FILE -ss 0:03:10 -vf cropdetect &> mplayer.tmp
###### get last crop value from mplayer output and store in variable
CROP_VALUES=$(awk -F'crop=' '/\[CROP\]/{f=$2} END{print f}' ./mplayer.tmp |cut -d')' -f1)
###### print detected crop values
echo -e "\n\nDetected crop values = ${CROP_VALUES}\n\n"
####################### Output desired name for file
###### file input
echo -n "Please enter a name for the output file (without extension):

Press 'Enter' for default (default is 'NEW')...

"
read OUTPUT_FILE
###### extra blank space
echo "
"
###### default ######
if [[ -z $OUTPUT_FILE ]] ; then
    # If no file passed, default to NEW
    OUTPUT_FILE=NEW_$(date "+%y.%m.%d_%H.%M")
fi
####################### Available processor number (done automatically)
CPUS=$(grep -c processor /proc/cpuinfo)
echo "Using $CPUS processor(s)..."
###### extra blank space
echo "
"
####################### Preset/Custom type options
echo -n "Select a quality level:
(1) exact copy quality MPEG		    (DVD/ISO sources only)
(2) exact copy audio-only quality AC3	    (DVD/ISO sources only)
(3) very high quality H.264 (2-pass)	    (350min:105min film w/2 1.5mhz cpus)
(4) very high quality DIVX/MPEG-4 (2-pass)  (270min:105min film w/2 1.5mhz cpus)
(5) very high quality XVID (2-pass)	    (220min:105min film w/2 1.5mhz cpus)
(6) very high quality H.264 (1-pass)	    (400min:105min film w/2 1.5mhz cpus)
(7) very high quality DIVX/MPEG-4 (1-pass)  (230min:105min film w/2 1.5mhz cpus)
(8) very high quality XVID (1-pass)	    (180min:105min film w/2 1.5mhz cpus)
(9) high quality H.264 (2-pass)		    (240min:105min film w/2 1.5mhz cpus)
(10)high quality DIVX/MPEG-4 (2-pass)	    (190min:105min film w/2 1.5mhz cpus)
(11)high quality XVID (2-pass)		    (135min:105min film w/2 1.5mhz cpus)
(12)high quality H.264 (1-pass)	     	    (200min:105min film w/2 1.5mhz cpus)
(13)high quality DIVX/MPEG-4 (1-pass)	    (150min:105min film w/2 1.5mhz cpus)
(14)high quality XVID (1-pass)		    (090min:105min film w/2 1.5mhz cpus)
(15)fast quality H.264 (1-pass)	     	    (155min:105min film w/2 1.5mhz cpus)
(16)fast quality DIVX/MPEG-4 (1-pass)	    (065min:105min film w/2 1.5mhz cpus)
(17)fast quality XVID (1-pass)		    (065min:105min film w/2 1.5mhz cpus)
(18)fast quality XVID YouTube (1-pass)	    (025min:105min film w/2 1.5mhz cpus)
(19)realtime quality DIVX/MPEG-4 (1-pass)   (050min:105min film w/2 1.5mhz cpus)
(20)realtime quality XVID (1-pass)	    (060min:105min film w/2 1.5mhz cpus)
(21)low quality WMV (1-pass)		    (017min:105min film w/2 1.5mhz cpus)
(22)custom quality
Press 'Enter' for default (default is '14')...  "
read Q
###### extra blank space
echo "
"
###### default ######
if [[ -z $Q ]] ; then
    # If no quality passed, default to 14
    Q=14
fi
####################### Frame rate
###### frame rate menu
if [[ $Q != 1 && $Q != 2 ]] ; then
echo -n "Select a frame rate level:

(1) NTSC-VIDEO 	(~ 30 fps)
(2) NTSC-FILM	(~ 24 fps)
(3) PAL		(~ 25 fps)
(4) Streaming	(~ 15 fps)
(5) custom

Press 'Enter' for default (default is '2')...

"
read FRAME_RATE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $FRAME_RATE_NUMBER ]] ; then
    # If no frame rate passed, default to 2
    FRAME_RATE="-ofps 24000/1001"
fi
###### preset
if [[ $FRAME_RATE_NUMBER = 1 ]] ; then
    FRAME_RATE="-ofps 30000/1001"
fi
if [[ $FRAME_RATE_NUMBER = 2 ]] ; then
    FRAME_RATE="-ofps 24000/1001"
fi
if [[ $FRAME_RATE_NUMBER = 3 ]] ; then
    FRAME_RATE="-ofps 25000/1001"
fi
if [[ $FRAME_RATE_NUMBER = 4 ]] ; then
    FRAME_RATE="-ofps 15000/1001"
fi
###### custom
if [[ $FRAME_RATE_NUMBER = 5 ]] ; then
    echo -n "Please enter a frame rate:  "
    echo -n "...like this: '-ofps 15000/1001'..."
    read CUSTOM_FRAME_RATE
    FRAME_RATE=$CUSTOM_FRAME_RATE
fi
fi
####################### Divx ffourcc menu
###### DivX ffourcc menu
if [[ $Q != 1 && $Q != 2 && $Q != 3 && $Q != 5 && $Q != 6 && $Q != 8 && $Q != 9 && Q != 11 && $Q != 12 && $Q != 14 && $Q != 15 && $Q != 17 && $Q != 18 && $Q != 20 && $Q != 21 && $Q != 22 ]] ; then
echo -n "Select the desired Divx or generic MPEG4 quality:

(1) FFMPEG MPEG-4
(2) DivX MPEG-4 Version 4
(3) DivX MPEG-4 Version 5

Press 'Enter' for default (default is '3')...

"
read DIVX_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $DIVX_NUMBER ]] ; then
    # If no file passed, default to 3
    DIVX="-ffourcc DX50"
fi
###### preset
if [[ $DIVX_NUMBER = 1 ]] ; then
    DIVX=
fi
if [[ $DIVX_NUMBER = 2 ]] ; then
    DIVX="-ffourcc DIVX"
fi
if [[ $DIVX_NUMBER = 3 ]] ; then
    DIVX="-ffourcc DX50"
fi
fi
####################### Conversion is starting
###### conversion is starting message
if [[ $Q != 22 ]] ; then
read -sn 1 -p "Your conversion is about to begin, press any key to continue..."
fi
###### extra blank space
echo "
"
####################### Conversions
###### preset ######
###### exact copy quality (DVD/ISO sources only)
if [[ $Q = 1 ]] ; then
# If 1 passed, use MPEG exact copy quality
mplayer $INPUT_FILE -dumpstream -dumpfile $OUTPUT_FILE.mpg
fi
if [[ $Q = 2 ]] ; then
# If 2 passed, use MPEG exact copy audio-only quality
mplayer $INPUT_FILE -dumpaudio -dumpfile $OUTPUT_FILE.ac3
fi
###### very high quality
if [[ $Q = 3 ]] ; then
# very high H.264 quality (2-pass)
# actual two-pass conversion
mencoder $INPUT_FILE -nosound -ovc x264 -x264encopts pass=1:subq=1:partitions=all:8x8dct:me=umh:frameref=1:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=2000 -vf pp=de,pullup,softskip,harddup,crop=${CROP_VALUES} $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=192:vol=3 -ovc x264 -x264encopts pass=2:subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=2000 -vf pp=de,pullup,softskip,harddup,crop=${CROP_VALUES} $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 4 ]] ; then
# very high MPEG4 quality (2-pass)
# actual two-pass conversion
mencoder $INPUT_FILE -nosound -ovc lavc $DIVX -lavcopts vpass=1:vcodec=mpeg4:mbd=2:trell:v4mv:last_pred=2:dia=-1:vmax_b_frames=2:vb_strategy=1:cmp=3:subcmp=3:precmp=0:vqcomp=0.6:turbo:vhq:threads=$CPUS:vbitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=192:vol=3 -ovc lavc $DIVX -lavcopts vpass=2:vcodec=mpeg4:mbd=2:mv0:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2:vhq:threads=$CPUS:vbitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 5 ]] ; then
# very high XVID quality (2-pass)
# actual two-pass conversion
mencoder $INPUT_FILE -nosound -ovc xvid -xvidencopts pass=1:chroma_opt:vhq=1:bvhq=1:quant_type=mpeg:threads=$CPUS:bitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=192:vol=3 -ovc xvid -xvidencopts pass=2:chroma_opt:vhq=4:bvhq=1:quant_type=mpeg:threads=$CPUS:bitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 6 ]] ; then
# very high H.264 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=192:vol=3 -ovc x264 -x264encopts subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 7 ]] ; then
# very high MPEG4 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=192:vol=3 -ovc lavc $DIVX -lavcopts vcodec=mpeg4:mbd=2:mv0:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2:vhq:threads=$CPUS:vbitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 8 ]] ; then
# very high XVID quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=192:vol=3 -ovc xvid -xvidencopts chroma_opt:vhq=4:bvhq=1:quant_type=mpeg:threads=$CPUS:bitrate=2000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES} $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### high quality
if [[ $Q = 9 ]] ; then
# high H.264 quality (2-pass)
# actual two-pass conversion
mencoder $INPUT_FILE -nosound -ovc x264 -x264encopts pass=1:subq=1:partitions=all:8x8dct:me=umh:frameref=1:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=-700000 -vf pp=de,pullup,softskip,harddup,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc x264 -x264encopts pass=2:subq=5:8x8dct:frameref=2:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=1200 -vf pp=de,pullup,softskip,harddup,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 10 ]] ; then
# high MPEG4 quality (2-pass)
# actual two-pass conversion
mencoder $INPUT_FILE -nosound -ovc lavc $DIVX -lavcopts vpass=1:vcodec=mpeg4:mbd=2:trell:v4mv:last_pred=2:dia=-1:vmax_b_frames=2:vb_strategy=1:cmp=3:subcmp=3:precmp=0:vqcomp=0.6:turbo:vhq:threads=$CPUS:vbitrate=1100 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc lavc $DIVX -lavcopts vpass=2:vcodec=mpeg4:mbd=2:trell:v4mv:last_pred=2:dia=-1:vmax_b_frames=2:vb_strategy=1:cmp=3:subcmp=3:precmp=0:vqcomp=0.6:turbo:vhq:threads=$CPUS:vbitrate=1100 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 11 ]] ; then
# high XVID quality (2-pass)
# actual two-pass conversion
mencoder $INPUT_FILE -nosound -ovc xvid -xvidencopts pass=1:vhq=1:bvhq=1:chroma_opt:quant_type=mpeg:threads=$CPUS:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc xvid -xvidencopts pass=2:vhq=2:bvhq=1:chroma_opt:quant_type=mpeg:threads=$CPUS:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 12 ]] ; then
# high H.264 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc x264 -x264encopts subq=5:8x8dct:frameref=2:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 13 ]] ; then
# high MPEG4 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc lavc $DIVX -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:last_pred=2:dia=-1:vmax_b_frames=2:vb_strategy=1:cmp=3:subcmp=3:precmp=0:vqcomp=0.6:turbo:vhq:threads=$CPUS:vbitrate=1100 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 14 ]] ; then
# high XVID quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc xvid -xvidencopts vhq=2:bvhq=1:chroma_opt:quant_type=mpeg:threads=$CPUS:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### fast quality
if [[ $Q = 15 ]] ; then
# fast H.264 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc x264 -x264encopts subq=4:8x8dct:bframes=2:b_pyramid=normal:weight_b:threads=auto:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 16 ]] ; then
# fast MPEG4 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc lavc $DIVX -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:turbo:vhq:threads=$CPUS:vbitrate=1100 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 17 ]] ; then
# fast XVID quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc xvid -xvidencopts turbo:vhq=0:threads=$CPUS:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### YouTube quality
if [[ $Q = 18 ]] ; then
# YouTube MPEG4 quality (1-pass)
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc lavc $DIVX -lavcopts vcodec=mpeg4:threads=$CPUS -ffourcc xvid -vf scale=320:-2,expand=:240:::1 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### realtime quality
if [[ $Q = 19 ]] ; then
# realtime MPEG4 quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc lavc $DIVX -lavcopts vcodec=mpeg4:mbd=2:turbo:vhq:threads=$CPUS:vbitrate=1100 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $Q = 20 ]] ; then
# realtime XVID quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts abr:br=128:vol=3 -ovc xvid -xvidencopts turbo:nochroma_me:notrellis:max_bframes=0:vhq=0:threads=$CPUS:bitrate=-700000 -vf pp=de,pullup,softskip,crop=${CROP_VALUES},scale -zoom -xy 624 $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### low quality
if [[ $Q = 21 ]] ; then
# low WMV quality (1-pass)
# actual one-pass conversion
mencoder $INPUT_FILE -oac mp3lame -lameopts cbr:br=16:vol=3 -ovc lavc -lavcopts vcodec=wmv2:vbitrate=100 -vf scale -zoom -xy 240 $FRAME_RATE -o $OUTPUT_FILE.wmv
fi
####################### Custom quality
if [[ $Q = 22 ]] ; then
# If 22 passed, use custom quality (1-pass and 2-pass)
####################### Custom type options
echo -n "What type of AVI do you want to create with custom settings?:

(1)  H.264		(2-Pass)
(2)  H.264		(1-Pass)
(3)  DIVX/MPEG-4	(2-Pass)
(4)  DIVX/MPEG-4	(1-Pass)
(5)  XVID		(2-Pass)
(6)  XVID		(1-Pass)


Press 'Enter' for default (default is '6')...

"
read MPEG4_TYPE
###### extra blank space
echo "
"
###### default ######
if [[ -z $MPEG4_TYPE ]] ; then
    # If no media passed, default to 6
    MPEG4_TYPE=6
fi
####################### Custom Divx ffourcc menu
###### DivX ffourcc menu
if [[ $MPEG4_TYPE != 1 && $MPEG4_TYPE != 2 && $MPEG4_TYPE != 5 && $MPEG4_TYPE != 6 ]] ; then
echo -n "Select the desired Divx or generic MPEG4 quality:

(1) FFMPEG MPEG-4
(2) DivX MPEG-4 Version 4
(3) DivX MPEG-4 Version 5

Press 'Enter' for default (default is '3')...

"
read CUSTOM_DIVX_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $CUSTOM_DIVX_NUMBER ]] ; then
    # If no file passed, default to 3
    CUSTOM_DIVX="-ffourcc DX50"
fi
###### preset
if [[ $CUSTOM_DIVX_NUMBER = 1 ]] ; then
    CUSTOM_DIVX=
fi
if [[ $CUSTOM_DIVX_NUMBER = 2 ]] ; then
    CUSTOM_DIVX="-ffourcc DIVX"
fi
if [[ $CUSTOM_DIVX_NUMBER = 3 ]] ; then
    CUSTOM_DIVX="-ffourcc DX50"
fi
fi
####################### Custom scaling
echo -n "Choose a resolution:

(1)  original resolution(cropped, but no scaling)
(2)  624 x 352 scaling	(fullscreen/widescreen)
(3)  624 x ??? scaling	(fullscreen/widescreen)	(auto-height)
(4)  800 x 600 scaling	(fullscreen)
(5)  800 x ??? scaling	(fullscreen) 		(auto-height)
(6)  600 x 400 scaling	(widescreen)
(7)  600 x ??? scaling	(widescreen) 		(auto-height)
(8)  640 x 480 scaling	(fullscreen)
(9)  640 x ??? scaling	(fullscreen) 		(auto-height)
(10) 704 x 294 scaling	(widescreen) (2.35:1)
(11) 704 x ??? scaling	(widescreen) (2.35:1) 	(auto-height)
(12) 768 x 432 scaling	(widescreen) (16:9)
(13) 768 x ??? scaling	(widescreen) (16:9) 	(auto-height)
(14) custom

Press 'Enter' for default (default is '3')...

"
read SCALING_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $SCALING_NUMBER ]] ; then
    # If no file passed, default to 3
    SCALING="scale -zoom -xy 624"
fi
###### preset
if [[ $SCALING_NUMBER = 1 ]] ; then
    SCALING="scale=${CROP_VALUES}"
fi
if [[ $SCALING_NUMBER = 2 ]] ; then
    SCALING="scale=624:352"
fi
if [[ $SCALING_NUMBER = 3 ]] ; then
    SCALING="scale -zoom -xy 624"
fi
if [[ $SCALING_NUMBER = 4 ]] ; then
    SCALING="scale=800:600"
fi
if [[ $SCALING_NUMBER = 5 ]] ; then
    SCALING="scale -zoom -xy 800"
fi
if [[ $SCALING_NUMBER = 6 ]] ; then
    SCALING="scale=600:400"
fi
if [[ $SCALING_NUMBER = 7 ]] ; then
    SCALING="scale -zoom -xy 600"
fi
if [[ $SCALING_NUMBER = 8 ]] ; then
    SCALING="scale=640:480"
fi
if [[ $SCALING_NUMBER = 9 ]] ; then
    SCALING="scale -zoom -xy 640"
fi
if [[ $SCALING_NUMBER = 10 ]] ; then
    SCALING="scale=704:294"
fi
if [[ $SCALING_NUMBER = 11 ]] ; then
    SCALING="sscale -zoom -xy 704"
fi
if [[ $SCALING_NUMBER = 12 ]] ; then
    SCALING="scale=768:432"
fi
if [[ $SCALING_NUMBER = 13 ]] ; then
    SCALING="scale -zoom -xy 768"
fi
###### custom
if [[ $SCALING_NUMBER = 14 ]] ; then
    echo -n "Please enter a custom scale:  "
    echo -n "...like this: 'scale=800:600' or 'scale -zoom -xy 624'..."
    read CUSTOM_SCALING
    SCALING=$CUSTOM_SCALING
fi
####################### Custom total/video bitrate level
echo -n "Select a total/video bitrate level:

(1)  -350000	(= max file size of ~ 350MB)	(H.264/XVID only)
(2)  -700000	(= max file size of ~ 700MB)	(H.264/XVID only)
(3)  -1000000	(= max file size of ~ 1GB)	(H.264/XVID only)
(4)  400 kbps
(5)  600 kbps
(6)  800 kbps
(7)  1000 kbps
(8)  1100 kbps
(9)  1150 kbps
(10) 1200 kbps
(11) 1250 kbps
(12) 1500 kbps
(13) 2000 kbps
(14) 3000 kbps
(15) 4000 kbps
(16) 5000 kbps
(17) custom

Press 'Enter' for default (default is '2')...

"
read BITRATE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $BITRATE_NUMBER ]] ; then
    # If no file passed, default to 2
    BITRATE=-700000
fi
###### preset
if [[ $BITRATE_NUMBER = 1 ]] ; then
    BITRATE=-350000
fi
if [[ $BITRATE_NUMBER = 2 ]] ; then
    BITRATE=-700000
fi
if [[ $BITRATE_NUMBER = 3 ]] ; then
    BITRATE=-1000000
fi
if [[ $BITRATE_NUMBER = 4 ]] ; then
    BITRATE=400
fi
if [[ $BITRATE_NUMBER = 5 ]] ; then
    BITRATE=600
fi
if [[ $BITRATE_NUMBER = 6 ]] ; then
    BITRATE=800
fi
if [[ $BITRATE_NUMBER = 7 ]] ; then
    BITRATE=1000
fi
if [[ $BITRATE_NUMBER = 8 ]] ; then
    BITRATE=1100
fi
if [[ $BITRATE_NUMBER = 9 ]] ; then
    BITRATE=1150
fi
if [[ $BITRATE_NUMBER = 10 ]] ; then
    BITRATE=1200
fi
if [[ $BITRATE_NUMBER = 11 ]] ; then
    BITRATE=1250
fi
if [[ $BITRATE_NUMBER = 12 ]] ; then
    BITRATE=1500
fi
if [[ $BITRATE_NUMBER = 13 ]] ; then
    BITRATE=2000
fi
if [[ $BITRATE_NUMBER = 14 ]] ; then
    BITRATE=3000
fi
if [[ $BITRATE_NUMBER = 15 ]] ; then
    BITRATE=4000
fi
if [[ $BITRATE_NUMBER = 16 ]] ; then
    BITRATE=5000
fi
###### custom
if [[ $BITRATE_NUMBER = 17 ]] ; then
    echo -n "Please enter a custom total/video bitrate:  "
    echo -n "...like this: '1175'..."
    read CUSTOM_BITRATE
    BITRATE=$CUSTOM_BITRATE
fi
####################### Custom audio track
echo -n "Select an audio track:

(1) -aid 0	(good when getting no audio with others) (ex.: Custom DVD rips)
(2) -aid 127
(3) -aid 128	(often main language non-director's commentary audio track)
(4) -aid 129	(often second track, such as director's commentary)
(5) -aid 130
(6) -aid 131
(7) -aid 132
(8) -aid 160
(9) custom

Press 'Enter' for default (default is 'null', which is DVD default)...

"
read AUDIO_TRACK_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $AUDIO_TRACK_NUMBER ]] ; then
    # If no file passed, default to null
    AUDIO_TRACK=
fi
###### preset
if [[ $AUDIO_TRACK_NUMBER = 1 ]] ; then
    AUDIO_TRACK="-aid 0"
fi
if [[ $AUDIO_TRACK_NUMBER = 2 ]] ; then
    AUDIO_TRACK="-aid 127"
fi
if [[ $AUDIO_TRACK_NUMBER = 3 ]] ; then
    AUDIO_TRACK="-aid 128"
fi
if [[ $AUDIO_TRACK_NUMBER = 4 ]] ; then
    AUDIO_TRACK="-aid 129"
fi
if [[ $AUDIO_TRACK_NUMBER = 5 ]] ; then
    AUDIO_TRACK="-aid 130"
fi
if [[ $AUDIO_TRACK_NUMBER = 6 ]] ; then
    AUDIO_TRACK="-aid 131"
fi
if [[ $AUDIO_TRACK_NUMBER = 7 ]] ; then
    AUDIO_TRACK="-aid 132"
fi
if [[ $AUDIO_TRACK_NUMBER = 8 ]] ; then
    AUDIO_TRACK="-aid 160"
fi
###### custom
if [[ $AUDIO_TRACK_NUMBER = 9 ]] ; then
    echo -n "Please enter a custom audio track:  "
    echo -n "...like this: '-aid 128'..."
    read CUSTOM_AUDIO_TRACK
    AUDIO_TRACK=$CUSTOM_AUDIO_TRACK
fi
####################### Custom audio track language
echo -n "Select an audio track language:

(1)  Chinese - zh
(2)  Dansk (Danish) - da
(3)  Deutsch - de
(4)  English - en
(5)  Español - es
(6)  Français - fr
(7)  Greek - el
(8)  Italiano (Italian) - it
(9)  Japanese - ja
(10) Korean - ko
(11) Nederlands - nl
(12) Polish - pl
(13) Portugues - pt
(14) Russian - ru

Or input your own (like this: 'en')...

Press 'Enter' for default (default is 'null', which is DVD default)...

"
read AUDIO_LANGUAGE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $AUDIO_LANGUAGE_NUMBER ]] ; then
    # If no file passed, default to null
    AUDIO_LANGUAGE=
fi
###### preset
if [[ $AUDIO_LANGUAGE_NUMBER = 1 ]] ; then
    AUDIO_LANGUAGE="-alang zh"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 2 ]] ; then
    AUDIO_LANGUAGE="-alang da"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 3 ]] ; then
    AUDIO_LANGUAGE="-alang de"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 4 ]] ; then
    AUDIO_LANGUAGE="-alang en"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 5 ]] ; then
    AUDIO_LANGUAGE="-alang es"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 6 ]] ; then
    AUDIO_LANGUAGE="-alang fr"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 7 ]] ; then
    AUDIO_LANGUAGE="-alang el"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 8 ]] ; then
    AUDIO_LANGUAGE="-alang it"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 9 ]] ; then
    AUDIO_LANGUAGE="-alang ja"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 10 ]] ; then
    AUDIO_LANGUAGE="-alang ko"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 11 ]] ; then
    AUDIO_LANGUAGE="-alang nl"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 12 ]] ; then
    AUDIO_LANGUAGE="-alang pl"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 13 ]] ; then
    AUDIO_LANGUAGE="-alang pt"
fi
if [[ $AUDIO_LANGUAGE_NUMBER = 14 ]] ; then
    AUDIO_LANGUAGE="-alang ru"
fi
####################### Custom audio bitrate level
echo -n "Select an audio bitrate level:

(1) 48 kbps
(2) 64 kbps
(3) 128 kbps
(4) 160 kbps
(5) 192 kbps
(6) 224 kbps
(7) 256 kbps
(8) 320 kbps
(9) custom

Press 'Enter' for default (default is '3')...

"
read AUDIO_BITRATE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $AUDIO_BITRATE_NUMBER ]] ; then
    # If no file passed, default to 3
    AUDIO_BITRATE=128
fi
###### preset
if [[ $AUDIO_BITRATE_NUMBER = 1 ]] ; then
    AUDIO_BITRATE=48
fi
if [[ $AUDIO_BITRATE_NUMBER = 2 ]] ; then
    AUDIO_BITRATE=96
fi
if [[ $AUDIO_BITRATE_NUMBER = 3 ]] ; then
    AUDIO_BITRATE=128
fi
if [[ $AUDIO_BITRATE_NUMBER = 4 ]] ; then
    AUDIO_BITRATE=160
fi
if [[ $AUDIO_BITRATE_NUMBER = 5 ]] ; then
    AUDIO_BITRATE=192
fi
if [[ $AUDIO_BITRATE_NUMBER = 6 ]] ; then
    AUDIO_BITRATE=224
fi
if [[ $AUDIO_BITRATE_NUMBER = 7 ]] ; then
    AUDIO_BITRATE=256
fi
if [[ $AUDIO_BITRATE_NUMBER = 8 ]] ; then
    AUDIO_BITRATE=320
fi
###### custom
if [[ $AUDIO_BITRATE_NUMBER = 9 ]] ; then
    echo -n "Please enter a custom audio bitrate level:  "
    echo -n "...like this: '100'..."
    read CUSTOM_AUDIO_BITRATE
    AUDIO_BITRATE=$CUSTOM_AUDIO_BITRATE
fi
####################### Custom audio bitrate type
echo -n "Select an audio bitrate type:

(1) Average Bitrate
(2) Constant Bitrate
(3) Variable Bitrate

Press 'Enter' for default (default is '1')...

"
read AUDIO_BITRATE_TYPE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $AUDIO_BITRATE_TYPE_NUMBER ]] ; then
    # If no file passed, default to abr
    AUDIO_BITRATE_TYPE=abr
fi
###### preset
if [[ $AUDIO_BITRATE_TYPE_NUMBER = 1 ]] ; then
    AUDIO_BITRATE_TYPE=abr
fi
if [[ $AUDIO_BITRATE_TYPE_NUMBER = 2 ]] ; then
    AUDIO_BITRATE_TYPE=cbr
fi
if [[ $AUDIO_BITRATE_TYPE_NUMBER = 3 ]] ; then
    AUDIO_BITRATE_TYPE=vbr
fi
####################### Custom audio volume level
echo -n "Select an audio volume increase level (1-10):

Press 'Enter' for default (default is '3')...

"
read AUDIO_VOLUME_LEVEL
###### extra blank space
echo "
"
###### default
if [[ -z $AUDIO_VOLUME_LEVEL ]] ; then
    # If no file passed, default to 3
    AUDIO_VOLUME_LEVEL=3
fi
####################### Subtitles?
echo -n "Do you want subtitles?:

(1) No
(2) Yes (DVD/ISO only)

Press 'Enter' for default (default is '1', for no subtitles)...

"
read SUBTITLE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $SUBTITLE_NUMBER ]] ; then
    # If no file passed, default to null
    SUBTITLE_TRACK=
    SUBTITLE_LANGUAGE=
    SUBTITLE_TYPE=
fi
###### preset
if [[ $SUBTITLE_NUMBER = 1 ]] ; then
    SUBTITLE_TRACK=
    SUBTITLE_LANGUAGE=
    SUBTITLE_TYPE=
fi
if [[ $SUBTITLE_NUMBER = 2 ]] ; then
####################### Custom subtitle track
echo -n "Select a subtitle track:

(1) -sid 0
(2) -sid 1
(3) -sid 2
(4) -sid 3
(5) -sid 4
(6) -sid 5
(7) -sid 6
(8) -sid 7
(9) custom

Press 'Enter' for default (default is 'null')...

"
read SUBTITLE_TRACK_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $SUBTITLE_TRACK_NUMBER ]] ; then
    # If no file passed, default to null
    SUBTITLE_TRACK=
fi
###### preset
if [[ $SUBTITLE_TRACK_NUMBER = 1 ]] ; then
    SUBTITLE_TRACK="-sid 0"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 2 ]] ; then
    SUBTITLE_TRACK="-sid 1"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 3 ]] ; then
    SUBTITLE_TRACK="-sid 2"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 4 ]] ; then
    SUBTITLE_TRACK="-sid 3"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 5 ]] ; then
    SUBTITLE_TRACK="-sid 4"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 6 ]] ; then
    SUBTITLE_TRACK="-sid 5"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 7 ]] ; then
    SUBTITLE_TRACK="-sid 6"
fi
if [[ $SUBTITLE_TRACK_NUMBER = 8 ]] ; then
    SUBTITLE_TRACK="-sid 7"
fi
###### custom
if [[ $SUBTITLE_TRACK_NUMBER = 9 ]] ; then
    echo -n "Please enter a custom subtitles track:  "
    echo -n "...like this: '-sid 10'..."
    read CUSTOM_SUBTITLE_TRACK
    SUBTITLE_TRACK=$CUSTOM_SUBTITLE_TRACK
fi
####################### Custom subtitles track language
echo -n "Select a subtitles track language:

(1)  Chinese - zh
(2)  Dansk (Danish) - da
(3)  Deutsch - de
(4)  English - en
(5)  Español - es
(6)  Français - fr
(7)  Greek - el
(8)  Italiano (Italian) - it
(9)  Japanese - ja
(10) Korean - ko
(11) Nederlands - nl
(12) Polish - pl
(13) Portugues - pt
(14) Russian - ru

Or input your own (like this: 'en')...

Press 'Enter' for default (default is 'null')...

"
read SUBTITLE_LANGUAGE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $SUBTITLE_LANGUAGE_NUMBER ]] ; then
    # If no file passed, default to null
    SUBTITLE_LANGUAGE=
fi
###### preset
if [[ $SUBTITLE_LANGUAGE_NUMBER = 1 ]] ; then
    SUBTITLE_LANGUAGE="-slang zh"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 2 ]] ; then
    SUBTITLE_LANGUAGE="-slang da"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 3 ]] ; then
    SUBTITLE_LANGUAGE="-slang de"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 4 ]] ; then
    SUBTITLE_LANGUAGE="-slang en"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 5 ]] ; then
    SUBTITLE_LANGUAGE="-slang es"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 6 ]] ; then
    SUBTITLE_LANGUAGE="-slang fr"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 7 ]] ; then
    SUBTITLE_LANGUAGE="-slang el"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 8 ]] ; then
    SUBTITLE_LANGUAGE="-slang it"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 9 ]] ; then
    SUBTITLE_LANGUAGE="-slang ja"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 10 ]] ; then
    SUBTITLE_LANGUAGE="-slang ko"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 11 ]] ; then
    SUBTITLE_LANGUAGE="-slang nl"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 12 ]] ; then
    SUBTITLE_LANGUAGE="-slang pl"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 13 ]] ; then
    SUBTITLE_LANGUAGE="-slang pt"
fi
if [[ $SUBTITLE_LANGUAGE_NUMBER = 14 ]] ; then
    SUBTITLE_LANGUAGE="-slang ru"
fi
####################### Subtitle Kind?
echo -n "What kind of subtitles do you prefer?:

(1)  Embed onto the video
(2)  Embed into a separate file

Press 'Enter' for default (default is '1')...

"
read SUBTITLE_TYPE_NUMBER
###### extra blank space
echo "
"
###### default
if [[ -z $SUBTITLE_TYPE_NUMBER ]] ; then
    # If no file passed, default to null
    SUBTITLE_TYPE=
fi
###### preset
if [[ $SUBTITLE_TYPE_NUMBER = 1 ]] ; then
    SUBTITLE_TYPE=
fi
if [[ $SUBTITLE_TYPE_NUMBER = 2 ]] ; then
    SUBTITLE_TYPE="-vobsubout ${OUTPUT_FILE}"
fi
###### closes the preset of 'yes' for subtitles
fi
####################### Custom conversion is starting
###### extra blank space
echo "
"
###### custom conversion is starting message
read -sn 1 -p "Your custom conversion is about to begin, press any key to continue..."
####################### Custom conversions (very high quality settings)
###### custom preset ######
###### H.264
if [[ $MPEG4_TYPE = 1 ]] ; then
# actual two-pass conversion
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -nosound -ovc x264 -x264encopts pass=1:subq=1:partitions=all:8x8dct:me=umh:frameref=1:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=$BITRATE -vf pp=de,pullup,softskip,harddup,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -oac mp3lame -lameopts $AUDIO_BITRATE_TYPE:br=$AUDIO_BITRATE:vol=$AUDIO_VOLUME_LEVEL -ovc x264 -x264encopts pass=2:subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=$BITRATE -vf pp=de,pullup,softskip,harddup,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $MPEG4_TYPE = 2 ]] ; then
# actual one-pass conversion
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -oac mp3lame -lameopts $AUDIO_BITRATE_TYPE:br=$AUDIO_BITRATE:vol=$AUDIO_VOLUME_LEVEL -ovc x264 -x264encopts subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid=normal:weight_b:threads=auto:bitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### MPEG4
if [[ $MPEG4_TYPE = 3 ]] ; then
# actual two-pass conversion
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -nosound -ovc lavc $CUSTOM_DIVX -lavcopts vpass=1:vcodec=mpeg4:mbd=2:trell:v4mv:last_pred=2:dia=-1:vmax_b_frames=2:vb_strategy=1:cmp=3:subcmp=3:precmp=0:vqcomp=0.6:turbo:threads=$CPUS:vbitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -oac mp3lame -lameopts $AUDIO_BITRATE_TYPE:br=$AUDIO_BITRATE:vol=$AUDIO_VOLUME_LEVEL -ovc lavc $CUSTOM_DIVX -lavcopts vpass=2:vcodec=mpeg4:mbd=2:mv0:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2:threads=$CPUS:vbitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $MPEG4_TYPE = 4 ]] ; then
# actual one-pass conversion
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -oac mp3lame -lameopts $AUDIO_BITRATE_TYPE:br=$AUDIO_BITRATE:vol=$AUDIO_VOLUME_LEVEL -ovc lavc $CUSTOM_DIVX -lavcopts vcodec=mpeg4:mbd=2:mv0:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2:threads=$CPUS:vbitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o $OUTPUT_FILE.avi
fi
###### XVID
if [[ $MPEG4_TYPE = 5 ]] ; then
# actual two-pass conversion
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -nosound -ovc xvid -xvidencopts pass=1:chroma_opt:vhq=1:bvhq=1:quant_type=mpeg:threads=$CPUS:bitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o '/dev/null'
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -oac mp3lame -lameopts $AUDIO_BITRATE_TYPE:br=$AUDIO_BITRATE:vol=$AUDIO_VOLUME_LEVEL -ovc xvid -xvidencopts pass=2:chroma_opt:vhq=4:bvhq=1:quant_type=mpeg:threads=$CPUS:bitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o $OUTPUT_FILE.avi
fi
if [[ $MPEG4_TYPE = 6 ]] ; then
# actual one-pass conversion
mencoder $INPUT_FILE $AUDIO_TRACK $AUDIO_LANGUAGE $SUBTITLE_TRACK $SUBTITLE_LANGUAGE $SUBTITLE_TYPE -oac mp3lame -lameopts $AUDIO_BITRATE_TYPE:br=$AUDIO_BITRATE:vol=$AUDIO_VOLUME_LEVEL -ovc xvid -xvidencopts chroma_opt:vhq=4:bvhq=1:quant_type=mpeg:threads=$CPUS:bitrate=$BITRATE -vf pp=de,pullup,softskip,crop=${CROP_VALUES},$SCALING $FRAME_RATE -o $OUTPUT_FILE.avi
fi
####################### Close the custom quality option #17
fi
####################### Cleanup
if [ -f mplayer.tmp ];then
	rm mplayer.tmp
fi
if [ -f divx2pass.log ];then
	rm divx2pass.log
fi
####################### Conversion finished notifications
###### extra blank spaces
echo "
"
###### notifications
notify-send -t 7000 -i /usr/share/icons/gnome/32x32/status/info.png "Conversion Finished" ; espeak "Conversion Finished"
# extra blank spaces
echo "
"
read -sn 1 -p "Your conversion has finished, press any key to continue and close this terminal session..."
}



##################################################
# Rip audio from video				 #
##################################################

###### ("$1" for output file & "$2" for input file)
function audioextract()
{
mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile "$1" "$2"
}



##################################################
# Record audio and use sox to eliminate silence	 #
##################################################

# outputs an ogg file that only contains the audio signal exceeding -45dB
# useful for recording radio scanner

function audiorecord-45dB()
{
rec -r 44100 -p | sox -p "audio_name-$(date '+%Y-%m-%d').ogg" silence -l 1 00:00:00.5 -45d -1 00:00:00.5 -45d
}



##################################################
# Download AUR package using best guess at	 #
# filename					 #
##################################################

function aurget() {
  local DIR=$HOME/Packages
  cd $DIR && wget http://aur.archlinux.org/packages/${1}/${1}.tar.gz
  ls -l
}



##################################################
# ~/ functions					 #
##################################################

function backupsfolder()
{
    if [ -d $HOME/backups_html ]; then
        chown -R $USER:www-data $HOME/backups_html
        chmod 755 $HOME/backups_html
        find $HOME/backups_html/ -type d -exec chmod 775 {} \;
        find $HOME/backups_html/ -type f -exec chmod 664 {} \;
        chmod 755 $HOME
    fi
}



function private()
{
    find $HOME -type d -exec chmod 700 {} \;
    find $HOME -type f -exec chmod 600 {} \;
    find $HOME/bin -type f -exec chmod +x {} \;
    find $HOME/.dropbox-dist/dropbox* -type f -exec chmod +x {} \;
}



function publicfolder()
{
    if [ -d $HOME/public_html ]; then
        chown -R $USER:www-data $HOME/public_html
        chmod 755 $HOME/public_html
        find $HOME/public_html/ -type d -exec chmod 775 {} \;
        find $HOME/public_html/ -type f -exec chmod 664 {} \;
        chmod 755 $HOME
    fi
}



function setperms()
{
    echo "setting proper permissions in ~/"
    private
    public
}



function wwwrc()
{
    alias mv="mv"
    mv -f ~/.[a-z]*.html ~/public_html/
    chmod 644 ~/public_html/.[a-z]*.html
    chown $USER:www-data ~/public_html/.[a-z]*.html
    alias mv="mv -i"
}



##################################################
# Backup .bash* files				 #
##################################################

function backup_bashfiles()
{
  ARCHIVE="$HOME/bash_dotfiles_$(date +%Y%m%d_%H%M%S).tar.gz";
  cd ~
  tar -czvf $ARCHIVE .bash_profile .bashrc .bash_functions .bash_aliases .bash_prompt
  echo "All backed up in $ARCHIVE";
}



##################################################
# Creates a backup of the file passed as	 #
# parameter with the date and time		 #
##################################################

function bak()
{
  cp $1 $1_`date +%H:%M:%S_%d-%m-%Y`
}



##################################################
# Good bash tips for everyone			 #
##################################################

function bashtips() {
# copyright 2007 - 2010 Christopher Bratusek
cat <<EOF
DIRECTORIES
-----------
~-          Previous working directory
pushd tmp   Push tmp && cd tmp
popd        Pop && cd
GLOBBING AND OUTPUT SUBSTITUTION
--------------------------------
ls a[b-dx]e Globs abe, ace, ade, axe
ls a{c,bl}e Globs ace, able
\$(ls)      \`ls\` (but nestable!)
HISTORY MANIPULATION
--------------------
!!        Last command
!?foo     Last command containing \`foo'
^foo^bar^ Last command containing \`foo', but substitute \`bar'
!!:0      Last command word
!!:^      Last command's first argument
!\$       Last command's last argument
!!:*      Last command's arguments
!!:x-y    Arguments x to y of last command
C-s       search forwards in history
C-r       search backwards in history
LINE EDITING
------------
M-d     kill to end of word
C-w     kill to beginning of word
C-k     kill to end of line
C-u     kill to beginning of line
M-r     revert all modifications to current line
C-]     search forwards in line
M-C-]   search backwards in line
C-t     transpose characters
M-t     transpose words
M-u     uppercase word
M-l     lowercase word
M-c     capitalize word
COMPLETION
----------
M-/     complete filename
M-~     complete user name
M-@     complete host name
M-\$    complete variable name
M-!     complete command name
M-^     complete history
EOF
}



##################################################
# Execute a given Linux command on a group of	 #
# files						 #
##################################################

###### Example: batchexec sh ls		# lists all files that have the extension 'sh'
# Example: batchexec sh chmod 755	# 'chmod 755' all files that have the extension 'sh'
function batchexec()
{
find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;
}



##################################################
# Clock - A bash clock that can run in your	 #
# terminal window.				 #
##################################################

###### binary clock
function bclock()
{
watch -n 1 'echo "obase=2;`date +%s`" | bc'
}



###### binary clock
function bclock2()
{
perl -e 'for(;;){@d=split("",`date +%H%M%S`);print"\r";for(0..5){printf"%.4b ",$d[$_]}sleep 1}'
}



function clock()
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}



##################################################
# Appends a '&' to a command so it will run in 	 #
# the background				 #
##################################################

###### useful for aliases
function bg_wrapper()
{
    "$@" &
}



##################################################
# Substitutes underscores for blanks in all the  #
# filenames in a directory			 #
##################################################

function blank_rename()
{
ONE=1                     # For getting singular/plural right (see below).
number=0                  # Keeps track of how many files actually renamed.
FOUND=0                   # Successful return value.
for filename in *         #Traverse all files in directory.
do
     echo "$filename" | grep -q " "         #  Check whether filename
     if [ $? -eq $FOUND ]                   #+ contains space(s).
     then
       fname=$filename                      # Yes, this filename needs work.
       n=`echo $fname | sed -e "s/ /_/g"`   # Substitute underscore for blank.
       mv "$fname" "$n"                     # Do the actual renaming.
       let "number += 1"
     fi
done
if [ "$number" -eq "$ONE" ]                 # For correct grammar.
then
 echo "$number file renamed."
else
 echo "$number files renamed."
fi
}



##################################################
# Bookmarking 					 #
##################################################

###### bookmarking the current directory in 'alias' form
function bookmark() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $1 != "" && $(alias | grep -w go-$1) == "" ]]; then
		echo "alias go-$1='cd $PWD'" >> $HOME/.bookmarks
		. $HOME/.bookmarks
	elif [[ $1 == "" ]]; then
		echo "need name for the bookmark."
	else	echo "bookmark go-$1 already exists."
	fi
}



function unmark() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $(alias | grep -w go-$1= ) != "" ]]; then
		sed -e "/go-$1/d" -i $HOME/.bookmarks
		xunalias go-$1
	fi
}



###### copies/moves files to a bookmarked dir
# cto file1.jpg file2.jpg file3.jpg pics
function cto() {
    eval lastarg=\${$#}
    targetdir=`getBookmark $lastarg`
    echo "Copying files to $targetdir"
    if [ -n "$targetdir" ]; then
        for dir in "$@";
            do
                if [ "$dir" != $lastarg ]; then
                    cp -iv "$dir" "$targetdir"
                fi
            done
    fi
}



# mto vid1.avi vid2.avi videos
function mto() {
    eval lastarg=\${$#}
    targetdir=`getBookmark $lastarg`
    echo "Moving files to $targetdir"
    if [ -n "$targetdir" ]; then
        for dir in "$@";
            do
                if [ "$dir" != $lastarg ]; then
                    mv -iv "$dir" "$targetdir"
                fi
            done
    fi
}



###### Directory Bookmarks for BASH (c) 2009, Ira Chayut, Version 090927
# DirB and its implementation in this file are the product of, and
# copyrighted by Ira Chayut.  You are granted a non-exclusive, royalty-free
# license to use, reproduce, modify and create derivative works from DirB;
# providing that credit is given to DirB as a source material.
# The lastest version is available from: http://www.dirb.info/bashDirB.  Ira can
# be reached at ira@dirb.info.
# By default DirB will have the shell echo the current working directory out
# to the title bars of Xterm windows.  To disable this behavior, comment
# out the next line.
# PS1="\[\033]0;\w\007\]\t \!> "
# If the repository of bookmarks does not exist, create it
if  [ ! -e ~/.DirB ]
then
    mkdir ~/.DirB
fi



###### "d" - Display (or Dereference) a saved bookmark
# to use: cd "$(d xxx)"
function d() {
    # if the bookmark exists, then extract its directory path and print it
    if [ -e ~/.DirB/"$1" ]
    then
        sed -e 's/\$CD //' -e 's/\\//g' ~/.DirB/"$1"

    # if the bookmark does not exists, complain and exit with a failing code
    else
        echo bash: DirB: ~/.DirB/"$1" does not exist >&2
        false
    fi
}



###### "g" - Go to bookmark
function g() {
    # if no arguments, then just go to the home directory
    if [ -z "$1" ]
    then
        cd
    else
        # if $1 is in ~/.DirB and does not begin with ".", then go to it
        if [ -f ~/.DirB/"$1" -a ${1:0:1} != "." ]
        then
            # update the bookmark's timestamp and then execute it
            touch ~/.DirB/"$1" ;
            CD=cd source ~/.DirB/"$1" ;
        # else just do a "cd" to the argument, usually a directory path of "-"
        else
            cd "$1"
        fi
    fi
}



###### "p" - Push a bookmark
function p() {
    # Note, the author's preference is to list the directory stack in a single
    # column.  Thus, the standard behavior of "pushd" and "popd" have been
    # replaced by discarding the normal output of these commands and using a
    # "dirs -p" after each one.

    # if no argument given, then just pushd and print out the directory stack
    if [ -z "$1" ]
    then
        pushd > /dev/null && dirs -p

    # if $1 is a dash, then just do a "popd" and print out the directory stack
    elif [ "$1" == "-" ]
    then
        popd > /dev/null
        dirs -p
    else
        # if $1 is in ~/.DirB and does not begin with ".", then go to it
        # and then print out the directory stack
        if [ -f ~/.DirB/"$1" -a "${1:0:1}" != "." ]
            then
                touch ~/.DirB/$1 ;
                CD=pushd source ~/.DirB/$1 > /dev/null && dirs -p ;

        # else just do a "pushd" and print out the directory stack
        else
            pushd "$1" > /dev/null && dirs -p
        fi
    fi
}



###### "r" - Remove a saved bookmark
function r() {
    # if the bookmark file exists, remove it
    if [ -e ~/.DirB/"$1" ]
    then
        rm ~/.DirB/"$1"

    # if the bookmark file does not exist, complain and exit with a failing code
    else
        echo bash: DirB: ~/.DirB/"$1" does not exist >&2
        false
    fi
}



###### "s" - Save bookmark
function s() {
    if [ -n "$2" ]
    then
        # build the bookmark file with the contents "$CD directory_path"
        ( echo '$CD ' \"$2\" > ~/.DirB/"$1" ;) > /dev/null 2>&1
    else
        # build the bookmark file with the contents "$CD directory_path"
        ( echo -n '$CD ' > ~/.DirB/"$1" ;
          pwd | sed "s/ /\\\\ /g" >> ~/.DirB/"$1" ; ) > /dev/null 2>&1
    fi
    # if the bookmark could not be created, print an error message and
    # exit with a failing return code
    if [ $? != 0 ]
    then
        echo bash: DirB: ~/.DirB/"$1" could not be created >&2
        false
    fi
}



###### "sl" - Saved bookmark Listing
function sl() {
    # if the "-l" argument is given, then do a long listing, passing any
    # remaining arguments to "ls", printing in reverse time order.  Pass the
    # output to "less" to page the output if longer than a screen in length.
    if [ "$1" == "-l" ]
    then
        shift
        ( cd ~/.DirB ;
        ls -lt $* |
            sed -e 's/  */ /g' -e '/^total/d' \
                -e 's/^\(... \)\([0-9] \)/\1 \2/' |
            cut -d ' ' -s -f6- | sed -e '/ [0-9] /s// &/' | less -FX ; )

    # else print the short form of the bookmarks in reverse time order
    else
        ( cd ~/.DirB ; ls -xt $* ; )
    fi
}



###### simple bookmark system
function getBookmark() {
    case "$1" in
    video|vids|vid) echo "~/Videos" ;; # video, vids and vid are shortcuts to use with the functions below, the bookmarked directory is "~/videos"
    images|img|pics|pictures) echo "~/Pictures";;
    *) echo "" ;;
    esac
}



###### list contents of a bookmarked dir without
# going there: list vids
function list() {
    dir=`getBookmark $1`
    echo $dir
    if [ -n "$dir" ]; then
        ls "$dir"
    fi
}



###### same as "list" but with details: llist vids
function llist() {
    dir=`getBookmark $1`
    echo $dir
    if [ -n "$dir" ]; then
        ll "$dir"
    fi
}



##################################################
# Create box of '#' characters around given 	 #
# string					 #
##################################################

function box() { t="$1xxxx";c=${2:-#}; echo ${t//?/$c}; echo "$c $1 $c"; echo ${t//?/$c}; }



##################################################
# Download all videos in your Boxee queue	 #
##################################################

# Gets all videos in your boxee queue with a URL associated with them and attempts to download each using get_flash_videos
function boxeedl()
{
for i in $(curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/object/url | cut -d "=" -f 2,3); do get_flash_videos $i; done
}



##################################################
# Randomness					 #
##################################################

###### This script models Brownian motion:
# random wanderings of tiny particles in fluid, as they are buffeted
# by random currents and collisions (colloquially known as "Drunkard's Walk")
# Author: Mendel Cooper
function brownian()
{
PASSES=500            		#  Number of particle interactions / marbles.
ROWS=10               		#  Number of "collisions" (or horiz. peg rows).
RANGE=3               		#  0 - 2 output range from $RANDOM.
POS=0                 		#  Left/right position.
RANDOM=$$             		#  Seeds the random number generator from PID of script.
declare -a Slots      		# Array holding cumulative results of passes.
NUMSLOTS=21           		# Number of slots at bottom of board.
function Initialize_Slots() { 	# Zero out all elements of the array.
for i in $( seq $NUMSLOTS )
do
  Slots[$i]=0
done
echo                  		# Blank line at beginning of run.
  }
function Show_Slots() {
echo -n " "
for i in $( seq $NUMSLOTS )   	# Pretty-print array elements.
do
  printf "%3d" ${Slots[$i]}   	# Allot three spaces per result.
done
echo 				# Row of slots:
echo " |__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|"
echo "                                ^^"
echo 				#  Note that if the count within any particular slot exceeds 99,
     				#+ it messes up the display.
     				#  Running only(!) 500 passes usually avoids this.
  }
function Move() {              	# Move one unit right / left, or stay put.
  Move=$RANDOM         		# How random is $RANDOM? Well, let's see ...
  let "Move %= RANGE"  		# Normalize into range of 0 - 2.
  case "$Move" in
    0 ) ;;      	        # Do nothing, i.e., stay in place.
    1 ) ((POS--));;     	# Left.
    2 ) ((POS++));;     	# Right.
    * ) echo -n "Error ";;   	# Anomaly! (Should never occur.)
  esac
  }
function Play() {               # Single pass (inner loop).
i=0
while [ "$i" -lt "$ROWS" ]   	# One event per row.
do
  Move
  ((i++));
done
SHIFT=11                     	# Why 11, and not 10?
let "POS += $SHIFT"          	# Shift "zero position" to center.
(( Slots[$POS]++ ))          	# DEBUG: echo $POS
  }
function Run() {                # Outer loop.
p=0
while [ "$p" -lt "$PASSES" ]
do
  Play
  (( p++ ))
  POS=0                      	# Reset to zero. Why?
done
  }
# main()
Initialize_Slots
Run
Show_Slots
}



###### flip a single coin 1000 times and show results
function coin-flip()
{
SEED=$"(head -1 /dev/urandom | od -N 1 | awk '{ print $2 }')"
RANDOM=$SEED
SIDES=2          	# A coin has 2 sides.
MAXTHROWS=1000   	# Increase this if you have nothing better to do with your time.
throw=0         	# Throw count.
heads=0          	# Must initialize counts to zero,
tails=0          	# since an uninitialized variable is null, not zero.
function print_result()
{
echo
echo "heads =   $heads"
echo "tails =   $tails"
echo
}
function update_count()
{
case "$1" in
  0) let "heads += 1";; # Since coin has no "zero", this corresponds to 1.
  1) let "tails += 1";; # And this to 2, etc.
esac
}
echo
while [ "$throw" -lt "$MAXTHROWS" ]
do
  let "coin1 = RANDOM % $SIDES"
  update_count $coin1
  let "throw += 1"
done
print_result
echo "Out of a total of "$MAXTHROWS" tosses."
echo "Change \"MAXTHROWS=1000\" if you want a different number of tosses."
}



###### roll a single die of "$1" sides, just once
# default number of sides is 6
# written by Dallas Vogels
function one-die()
{
function roll_die() {
  # capture parameter
  declare -i DIE_SIDES=$1
  # check for die sides
  if [ ! $DIE_SIDES -gt 0 ]; then
    # default to 6
    DIE_SIDES=6
  fi
  # echo to screen
  echo $[ ( $RANDOM % $DIE_SIDES )  + 1 ]
}
# roll_die 10  # returns 1 to 10 as per 10 sides
# roll_die 2   # returns 1 or 2 as per 2 sides
roll_die "$1"
}



###### select random card from a deck
function pick-card()
{
# This is an example of choosing random elements of an array.
# Pick a card, any card.
Suites="Clubs
Diamonds
Hearts
Spades"
Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"
# Note variables spread over multiple lines.
suite=($Suites)                # Read into array variable.
denomination=($Denominations)
num_suites=${#suite[*]}        # Count how many elements.
num_denominations=${#denomination[*]}
echo -n "${denomination[$((RANDOM%num_denominations))]} of "
echo ${suite[$((RANDOM%num_suites))]}
# $bozo sh pick-cards.sh
# Jack of Clubs
# Thank you, "jipe," for pointing out this use of $RANDOM.
}



###### random number (out of whatever you input)
# example:	random 10	=	4
# copyright 2007 - 2010 Christopher Bratusek
function random() {
	if [[ $1 == -l ]]; then
		echo $(cat /dev/urandom | tr -cd '[:digit:]' | head -c ${2-5})
	elif [[ $1 == -r ]]; then
		echo $((RANDOM%${2}))
	else	echo $((RANDOM%${1}))
	fi
}



###### create random blank files
function randomblanks()
{
for ((  i = 0 ;  i < $1;  i++  )); do touch $RANDOM; done
}



###### random file
# copyright 2007 - 2010 Christopher Bratusek
function randomfile() {
	case $1 in
			*first)
				sed -n '1p' $HOME/.randomhistory
			;;
			*last)
				sed -n '$p' $HOME/.randomhistory
			;;
			*n)
				sed -n "${2}p" $HOME/.randomhistory
			;;
			*l)
				wc -l $HOME/.randomhistory | gawk '{print $1}'
			;;
			*c)
				rm $HOME/.randomhistory
			;;
			*help )
				echo -e "\n${ewhite}Usage:\n"
				echo -e "${eorange}randomfile${ewhite} | ${egreen}--first ${eiceblue}[get the first file in the history]\
				\n${eorange}randomfile${ewhite} | ${egreen}--last ${eiceblue}[get the last file in the history]\
				\n${eorange}randomfile${ewhite} | ${egreen}--n ${eiceblue}[get the NUMBERth file in the history]\
				\n${eorange}randomfile${ewhite} | ${egreen}--l ${eiceblue}[get the number of files in history]\
				\n${eorange}randomfile${ewhite} | ${egreen}--c ${eiceblue}[clear the history]\n" | column -t
				tput sgr0
			;;
			*)
				if [[ ! "$FILES" ]]; then
					files=(*)
				else	files=("$FILES")
				fi
				n=${#files[@]}
				RANDOMFILE="${files[RANDOM % n]}"
				echo "$RANDOMFILE" >> $HOME/.randomhistory
				if [[ ! "$@" ]]; then
					echo "$RANDOMFILE"
				else	"$@" "$RANDOMFILE"
				fi
			;;
	esac
}



###### pulls a random line from text file
function randomline()
{
# AUTHOR: David Ivan Stark (clyphox), clyphox@gmail.com
if [ "$1" ];then  #checking if we were passed a filename/variable
		FileName="$1"  #just an easier variable to work with
		if [ ! -f "$FileName" ];then  #check if it is a file
			echo "Err: $FileName is not a file"
		fi
		#Count how many lines in the file
		LineCount="$(wc -l "$FileName" | cut -f 1 -d ' ')"
		#Dont continue if we have less than 1 line
		if [ "$LineCount" -gt "1" ];then
				#Test past.. selecting random line
				TargetLine=$[ ( $RANDOM % $LineCount )  + 1 ]
				Output="$(sed -n "${TargetLine}p" "$FileName")"
				echo "$Output"
			else
				echo need a file with more than 1 line... cmon...
		fi
	else	#seems we didnt get any input
		echo "Please specify a text file"
fi
}



###### Generates neverending list of random numbers
function randomnumbers()
{
while :
do
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
 echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
done
}



###### Random wallpaper (add whatever wallpaper directory(s) you wish after 'BACKGROUND_DIRS')
function randomwp()
{
cat > "/tmp/randomwp.py" <<"End-of-message"
#!/usr/bin/env python
BACKGROUND_DIRS = ['/usr/share/backgrounds', '~/Pictures/Backgrounds']
EXTENSIONS = ['jpeg', 'jpg', 'bmp', 'png', 'svg']
import os, glob, random, itertools, gconf
files = list(itertools.chain(*[[os.path.join(dirpath, name)
                                for name in filenames]
                               for dirpath, dirnames, filenames in
                               itertools.chain(*[os.walk(os.path.expanduser(d))
                                                 for d in BACKGROUND_DIRS])]))
gconf.client_get_default().set_string(
    '/desktop/gnome/background/picture_filename',
    random.choice(files))
End-of-message
chmod +x "/tmp/randomwp.py"
"/tmp/randomwp.py"
rm "/tmp/randomwp.py"
}



###### automatic wallpaper switcher for Gnome
# Usage: randomwpt "bash directory_name" "timeout_in_seconds"
function randomwpt()
{
if [ $# -ne 2 ];then
	echo -n "Usage: $0 directory_name timeout_in_seconds
	Leave the directory name blank for Current Directory
	For you lazy pal, I assume timeout as 5 sec and Directory as current
	Do you want to accept this settings? (Y/n): ";
	read response
	if [[ "$response" =~ ^[^yY] ]];then
		exit 0
	fi
fi
function set_wallpaper() {
	gconftool-2 -s /desktop/gnome/background/picture_options "centered" -t string;
	gconftool-2 -s /desktop/gnome/background/picture_filename "$1" -t string;
}
TIMEOUT=${2-5};
WALL_DIR=${1-`pwd`};
echo "Timeout value is: $TIMEOUT";
echo "Directory is: $WALL_DIR";
echo
if [ ! -d "$WALL_DIR" ];then
	echo "The Directory Specified is invalid..";
	exit 1;
fi
filelst="$(find "$WALL_DIR" -type f -name '*.jpg' -o -name '*.png')";
if [ -z "$filelst" ];then
	echo "No Suitable files found in this location: $WALL_DIR";
	exit 1;
fi
while true;do
	filename=`echo "$filelst" | shuf -n 1`
	set_wallpaper "$filename";
	sleep $TIMEOUT;
done
}



###### roll a single die 1000 times and show results
function roll-die()
{
SEED=$"(head -1 /dev/urandom | od -N 1 | awk '{ print $2 }')"
RANDOM=$SEED
PIPS=6          	# A die has 6 pips.
MAXTHROWS=1000   	# Increase this if you have nothing better to do with your time.
throw=0         	# Throw count.
ones=0          	#  Must initialize counts to zero,
twos=0          	#+ since an uninitialized variable is null, not zero.
threes=0
fours=0
fives=0
sixes=0
function print_result()
{
echo
echo "ones =   $ones"
echo "twos =   $twos"
echo "threes = $threes"
echo "fours =  $fours"
echo "fives =  $fives"
echo "sixes =  $sixes"
echo
}
function update_count()
{
case "$1" in
  0) let "ones += 1";;   # Since die has no "zero", this corresponds to 1.
  1) let "twos += 1";;   # And this to 2, etc.
  2) let "threes += 1";;
  3) let "fours += 1";;
  4) let "fives += 1";;
  5) let "sixes += 1";;
esac
}
echo
while [ "$throw" -lt "$MAXTHROWS" ]
do
  let "die1 = RANDOM % $PIPS"
  update_count $die1
  let "throw += 1"
done
print_result
echo "Out of a total of "$MAXTHROWS" rolls."
echo "Change \"MAXTHROWS=1000\" if you want a different number of rolls."
}



##################################################
# Backup a file with a date-time stamp		 #
##################################################

# Usage "bu filename.txt"
function bu() { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }



function buf() { cp -v $1 ${1/${1%%.*}/$f-$(date +"%Y%m%d_%H%M%S")}; }



##################################################
# Extract a file and cd into the new folder	 #
##################################################

function build()
{
   extract "$1" && cd
}



##################################################
# Needs fixing					 #
##################################################

function build_() {
args=($@)
args[0]=
reset
tcc -o $1 ${1}.c ${args[@]}
if [ $? -eq 0 ]; then
./$1;
fi
}



##################################################
# Buffer in order to avoir mistakes with 	 #
# redirections that empty your files		 #
##################################################

function buffer() { tty -s && return; tmp=$(mktemp); cat > "${tmp}"; if [ -n "$1" ] && ( ( [ -f "$1" ] && [ -w "$1" ] ) || ( ! [ -a "$1" ] && [ -w "$(dirname "$1")" ] ) ); then mv -f "${tmp}" "$1"; else echo "Can't write in \"$1\""; rm -f "${tmp}"; fi }



##################################################
# Generate a case-insensitive pattern		 #
##################################################

function casepat() { perl -pe 's/([a-zA-Z])/sprintf("[%s%s]",uc($1),$1)/ge' ; }



##################################################
# Concatenate PDF files				 #
##################################################

###### e.g. cat_pdfs -o combined.pdf file1.pdf file2.pdf file3.pdf
function cat_pdfs() { python '/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py' "$@" ; }



##################################################
# Copy & paste files and folders from the	 #
# command line					 #
##################################################

###### Usage: "ccopy FILE/FOLDER#1 FILE/FOLDER#2 FILE/FOLDER#3 FILE/FOLDER#4 ..."
# Note: You must 'cd' into the folder first ("whatever" works, while "~/myfolder/whatever" doesn't)
function ccopy() { for i in $*; do cp -a $i /tmp/ccopy.$i; done }
alias cpaste="ls -d /tmp/ccopy* | sed 's|[^\.]*.\.||' | xargs -I % mv /tmp/ccopy.% ./%"



##################################################
# Print working directory after a cd.		 #
##################################################

# function cd() {
#     if [[ $@ == '-' ]]; then
#         builtin cd "$@" > /dev/null  # We'll handle pwd.
#     else
#         builtin cd "$@"
#     fi
#     echo -e "   \033[1;30m"`pwd`"\033[0m"
# }



##################################################
# Change directory and list files		 #
##################################################

function cds() {
    # only change directory if a directory is specified
    [ -n "${1}" ] && cd $1
    lls
}



##################################################
# Grep, grep, grep				 #
##################################################

###### randomize GNU grep's colors 31-36 excluding black and white.
function cgrep() { GREP_COLOR="1;3$((RANDOM%6+1))" grep --color=always "$@" ; }



###### to grep through files found by find, e.g. grepf pattern '*.c'
# note that 'grep -r pattern dir_name' is an alternative if want all files
function grepfind() { find . -type f -name "$2" -print0 | xargs -0 grep "$1" ; }



###### to grep through the /usr/include directory
function grepincl() { (cd /usr/include; find . -type f -name '*.h' -print0 | xargs -0 grep "$1" ) ; }



###### hgrep, hgrepl (I use these so much I miss them not being on my other machines and should copy them over)
function hgrepl() {
history | sed s/.*\ \ // | grep $@
}



function hgrep() {
history | sed s/.*\ \ // | grep $@ | tail -n 30
}



function hhgrep() {
history | egrep "$@" | egrep -v "hgrep $@"
}



##################################################
# Analyze your bash usage			 #
##################################################

function check_()
{
cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30
}



##################################################
# Checksum					 #
##################################################

function checksum()
# copyright 2007 - 2010 Christopher Bratusek
{
	action=$1
	shift
	if [[ ( $action == "-c" || $action == "--check" ) && $1 == *.* ]]; then
		type="${1/*./}"
	else	type=$1
		shift
	fi
	case $type in
		md5 )
			checktool=md5sum
		;;
		sha1 | sha )
			checktool=sha1sum
		;;
		sha224 )
			checktool=sha224sum
		;;
		sha256 )
			checktool=sha256sum
		;;
		sha384 )
			checktool=sha384sum
		;;
		sha512 )
			checktool=sha512sum
		;;
	esac
	case $action in
		-g | --generate )
			for file in "${@}"; do
				$checktool "${file}" > "${file}".$type
			done
		;;
		-c | --check )
			for file in "${@}"; do
				if [[ "${file}" == *.$type ]]; then
					$checktool --check "${file}"
				else	$checktool --check "${file}".$type
				fi
			done
		;;
		-h | --help )
		;;
	esac
}



###### MD5 checksum
function md5()
{
    echo -n $@ | md5sum
}



###### Encode a string in md5 hash of 32 characters
# You can short the length with the second parameter.
#  @param string $1 string (required)
#  @param integer $2 length (option, default: 32)
#  @return string
#  @example:    md5 "Hello World" 8
function md5_() {
      local length=${2:-32}
      local string=$( echo "$1" | md5sum | awk '{ print $1 }' )
      echo ${string:0:${length}}
}



##################################################
# Mount/unmount CIFS shares; pseudo-		 #
# replacement for smbmount			 #
##################################################

######   $1 = remote share name in form of //server/share
#   $2 = local mount point
function cifsmount() { sudo mount -t cifs -o username=${USER},uid=${UID},gid=${GROUPS} $1 $2; }



function cifsumount() { sudo umount $1; }



##################################################
# Network information and IP address stuff	 #
##################################################

###### clear iptables rules safely
function clearIptables()
{
iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT; iptables -F; iptables -X; iptables -L
}



###### find an unused unprivileged TCP port
function findtcp()
{
(netstat  -atn | awk '{printf "%s\n%s\n", $4, $4}' | grep -oE '[0-9]*$'; seq 32768 61000) | sort -n | uniq -u | head -n 1
}



###### geoip lookup (need geoip database: sudo apt-get install geoip-bin)
function geoip() {
geoiplookup $1
}



###### geoip information
# requires 'html2text': sudo apt-get install html2text
function geoiplookup() { curl -A "Mozilla/5.0" -s "http://www.geody.com/geoip.php?ip=$1" | grep "^IP.*$1" | html2text; }



###### get IP address of a given interface
# Example: getip lo
# Example: getip eth0	# this is the default
function getip()		{ lynx -dump http://whatismyip.org/; }



###### display private IP
function ippriv()
{
    ifconfig eth0|grep "inet adr"|awk '{print $2}'|awk -F ':' '{print $2}'
}



###### ifconfig connection check
function ips()
{
    if [ "$OS" = "Linux" ]; then
        for i in $( /sbin/ifconfig | grep ^e | awk '{print $1}' | sed 's/://' ); do echo -n "$i: ";  /sbin/ifconfig $i | perl -nle'/dr:(\S+)/ && print $1'; done
    elif [ "$OS" = "Darwin" ]; then
        for i in $( /sbin/ifconfig | grep ^e | awk '{print $1}' | sed 's/://' ); do echo -n "$i: ";  /sbin/ifconfig $i | perl -nle'/inet (\S+)/ && print $1'; done
    fi
}



###### geolocate a given IP address
function ip2loc() { wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g'; }



function ip2locall() {
# best if used through a proxy, as ip2loc's free usage only lets you search a maximum of 20 times per day
# currently set on using a proxy through tor; if don't want that, just comment out the two 'export..' and 'unset...' lines
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'
echo ""
echo "Country:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Region (State, Province, Etc.):"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIRegion\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "City:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICity\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Latitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILatitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Longitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILongitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "ZIP Code:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIZIPCode\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Time Zone:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblITimeZone\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Net Speed:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblINetSpeed\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "ISP:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIISP\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Domain:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIDomain\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "IDD Code:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIIDDCode\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Area Code:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIAreaCode\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Weather Station:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIWeatherStation\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "MCC:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIMCC\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "MNC:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIMNC\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Mobile Brand:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIMobileBrand\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
unset http_proxy
unset https_proxy
}



function ip2locate() {
# best if used through a proxy, as ip2loc's free usage only lets you search a maximum of 20 times per day
# currently set on using a proxy through tor; if don't want that, just comment out the two 'export..' and 'unset...' lines
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'
echo ""
echo "Country:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Region (State, Province, Etc.):"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIRegion\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "City:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICity\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Latitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILatitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Longitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILongitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
unset http_proxy
unset https_proxy
}



###### myip - finds your current IP if your connected to the internet
function myip()
{
lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}



###### netinfo - shows network information for your system
function netinfo()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}



###### check whether or not a port on your box is open
function portcheck() { for i in $@;do curl -s "deluge-torrent.org/test-port.php?port=$i" | sed '/^$/d;s/<br><br>/ /g';done; }



###### show ip
# copyright 2007 - 2010 Christopher Bratusek
function show_ip()
{
	case $1 in
		*help | "" )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_ip${ewhite} |${egreen} <interface> ${eiceblue}[show ip-address for <interface>]\
			\n${eorange}show_ip${ewhite} |${egreen} external${eiceblue} [show external ip address]\n"
			tput sgr0
		;;
		*external )
			wget -q -O - http://showip.spamt.net/
		;;
		* )
			LANG=C /sbin/ifconfig $1 | grep 'inet addr:' | cut -d: -f2 | gawk '{ print $1}'
		;;
	esac
}



###### display the ttl of a hostname in a human readable form
function ttl()
{
/usr/sbin/timetrans -count $(dig +noquestion +noadditional +noauthority $1 | grep "^$1" | awk '{print $2}')
}



###### show Url information
# Usage:	url-info "ur"
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# Modified by Silviu Silaghi (http://docs.opensourcesolutions.ro) to handle
# more ip adresses on the domains on which this is available (eg google.com or yahoo.com)
# Last updated on Sep/06/2010
function url-info()
{
doms=$@
if [ $# -eq 0 ]; then
echo -e "No domain given\nTry $0 domain.com domain2.org anyotherdomain.net"
fi
for i in $doms; do
_ip=$(host $i|grep 'has address'|awk {'print $4'})
if [ "$_ip" == "" ]; then
echo -e "\nERROR: $i DNS error or not a valid domain\n"
continue
fi
ip=`echo ${_ip[*]}|tr " " "|"`
echo -e "\nInformation for domain: $i [ $ip ]\nQuerying individual IPs"
 for j in ${_ip[*]}; do
echo -e "\n$j results:"
whois $j |egrep -w 'OrgName:|City:|Country:|OriginAS:|NetRange:'
done
done
}



###### cleanly list available wireless networks (using iwlist)
function wscan()
{
iwlist wlan0 scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p'
}



##################################################
# Commandlinefu.com and Shell-fu.org stuff	 #
##################################################

###### Search commandlinefu.com from the command line
# using the API
# Usage: cmdfu hello world
function cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; }



###### automatically downloads all commands from http://www.commandlinefu.com into a single text file
alias cmdfu_dl='mkdir /tmp/commandlinefu && cd /tmp/commandlinefu && curl -O http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2400:25] && ls -1 | sort -n | while read mork ; do cat $mork >> commandlinefu.txt ; ls -ald $mork; done && mv commandlinefu.txt $HOME && rm -rf /tmp/commandlinefu'



###### find a CommandlineFu users average command rating
function cmdfu_rating()
{
wget -qO- www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/class="num-votes"/{S+=$2; I++}END{print S/I}'
}



function cmdfu_rating_()
{
curl -s www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/class="num-votes"/{S+=$2; I++}END{print S/I}'
}



##### key binding to search commandlinefu.com
function ds_() { echo -n "search : "; read ST; EST=`php -r "echo rawurlencode('$ST');"`; B64=`echo -n $ST| openssl enc -base64`; curl -s "http://www.commandlinefu.com/commands/matching/$EST/$B64/plaintext" | less -p "$ST"; } ; bind '"\C-k"':"\"ds\C-m\""



###### command examples from shell-fu
function examples() { lynx -width=$COLUMNS -nonumbers -dump "http://www.shell-fu.org/lister.php?tag=$1" | \
sed -n '/^[a-zA-Z]/,$p' | egrep -v '^http|^javas|View Comm|HIDE|] \+|to Share|^ +\*|^ +[HV][a-z]* l|^ .*efu.*ep.*!$' | \
sed -e '/^  *__*/N;s/\n$//g' | less -r; }



###### fuman, an alternative to the 'man' command that shows commandlinefu.com examples
function fuman() { lynx -width=$COLUMNS -nonumbers -dump "http://www.commandlinefu.com/commands/using/$1" |sed '/Add to favourites/,/This is sample output/!d' |sed 's/ *Add to favourites/----/' |less -r; }



###### Random Commandlinefu command
function fur() { curl -sL 'http://www.commandlinefu.com/commands/random/plaintext' | grep -v "^# commandlinefu" ; }



###### Prepare a commandlinefu command
function goclf()
{
type "$1" | sed '1d' | tr -d "\n" | tr -s '[:space:]'; echo
}



##################################################
# What package does that command come from?	 #
##################################################

function cmdpkg() { PACKAGE=$(dpkg -S $(which $1) | cut -d':' -f1); echo "[${PACKAGE}]"; dpkg -s "${PACKAGE}" ;}



##################################################
# Sets custom Catalog Number ID3 tag for all	 #
# MP3 files in current directory		 #
##################################################

###### $1 = catalog number
function cn() { for i in *.mp3; do id3v2 --TXXX "Catalog Number":"$1" "$i"; done; }



##################################################
# Quick reference color charts	& color stuff 	 #
##################################################

###### shows a gui color chart (requires python-gtkmozembed:
# sudo apt-get install python-gtkmozembed
function color-picker()
{
echo "When you are finished, press "Control C" to continue..."
cat > "/tmp/color-picker.py" <<"End-of-message"
#!/usr/bin/python
import os
import pygtk
pygtk.require('2.0')
import gtk
import gtkmozembed
homedir = os.path.expanduser('~')
try:
    from win32com.shell import shellcon, shell
    homedir = shell.SHGetFolderPath(0, shellcon.CSIDL_APPDATA, 0, 0)
except ImportError:
    homedir = os.path.expanduser("~/.gnome2/nautilus-scripts/.colorchart/view.html")
class ColorChart:
	def __init__(self):
                self.moz = gtkmozembed.MozEmbed()
		box = gtk.VBox(False,0)
		win = gtk.Window()
		win.add(box)
		hbox = gtk.HBox(False,0)
                box.pack_start(hbox,False,False)
                hbox.show()
		box.pack_start(self.moz,True,True,0)
                self.moz.show()
		self.moz.load_url(homedir)
                self.moz.set_size_request(650,550)
		title=self.moz.get_title()
		win.set_title("RGB/HEX Color Picker")
		win.show_all()
if __name__ == "__main__":
	ColorChart()
	gtk.main()
End-of-message
chmod +x "/tmp/color-picker.py"
/usr/bin/python "/tmp/color-picker.py"
rm "/tmp/color-picker.py"
}



###### takes a name of a color and some text and then echoes out the text in the named color
# Usage:	colorize_text "color" "whatever text"
function colorize-text()
{
b='[0;30m'
# Implement command-line options
while getopts "nr" opt
 do
  case $opt in
   n  )  o='-n' ;;
   r  )  b=''   ;;
  esac
 done
shift $(($OPTIND - 1))
# Set variables
col=$1
shift
text="$*"
# Set a to console color code
case $col in
 'black'  ) a='[0;30m' ;;
 'blue'   ) a='[0;34m' ;;
 'green'  ) a='[0;32m' ;;
 'cyan'   ) a='[0;36m' ;;
 'red'    ) a='[0;31m' ;;
 'purple' ) a='[0;35m' ;;
 'brown'  ) a='[0;33m' ;;
 'ltgray' ) a='[0;37m' ;;
 'white'  ) a='[1;30m' ;;
 'ltblue' ) a='[1;34m' ;;
 'ltgreen') a='[1;32m' ;;
 'ltcyan' ) a='[1;36m' ;;
 'ltred'  ) a='[1;31m' ;;
 'pink'   ) a='[1;35m' ;;
 'yellow' ) a='[1;33m' ;;
 'gray'   ) a='[1;37m' ;;
esac
# Display text in designated color, no newline
echo -en "\033$a$text"
# If 'b' switch not on, restore color to black
if [ -n $b ]
 then
  echo -en "\033$b"
fi
# If 'n' switch on, do not display final newline
# otherwise output newline
echo $o
}



###### shows the colors in a kewl way...partially stolen from HH
function colors()
{
       # Display ANSI colours.
    esc="\033["
    echo -e "\t  40\t   41\t   42\t    43\t      44       45\t46\t 47"
    for fore in 30 31 32 33 34 35 36 37; do
        line1="$fore  "
        line2="    "
        for back in 40 41 42 43 44 45 46 47; do
            line1="${line1}${esc}${back};${fore}m Normal  ${esc}0m"
            line2="${line2}${esc}${back};${fore};1m Bold    ${esc}0m"
        done
        echo -e "$line1\n$line2"
    done
    echo ""
    echo "# Example:"
    echo "#"
    echo "# Type a Blinkin TJEENARE in Swedens colours (Yellow on Blue)"
    echo "#"
    echo "#           ESC"
    echo "#            |  CD"
    echo "#            |  | CD2"
    echo "#            |  | | FG"
    echo "#            |  | | |  BG + m"
    echo "#            |  | | |  |         END-CD"
    echo "#            |  | | |  |            |"
    echo "# echo -e '\033[1;5;33;44mTJEENARE\033[0m'"
    echo "#"
    echo "# Sedika Signing off for now ;->"
}



###### displays all 256 possible background colors, using ANSI escape sequences.
# author: Chetankumar Phulpagare
# used in ABS Guide with permission.
function colors2()
{
T1=8
T2=6
T3=36
offset=0
for num1 in {0..7}
do {
   for num2 in {0,1}
       do {
          shownum=`echo "$offset + $T1 * ${num2} + $num1" | bc`
          echo -en "\E[0;48;5;${shownum}m color ${shownum} \E[0m"
          }
       done
   echo
   }
done
offset=16
for num1 in {0..5}
do {
   for num2 in {0..5}
       do {
          for num3 in {0..5}
              do {
                 shownum=`echo "$offset + $T2 * ${num3} \
                 + $num2 + $T3 * ${num1}" | bc`
                 echo -en "\E[0;48;5;${shownum}m color ${shownum} \E[0m"
                 }
               done
          echo
          }
       done
}
done
offset=232
for num1 in {0..23}
do {
   shownum=`expr $offset + $num1`
   echo -en "\E[0;48;5;${shownum}m ${shownum}\E[0m"
}
done
echo
}



###### print all 256 colors for testing TERM or for a quick reference
# show numerical values for each of the 256 colors in bash
function colors2nums()
{
for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}



###### replaces a color in PDF document (useful for removing dark background for printing)
# usage:	remove_color input.pdf output.pdf
function uncolorpdf()
{
convert -density 300 "$1" -fill "rgb(255,255,255)" -opaque "rgb(0,0,0)" "$2"
}



##################################################
# View daily comics (set on Viewnior as image	 #
# viewer...can use 'eog' or whatever instead)	 #
##################################################

function comics() {
	# xkcd
	XKCD_FILE="/tmp/xkcd"
	wget -q $(curl -s http://xkcd.com/ | sed -n 's/<h3>Image URL.*: \(.*\)<\/h3>/\1/p') -O $XKCD_FILE
	# Geek and Poke
	GAP_FILE="/tmp/geekandpoke"
	wget -q $(lynx --dump 'http://geekandpoke.typepad.com/' | grep '\/.a\/' | grep '\-pi' | head -n 1 | awk '{print $2}') -O $GAP_FILE
	viewnior $XKCD_FILE
	viewnior $GAP_FILE
}



##################################################
# Install and run when a command is not found	 #
##################################################

# function command_not_found_handle() { apt-get install $( apt-file search "$1" | grep bin | grep -w "$1" | head -n1 | cut -d ':' -f 1 ) && $* ; }



##################################################
# Computer the speed of two commands		 #
##################################################

function comp() { # compare the speed of two commands (loop $1 times)
  if [[ $# -ne 3 ]] ; then return 1 ; fi
  echo -n 1
  time for ((i=0;i<$1;i++)) ; do $2 ; done >/dev/null 2>&1
  echo -n 2
  time for ((i=0;i<$1;i++)) ; do $3 ; done >/dev/null 2>&1
}



##################################################
# Convert to avi				 #
##################################################

function conv2avi() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $(which mencoder-mt) != "" ]]; then
	mencoder-mt "$1" -lavdopts threads=8 \
	  -ovc xvid -xvidencopts fixed_quant=4 -of avi \
	  -oac mp3lame -lameopts vbr=3 \
	  -o "$1".avi
	else
	mencoder "$1" -lavdopts \
	  -ovc xvid -xvidencopts fixed_quant=4 -of avi \
	  -oac mp3lame -lameopts vbr=3 \
	  -o "$1".avi
	fi
}



##################################################
# Get name of app that created a corefile	 #
##################################################

function corename()
{
    for file ; do
        echo -n $file : ; gdb --core=$file --batch | head -1
    done
}



##################################################
# Count opening and closing braces in a string	 #
##################################################

function countbraces() { COUNT_OPENING=$(echo $1 | grep -o "(" | wc -l); COUNT_CLOSING=$(echo $1 | grep -o ")" | wc -l); echo Opening: $COUNT_OPENING; echo Closing: $COUNT_CLOSING; }



##################################################
# Count files in current directory		 #
##################################################

function count_files()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*+h)
			echo $(($(ls --color=no -1 -la . | grep -v ^l | wc -l)-1))
		;;
		*-h)
			echo $(($(ls --color=no -1 -l . | grep -v ^l | wc -l)-1))
		;;
		*+d)
			echo $(($(ls --color=no -1 -la . | grep -v ^- | wc -l)-1))
		;;
		*-d)
			echo $(($(ls --color=no -1 -l . | grep -v ^- | wc -l)-1))
		;;
		*+f)
			echo $(($(ls --color=no -1 -la . | grep -v ^d | wc -l)-1))
		;;
		*-f)
			echo $(($(ls --color=no -1 -l . | grep -v ^d | wc -l)-1))
		;;
		*)
			echo -e "\n${ewhite}Usage:"
			echo -e "\n${eorange}count_files${ewhite} | ${egreen}+h ${eiceblue}[count files and folders - include hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}-h ${eiceblue}[count files and folders - exclude hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}+d ${eiceblue}[count folders - include hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}-d ${eiceblue}[count folders - exclude hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}+f ${eiceblue}[count files - include hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}-f ${eiceblue}[count files - exclude hidden ones]\n"
			tput sgr0
		;;
	esac
}



##################################################
# Count processes that are running		 #
##################################################

function count_processes()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:"
			echo -e "\n${eorange}count_processes${ewhite} | ${egreen}! no options !\n"
			tput sgr0
		;;
		* )
			procs=$(ps ax | wc -l | awk '{print $1}')
			if [[ $procs -lt 10 ]]; then
				echo "000$procs"
			elif [[ $procs -lt 100 ]]; then
				echo "00$procs"
			elif [[ $procs -lt 1000 ]]; then
				echo "0$procs"
			fi
		;;
	esac
}



##################################################
# Copies currently played song in Audacious to 	 #
# selected directory				 #
##################################################

function cp_mp3_to() { PID=`pidof audacious2`; FILEPATH=`lsof -p $PID| grep mp3| sed s/[^\/]*//`; cp "$FILEPATH" "$1"; }



##################################################
# Cp with progress bar (using pv)		 #
##################################################

function cp_p() {
	if [ `echo "$2" | grep ".*\/$"` ]
	then
		pv "$1" > "$2""$1"
	else
		pv "$1" > "$2"/"$1"
	fi
}



##################################################
# Encryption / decryption			 #
##################################################

###### do twice to decrypt
# copyright 2007 - 2010 Christopher Bratusek
function crypt() {
	if [[ -e "$1" ]]; then
		tr a-zA-Z n-za-mN-ZA-M < "$1" > "$1".crypt
		rm -f "$1"
		mv "$1".crypt "$1"
	fi
}



###### basic encrypt / decrypt
# example: "encry filename" or "decry filename"
function encry()
{
gpg -ac --no-options "$1"
}



function decry()
{
gpg --no-options "$1"
}



###### More advanced encryption / decryption
# example: "encrypt filename" or "decrypt filename"
function encrypt()
{
# Author: Martin Langasek <cz4160@gmail.com>
case $LANG in
  cs* )
    err_title="Chyba"
    err_files="Neoznačen soubor"
    encrypt="Šifrovat"
    decrypt="Dešifrovat"
    file_msg="soubor:"
    pass_msg="Vložte heslo";;
  * )
    err_title="Error"
    err_files="No file selected"
    encrypt="Encrypt"
    decrypt="Decrypt"
    file_msg="file:"
    pass_msg="Enter passphrase";;
esac
if [ "$1" != "" ]
then
  i=1
  file=`echo "$1" | sed ''$i'!d'`
  while [ "$file" != "" ]
  do
    ext=`echo "$file" | grep [.]gpg$ 2>&1`
    if [ "$ext" != "" ]
    then
      pass_decrypt=`zenity --entry --entry-text "$pass_decrypt" --hide-text --title "$pass_msg" --text "$decrypt $file_msg ${file##*/}" "" 2>&1`
      if [ "$pass_decrypt" != "" ]
      then
        output=${file%.*}
        echo "$pass_decrypt" | gpg -o "$output" --batch --passphrase-fd 0 -d "$file"
      fi
    else
      pass_encrypt=`zenity --entry --hide-text --entry-text "$pass_encrypt" --title "$pass_msg" --text "$encrypt $file_msg ${file##*/}" "" 2>&1`
      if [ "$pass_encrypt" != "" ]
      then
        echo "$pass_encrypt" | gpg --batch --passphrase-fd 0 --cipher-algo aes256 -c "$file"
      fi
    fi
    i=$(($i+1))
    file=`echo "$1" | sed ''$i'!d'`
  done
else
  zenity --error --title "$err_title" --text "$err_files"
fi
}



alias decrypt='encrypt'



###### rot13 ("rotate alphabet 13 places" Caesar-cypher encryption)
function rot13()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "Seriously?  You don't know what rot13 does?"
    else
        echo $@ | tr A-Za-z N-ZA-Mn-za-m
    fi
}



###### rot47 ("rotate ASCII characters from '!" to '~' 47 places" Caesar-cypher encryption)
function rot47()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "Seriously?  You don't know what rot47 does?"
    else
        echo $@ | tr '!-~' 'P-~!-O'
    fi
}



##################################################
# Google searching				 #
##################################################

###### convert currencies
# usage:	currency_convert 1 usd eur
# for currency shorthand: http://www.xe.com/currency/
function currency_convert() { wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3&hl=es" | sed '/res/!d;s/<[^>]*>//g'; }



function currency_convert_() { curl "http://www.xe.com/wap/2co/convert.cgi?Amount=$1&From=$2&To=$3" -A "Mozilla" -s | sed -n "s/.*>\(.*\) $3<.*/\1/p"; }



function currency_convert_help() {
cat <<EOF
AED - Emirati Dirham
AFN - Afghan Afghani
ALL - Albanian Lek
AMD - Armenian Dram
ANG - Dutch Guilder
AOA - Angolan Kwanza
ARS - Argentine Peso
AUD - Australian Dollar
AWG - Aruban or Dutch Guilder
AZN - Azerbaijani New Manat
BAM - Bosnian Convertible Marka
BBD - Barbadian or Bajan Dollar
BDT - Bangladeshi Taka
BGN - Bulgarian Lev
BHD - Bahraini Dinar
BIF - Burundian Franc
BMD - Bermudian Dollar
BND - Bruneian Dollar
BOB - Bolivian Boliviano
BRL - Brazilian Real
BSD - Bahamian Dollar
BTN - Bhutanese Ngultrum
BWP - Batswana Pula
BYR - Belarusian Ruble
BZD - Belizean Dollar
CAD - Canadian Dollar
CDF - Congolese Franc
CHF - Swiss Franc
CLP - Chilean Peso
CNY - Chinese Yuan Renminbi
COP - Colombian Peso
CRC - Costa Rican Colon
CUC - Cuban Convertible Peso
CUP - Cuban Peso
CVE - Cape Verdean Escudo
CZK - Czech Koruna
DJF - Djiboutian Franc
DKK - Danish Krone
DOP - Dominican Peso
DZD - Algerian Dinar
EEK - Estonian Kroon
EGP - Egyptian Pound
ERN - Eritrean Nakfa
ETB - Ethiopian Birr
EUR - Euro
FJD - Fijian Dollar
FKP - Falkland Island Pound
GBP - British Pound
GEL - Georgian Lari
GGP - Guernsey Pound
GHS - Ghanaian Cedi
GIP - Gibraltar Pound
GMD - Gambian Dalasi
GNF - Guinean Franc
GTQ - Guatemalan Quetzal
GYD - Guyanese Dollar
HKD - Hong Kong Dollar
HNL - Honduran Lempira
HRK - Croatian Kuna
HTG - Haitian Gourde
HUF - Hungarian Forint
IDR - Indonesian Rupiah
ILS - Israeli Shekel
IMP - Isle of Man Pound
INR - Indian Rupee
IQD - Iraqi Dinar
IRR - Iranian Rial
ISK - Icelandic Krona
JEP - Jersey Pound
JMD - Jamaican Dollar
JOD - Jordanian Dinar
JPY - Japanese Yen
KES - Kenyan Shilling
KGS - Kyrgyzstani Som
KHR - Cambodian Riel
KMF - Comoran Franc
KPW - Korean Won
KRW - Korean Won
KWD - Kuwaiti Dinar
KYD - Caymanian Dollar
KZT - Kazakhstani Tenge
LAK - Lao or Laotian Kip
LBP - Lebanese Pound
LKR - Sri Lankan Rupee
LRD - Liberian Dollar
LSL - Basotho Loti
LTL - Lithuanian Litas
LVL - Latvian Lat
LYD - Libyan Dinar
MAD - Moroccan Dirham
MDL - Moldovan Leu
MGA - Malagasy Ariary
MKD - Macedonian Denar
MMK - Burmese Kyat
MNT - Mongolian Tughrik
MOP - Macau Pataca
MRO - Mauritian Ouguiya
MUR - Mauritian Rupee
MVR - Maldivian Rufiyaa
MWK - Malawian Kwacha
MXN - Mexican Peso
MYR - Malaysian Ringgit
MZN - Mozambican Metical
NAD - Namibian Dollar
NGN - Nigerian Naira
NIO - Nicaraguan Cordoba
NOK - Norwegian Krone
NPR - Nepalese Rupee
NZD - New Zealand Dollar
OMR - Omani Rial
PAB - Panamanian Balboa
PEN - Peruvian Nuevo Sol
PGK - Papua New Guinean Kina
PHP - Philippine Peso
PKR - Pakistani Rupee
PLN - Polish Zloty
PYG - Paraguayan Guarani
QAR - Qatari Riyal
RON - Romanian New Leu
RSD - Serbian Dinar
RUB - Russian Ruble
RWF - Rwandan Franc
SAR - Saudi or Saudi Arabian Riyal
SBD - Solomon Islander Dollar
SCR - Seychellois Rupee
SDG - Sudanese Pound
SEK - Swedish Krona
SGD - Singapore Dollar
SHP - Saint Helenian Pound
SLL - Sierra Leonean Leone
SOS - Somali Shilling
SPL - Seborgan Luigino
SRD - Surinamese Dollar
STD - Sao Tomean Dobra
SVC - Salvadoran Colon
SYP - Syrian Pound
SZL - Swazi Lilangeni
THB - Thai Baht
TJS - Tajikistani Somoni
TMT - Turkmenistani Manat
TND - Tunisian Dinar
TOP - Tongan Pa'anga
TRY - Turkish Lira
TTD - Trinidadian Dollar
TVD - Tuvaluan Dollar
TWD - Taiwan New Dollar
TZS - Tanzanian Shilling
UAH - Ukrainian Hryvna
UGX - Ugandan Shilling
USD - US Dollar
UYU - Uruguayan Peso
UZS - Uzbekistani Som
VEF - Venezuelan Bolivar Fuerte
VND - Vietnamese Dong
VUV - Ni-Vanuatu Vatu
WST - Samoan Tala
XAF - Central African CFA Franc BEAC
XCD - East Caribbean Dollar
XDR - IMF Special Drawing Rights
XOF - CFA Franc
XPF - CFP Franc
YER - Yemeni Rial
ZAR - South African Rand
ZMK - Zambian Kwacha
ZWD - Zimbabwean Dollar
EOF
}



###### define a word - USAGE: define dog
#function define() {
  local LNG=$(echo $LANG | cut -d '_' -f 1)
  local CHARSET=$(echo $LANG | cut -d '.' -f 2)
  lynx -accept_all_cookies -dump -hiddenlinks=ignore -nonumbers -assume_charset="$CHARSET" -display_charset="$CHARSET" "http://www.google.com/search?hl=${LNG}&q=define%3A+${1}&btnG=Google+Search" | grep -m 5 -C 2 -A 5 -w "*" > /tmp/define
  if [ ! -s /tmp/define ]; then
    echo "Sorry, google doesn't know this one..."
    rm -f /tmp/define
    return 1
  else
    cat /tmp/define | grep -v Search
    echo ""
  fi
  rm -f /tmp/define
  return 0
}

# program define
# version 1.0  
# written by Andrew V. Newman
# last modified Fri Mar  5 07:27:17 MST 2004
function define() {

# Shell script to bring up google based definitions for any compound or simple word 

# Checks to see if you have a word in mind or just typing in the command. If the latter,
# it will give you a short usage and example before exiting with error code 1. 
if [ ${#} -lt "1" ]; then
   echo "Usage: `basename $0` 'TRM' "
   echo "   where TRM is the word that you would like defined"
   echo "   Examples:"
   echo "     `basename $0` Fedora"
   echo "     `basename $0` shell script"
   echo "    or:"
   echo "     `basename $0` google"
   exit 1
fi

# Use 'resize' to correctly set the environmental variables for your terminal 
# (this may not work for all terminals). 
  eval `resize -u` 

# Set the lynx program to your current term width (doesn't do it by 
# default if being piped directly into another file), and turn off the 
# default justification (can make output UGLY). 
  LYNX="/usr/bin/lynx -justify=0 -width=$COLUMNS"

# Set your 'more' or 'less' favorite pager.
  PAGER=/bin/more
  PAGER=/usr/bin/less

# Sets a URL BASE assuming multiple variables as a compound word.  The
# way WORD is defined, it will replace all the blank spaces with the URL
# equivalent of a blank '%20'. 
  WORD=` echo ${@} | sed  's/\ /\%20/g'`

# Define the google URL to search for the definition. 
  URL=http://www.google.com/search?q=define:$WORD 

# Call up the google search in lynx and dump the output to a temp file
# and all stderr to /dev/null . 
  $LYNX $URL -dump 2> /dev/null >define.tmp
  
# Displays definition after stripping off unnecessary text before and 
# after the definitions (the first sed command only prints lines 
# between the line containing 'Definition' and the line containing 
# '_____', inclusive.  Then it pipes it through a second sed command 
# which replaces the 'lynx' URL numbers with 'WEB:', before piping it 
# through a third sed command that wipes out that last line.  Finally
# the information is piped to a pager command which lets you page 
# through the text on-screen with the space bar. 
  sed -n '/[dD]efinition/,/_____/p' define.tmp | \
     sed '/\[[0-9][0-9]\]/s//   WEB: /' |\
     sed '/____/d' | $PAGER

# Remove temporary file. 
  rm define.tmp
# Exit cleanly. 
  return 0
}


###### detect language of a string
function detectlanguage() { curl -s "http://ajax.googleapis.com/ajax/services/language/detect?v=1.0&q=$@" | sed 's/{"responseData": {"language":"\([^"]*\)".*/\1\n/'; }



###### find a location's coordinates
# usage:	findlocation "Las Vegas, Nevada" = coordinates: [ -115.1728160, 36.1146460, 0 ]
function findlocation() { place=`echo $1 | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}



###### Google search (example: google dog)
function google() {
firefox "http://www.google.com/search?&num=100&q=${@}" &
}



###### Google text-to-speech in mp3 format
function say() { mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=en&q=$(echo $* | sed 's#\ #\+#g')" > /dev/null 2>&1 ; }



###### translate a word using Google
# usage: translate <phrase> <output-language>
# example: translate "hello" es = hola (will auto-detect source language)
# for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
function translate() { wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=%7C${2:-en}" | sed 's/.*{"translatedText":"\([^"]*\)".*/\1\n/'; }



function translate_help() {
cat <<EOF
Language	ISO
(Afan) Oromo	om
Abkhazian	ab
Afar		aa
Afrikaans	af
Albanian	sq
Amharic		am
Arabic		ar
Armenian	hy
Assamese	as
Aymara		ay
Azerbaijani	az
Bashkir		ba
Basque		eu
Bengali		bn
Bhutani		dz
Bihari		bh
Bislama		bi
Breton		br
Bulgarian	bg
Burmese		my
Byelorussian	be
Cambodian	km
Catalan		ca
Chinese		zh
Corsican	co
Croatian	hr
Czech		cs
Danish		da
Dutch		nl
English		en
Esperanto	eo
Estonian	et
Faeroese	fo
Fiji		fj
Finnish		fi
French		fr
Frisian		fy
Galician	gl
Georgian	ka
German		de
Greek		el
Greenlandic	kl
Guarani		gn
Gujarati	gu
Hausa		ha
Hebrew 		he
(former iw)
Hindi		hi
Hungarian	hu
Icelandic	is
Indonesian 	id
(former in)
Interlingua	ia
Interlingue	ie
Inupiak		ik
Inuktitut 	iu
(Eskimo)
Irish		ga
Italian		it
Japanese	ja
Javanese	jw
Kannada		kn
Kashmiri	ks
Kazakh		kk
Kinyarwanda	rw
Kirghiz		ky
Kirundi		rn
Korean		ko
Kurdish		ku
Laothian	lo
Latin		la
Latvian, 	lv
Lettish
Lingala		ln
Lithuanian	lt
Macedonian	mk
Malagasy	mg
Malay		ms
Malayalam	ml
Maltese		mt
Maori		mi
Marathi		mr
Moldavian	mo
Mongolian	mn
Nauru		na
Nepali		ne
Norwegian	no
Occitan		oc
Oriya		or
Pashto, Pushto	ps
Persian		fa
Polish		pl
Portuguese	pt
Punjabi		pa
Quechua		qu
Rhaeto-Romance	rm
Romanian	ro
Russian		ru
Samoan		sm
Sangro		sg
Sanskrit	sa
Scots Gaelic	gd
Serbian		sr
Serbo-Croatian	sh
Sesotho		st
Setswana	tn
Shona		sn
Sindhi		sd
Singhalese	si
Siswati		ss
Slovak		sk
Slovenian	sl
Somali		so
Spanish		es
Sudanese	su
Swahili		sw
Swedish		sv
Tagalog		tl
Tajik		tg
Tamil		ta
Tatar		tt
Tegulu		te
Thai		th
Tibetan		bo
Tigrinya	ti
Tonga		to
Tsonga		ts
Turkish		tr
Turkmen		tk
Twi		tw
Uigur		ug
Ukrainian	uk
Urdu		ur
Uzbek		uz
Vietnamese	vi
Volapuk		vo
Welch		cy
Wolof		wo
Xhosa		xh
Yiddish 	yi
(former ji)
Yoruba		yo
Zhuang		za
Zulu		zu
EOF
}



##################################################
# Cut last n lines in file, 10 by default	 #
##################################################

function cuttail()
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}



##################################################
# Continuously print string as if being entered  #
# from the keyboard				 #
##################################################

function cycle() { while :;do((i++));echo -n "${3:$(($i%${#3})):1}";sleep .$(($RANDOM%$2+$1));done;}



##################################################
# Super stealth background launch		 #
##################################################

function daemon()
{
    (exec "$@" >&/dev/null &)
}



##################################################
# Shows what processes need to be restarted after#
# system upgrade				 #
##################################################

function deadlib() { lsof | grep 'DEL.*lib' | cut -f 1 -d ' ' | sort -u; }



##################################################
# Show dead links				 #
##################################################

function deadlink() {
	# copyright 2007 - 2010 Christopher Bratusek
	find -L -type l
}



##################################################
# Deb Extraction / Remaker (extracts a deb	 #
# file & organizes for easy deb manipulation	 #
# and repacking using "debremaker")		 #
##################################################

function debextract()
{
    read -sn 1 -p "Press any key to continue...
"
    # Set IFS so that it won't consider spaces as entry separators.  Without this, spaces in file/folder names can make the loop go wacky.
    IFS=$'\n'
    NEWDIRNAME=${1%.*}
    FILENAME=${1##*/}
    NAME=${1##*/.*}
    mkdir "$NEWDIRNAME"
    cp -fv -R "$1" "$NEWDIRNAME"
    cd "$NEWDIRNAME"
    ar vx "$FILENAME"
    rm -fv -R "$FILENAME"
    for FILE in *.tar.gz; do tar xvpf $FILE; done
    for FILE in *.tar.lzma; do tar xvpf $FILE; done
    rm -fv -R "control.tar.gz"
    rm -fv -R "data.tar.gz"
    rm -fv -R "data.tar.lzma"
    rm -fv -R "debian-binary"
    mkdir "DEBIAN"
    mv -fv "changelog" "DEBIAN"
    mv -fv "config" "DEBIAN"
    mv -fv "conffiles" "DEBIAN"
    mv -fv "control" "DEBIAN"
    mv -fv "copyright" "DEBIAN"
    mv -fv "postinst" "DEBIAN"
    mv -fv "preinst" "DEBIAN"
    mv -fv "prerm" "DEBIAN"
    mv -fv "postrm" "DEBIAN"
    mv -fv "rules" "DEBIAN"
    mv -fv "shlibs" "DEBIAN"
    mv -fv "templates" "DEBIAN"
    mv -fv "triggers" "DEBIAN"
    mv -fv ".svn" "DEBIAN"
    rm -fv -R "md5sums"
    echo "Finished Successfully"
}



function debremaker()
{
    read -sn 1 -p "Make sure you have this function directed to the original debian file (previously extracted from and made into a folder with \"debextract\"; otherwise, it will fail (Note: This will take a minute): Press any key to continue...
"
    # Set IFS so that it won't consider spaces as entry separators.  Without this, spaces in file/folder names can make the loop go wacky.
    IFS=$'\n'
    NEWDIRNAME=${1%.*}
    FILENAME=${1##*/}
    NAME=${1##*/.*}
    cd "$NEWDIRNAME"
    rm -fv -R "$1"
    find . -type f ! -regex '.*\.hg.*' ! -regex '.*?debian-binary.*' ! -regex '.*?DEBIAN.*' -printf '%P ' | xargs md5sum > DEBIAN/md5sums
    cd ..
    dpkg-deb -b "$NEWDIRNAME"
    rm -rf "$NEWDIRNAME"
    echo "Finished Successfully"
}



##################################################
# Download a web page and show info on what	 #
# took time					 #
##################################################

function debug_http() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }



##################################################
# Defragmentation of selected files/folder	 #
# (use at your own risk) & fragmentation-checking#
##################################################

function defrag()
{
cd "$1"
read -sn 1 -p "Warning! Pressing enter will defrag the current directory. Close this now if you are in the wrong directory and/or you forgot to type the name of the directory you wish to defrag after \"defrag\": Press any key to continue...
"
read -sn 1 -p "I'm serious. It's now or never...: Press any key to continue...
"
cat > "/tmp/defrag.sh" <<"End-of-message"
#!/bin/bash
# defrag v0.08 by Con Kolivas <kernel@kolivas.org
# Braindead fs-agnostic defrag to rewrite files in order largest to smallest
# Run this in the directory you want all the files and subdirectories to be
# reordered. It will only affect one partition. It works best when run twice.
# Are you really crazy enough to be using this? It might blow your data
# into tiny little useless chunks.
trap 'abort' 1 2 15
renice 19 $$ > /dev/null
function abort()
{
	echo -e "\nAborting"
	rm -f tmpfile dirlist
	exit 1
}
function fail()
{
	echo -e "\nFailed"
	abort
}
declare -i filesize=0
declare -i numfiles=0
# The maximum size of a file we can easily cache in ram
declare -i maxsize=$((`awk '/MemTotal/ {print $2}' /proc/meminfo`*1024))
(( maxsize-= `awk '/Mapped/ {print $2}' /proc/meminfo` ))
(( maxsize/= 2))
if [[ -a tmpfile || -a dirlist  ]] ; then
	echo dirlist or tmpfile exists
	exit 1
fi
# Sort in the following order:
# 1) Depth of directory
# 2) Size of directory descending
# 3) Filesize descending
# I made this crap up. It's completely unvalidated.
echo "Creating list of files..."
# stupid script to find max directory depth
find -xdev -type d -printf "%d\n" | sort -n | uniq > dirlist
# sort directories in descending size order
cat dirlist | while read d;
do
	find -xdev -type d -mindepth $d -maxdepth $d -printf "\"%p\"\n" | \
		xargs du -bS --max-depth=0 | \
		sort -k 1,1nr -k 2 |\
		cut -f2 >> tmpfile
	if (( $? )) ; then
		fail
	fi
done
rm -f dirlist
# sort files in descending size order
cat tmpfile | while read d;
do
	find "$d" -xdev -type f -maxdepth 1 -printf "%s\t%p\n" | \
		sort -k 1,1nr | \
		cut -f2 >> dirlist
	if (( $? )) ; then
		fail
	fi
done
rm -f tmpfile
numfiles=`wc -l dirlist | awk '{print $1}'`
echo -e "$numfiles files will be reordered\n"
# copy to temp file, check the file hasn't changed and then overwrite original
cat dirlist | while read i;
do
	(( --numfiles ))
	if [[ ! -f $i ]]; then
		continue
	fi
	# We could be this paranoid but it would slow it down 1000 times
	# if [[ `lsof -f -- "$i"` ]]; then
	# 	echo -e "\n File $i open! Skipping"
	# 	continue
	# fi
	filesize=`find "$i" -printf "%s"`
	# read the file first to cache it in ram if possible
	if (( filesize < maxsize ))
	then
		echo -e "\r $numfiles files left                                                            \c"
		cat "$i" > /dev/null
	else
		echo -e "\r $numfiles files left - Reordering large file sized $filesize ...                \c"
	fi
	datestamp=`find "$i" -printf "%s"`
	cp -a -f "$i" tmpfile
	if (( $? )) ; then
		fail
	fi
	# check the file hasn't been altered since we copied it
	if [[ `find "$i" -printf "%s"` != $datestamp ]] ; then
		continue
	fi
	mv -f tmpfile "$i"
	if (( $? )) ; then
		fail
	fi
done
echo -e "\nSucceeded"
rm -f dirlist
End-of-message
chmod +x "/tmp/defrag.sh"
sudo "/tmp/defrag.sh" "$1"
read -sn 1 -p "When you are finished, press any key to continue...
"
rm "/tmp/defrag.sh"
}



###### if run this in your $HOME directory, you will have to change permissions back
function defrag2()
{
cd "$1"
read -sn 1 -p "Warning! Pressing enter will defrag the current directory. Close this now if you are in the wrong directory and/or you forgot to type the name of the directory you wish to defrag after \"defrag\": Press any key to continue...
"
read -sn 1 -p "I'm serious. It's now or never...: Press any key to continue...
"
cat > "/tmp/defrag2.sh" <<"End-of-message"
#!/bin/bash
# Creator:	private_lock
# Recursively descend in a folder-structure and recreate every folder on ascending, to ensure it is
# sorted (check with 'ls -lU'). This will defrag the FAT32 file-system but not touch the files.
# count some statistics
directories=0
invalid=0
unreadable=0
# the latest modification date of a file within the given directory
function getMaxDate {
    # read the output of ls (one file per line, sorted for descending modification time)
    ls -1t "$1" | while read line; do
        # "return value" is piped through standard out
        echo "-d $(stat -c %y "$1"/"$line")"
        # stop after first line
        return
    done
}
# expect a single directory as argument
function rewrite {
    # get canonical path
    local canonical="$(readlink -f "$1")"
    if [[ ! -d "$1" || -h "$1" ]]; then
        echo "Skipping symbolic link \"$1\" -> \"$canonical\"!"
        let invalid+=1
        return
    fi
    if [[ ! -d "$1" || -h "$1" ]]; then
        echo \"$canonical\" is not a valid directory!
        let invalid+=1
        return
    fi
    cd "$canonical"
    if [[ $? != 0 ]]; then
        echo Cannot change to directory \"$canonical\"! Skipping ...
        let unreadable+=1
        return
    fi
    echo $canonical
    let directories+=1
    local isEmpty=true
    # recursive descend
    for d in *; do
        if [[ -d "$d" ]]; then
            rewrite "$d"
        fi
        let isEmpty=false
    done
    # ascend to parent of canonical (But don't ascend blindly)
    cd "$canonical"/..
    if [[ $isEmpty == true ]]; then
        # no need to recreate an empty directory, as it's zero entries are always sorted
        return
    fi
    # check for an empty temporary directory-name
    local tempdir="$canonical".bak
    if [[ -e "$tempdir" ]]; then
        # echo $tempdir exits
        local counter=1
        while [[ -e "$tempdir$counter" ]]; do
            # echo ${tempdir}${counter} exits
            let counter+=1
        done
        tempdir="${tempdir}${counter}"
    fi
    # TODO check file-system boundaries (don't move across)
    # rename the current directory
    mv "$canonical" "$tempdir"
    # create a new directory
    mkdir "$canonical"
    # move all the content from the old to the new directory
    # The whole script is build around the side-effect of mv to sort the entries.
    mv "$tempdir"/* "$canonical"
    # check, that the old directory is really empty
    if [[ "$(ls -A "$tempdir")" ]]; then
        echo ERROR: "$tempdir" is not empty!
        exit -2
    fi
    # restore permissions
    chmod --reference="$tempdir" "$canonical"
    # delete the old directory
    rmdir "$tempdir"
    # update the timestamp of the new directory
    # start off with today
    local maxDate=$(date)
    # evaluate the latest modification time of a file within this directory
    # empty directories would be set to now
    touch "$(getMaxDate "$canonical")" "$canonical"
}
# check commandline for help option
for a in "$@"; do
    if [[ ${a} = "-?" || ${a} = "-h"  || ${a} = "--help" ]]; then
        echo -e "\nUsage: folderSort [-?|-h|--help] [directories]\n"
        exit -1
    fi
done
# start processing the directories
if [[ "$#" -eq 0 ]]; then
    # no commandline argument was given -> work on the current directory
    rewrite .
else
    for a in "$@"; do
        rewrite ${a}
    done
fi
echo Processed a total of $directories directories!
if [[ $invalid > 0 ]]; then
    echo Found $invalid invalid directories!
fi
if [[ $unreadable > 0 ]]; then
    echo Found $unreadable directories, that could not be changed into!
fi
exit $(($invalid + $unreadable))
End-of-message
chmod +x "/tmp/defrag2.sh"
sudo "/tmp/defrag2.sh" "$1"
read -sn 1 -p "When you are finished, press any key to continue...
"
rm "/tmp/defrag2.sh"
}



###### fragmentation check (basic check, which will generate a percentage of fragmentation)
function fragcheck()
{
cd "$1"
read -sn 1 -p "Warning! Pressing enter will do a search for fragmentation in the current directory. Close this now if you are in the wrong directory and/or you forgot to type the name of the directory you wish to do a fragcheck after \"fragcheck\": Press any key to continue...
"
cat > "/tmp/fragcheck.pl" <<"End-of-message"
#!/usr/bin/perl -w
# Original creator: _droop_
# Updated by: as
# Updated again by: user11
# this script search for frag on a fs
use strict;
# number of files
my $files = 0;
# number of fragment
my $fragments = 0;
# number of fragmented files
my $fragfiles = 0;
my $verbose;
if ($ARGV[0] eq '-v') { shift @ARGV; $verbose++; }
open (REPORT, "find " . $ARGV[0] . " -xdev -type f -print0 | xargs -0 filefrag |");
while (defined (my $res = <REPORT>)) {
        if ($res =~ m/.*:\s+(\d+) extents? found$/) {
                my $fragment = $1;
                $fragments += $fragment;
                if ($fragment > 1) {
                        $fragfiles++;
                }
                $files++;
        } else {
                print ("Failed to parse: $res\n");
        }
}
close (REPORT);
if ($verbose) {
   print "Total files:      $files\n";
   print "Fragmented files: $fragfiles\n";
   print "Fragments:        $fragments\n";
}
sub round($$) {
   my $v = shift; # value
   my $p = shift; # rouding divisor (1 for '123', 10 for '123.4', 100 for '123.45')
   return int($v * $p) / $p;
}
print ( $fragfiles / $files * 100 . "% non contiguous files, " . $fragments / $files . " average fragments.\n");
End-of-message
chmod +x "/tmp/fragcheck.pl"
sudo "/tmp/fragcheck.pl" "$1"
read -sn 1 -p "When you are finished, press any key to continue...
"
rm "/tmp/fragcheck.pl"
}



###### will generate a percentage for fragmentation and several other things: takes longer than first one
function fragcheck2()
{
cd "$1"
read -sn 1 -p "Warning! Pressing enter will do a search for fragmentation in the current directory. Close this now if you are in the wrong directory and/or you forgot to type the name of the directory you wish to do a fragcheck after \"fragcheck\": Press any key to continue...
"
cat > "/tmp/fragcheck2.pl" <<"End-of-message"
#! /usr/bin/perl -w
#  Original creator: _droop_
#  Updated by: as
#  Updated again by: c07
use strict;
@ARGV >= 1 && @ARGV <= 2 or die "usage: $0 <dir> [<block size in KB>]";
$/= "\0";
my ($files, $blocks, $fragments, $frag, $fragblocks, $multi, $empty)= (0) x 7;
my $dir= shift;
my $blocksize= (shift || 4) + 0;
print qq|scanning "$dir", using block size $blocksize KB ...\n|;
open my $find, "-|", "find", $dir, qw"-xdev -type f -print0";
while ( my $file= <$find> ) {
  { open my $fh, "-|", "filefrag", $file; $_= <$fh> }
  /:\s+(\d+) extents? found/ or (print qq|"$_"?\n|), next;
  my $n= $1 + 0;
  { open my $fh, "-|", "ls", "-sk", $file; $_= <$fh> }
  /^(\d+)\s/ or (print qq|"$_" (ls)?\n|), next;
  my $s= $1 / $blocksize;
  ++$files;
  $s or ++$empty, next;
  $blocks += $s;
  $fragments += $n;
  ++$frag, $fragblocks += $s if $n > 1;
  ++$multi if $s > 1;
}
my $single= $files - $multi - $empty;
my $nonfrag= $files - $frag - $empty;
if ( ! $files ) { print "no files\n" }
else {
  printf "$files files, $frag (%.3f %%) fragmented\n", 100 * $frag / $files;
  if ( ! $multi ) { print "no multi-block files\n" }
  else {
    printf "$multi multi-block files, %.3f %% fragmented\n",
      100 * $frag / $multi;
  }
  print "$blocks blocks, $fragments fragments, $empty empty files\n";
  if ( $fragments ) {
    printf "average %.3f fragments per file, %.3f blocks per fragment,\n",
      $fragments / $files, $blocks / $fragments;
    if ( $multi ) {
      printf "%.3f fragments per multi-block file, %.3f blocks each,\n",
        ($fragments - $single) / $multi,
        ($blocks - $single) / ($fragments - $single);
      if ( $frag ) {
        printf "%.3f fragments per fragmented file, %.3f blocks each\n",
        ($fragments - $nonfrag) / $frag,
        $fragblocks / ($fragments - $nonfrag);
} } } }
End-of-message
chmod +x "/tmp/fragcheck2.pl"
sudo "/tmp/fragcheck2.pl" "$1"
read -sn 1 -p "When you are finished, press any key to continue...
"
rm "/tmp/fragcheck2.pl"
}



##################################################
# Delete function				 #
##################################################

function del()
{
    mv "$@" "/${HOME}/.local/share/Trash/files/"
}



function delete() {
    DIR=$1
    shift
    for i in $*; do
        if [ -f $DIR/$i ]; then
            rm $DIR/$i
        fi
    done
}



##################################################
# Lookup a word with dict.org			 #
##################################################

###### define "whatever"
function dic() { curl dict://dict.org/d:"$@" ; }



###### find matches of $1, with optional strat $2 and optional db $3
function ref()
{
    if [[ -z $3 ]]; then
        curl dict://dict.org/m:${1}:english:${2};
    else
        curl dict://dict.org/m:${1}:${3}:${2};
    fi
}



###### look in Webster
function webster() { curl dict://dict.org/d:${1}:web1913; }



###### look in WordNet
function wordnet() { curl dict://dict.org/d:${1}:wn; }



##################################################
# Shell function to exit script with error in 	 #
# exit status and print optional message to 	 #
# stderr					 #
##################################################

function die() { result=$1;shift;[ -n "$*" ]&&printf "%s\n" "$*" >&2;exit $result;}



##################################################
# Dirsize - finds directory sizes and lists	 #
# them for the current directory		 #
##################################################

function dirsize()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm /tmp/list
}



##################################################
# Display off (Turns the display off)		 #
##################################################

function display-off()
{
cat > "/tmp/display-off.py" <<"End-of-message"
#!/usr/bin/python
import time
import subprocess
from Xlib import X
from Xlib.display import Display
display = Display(':0')
root = display.screen().root
root.grab_pointer(True,
        X.ButtonPressMask | X.ButtonReleaseMask | X.PointerMotionMask,
        X.GrabModeAsync, X.GrabModeAsync, 0, 0, X.CurrentTime)
root.grab_keyboard(True,
        X.GrabModeAsync, X.GrabModeAsync, X.CurrentTime)
subprocess.call('xset dpms force off'.split())
p = subprocess.Popen('gnome-screensaver-command -i'.split())
time.sleep(1)
while True:
    print display.next_event()
    p.terminate()
    break
End-of-message
chmod +x "/tmp/display-off.py"
"/tmp/display-off.py"
rm "/tmp/display-off.py"
}



###### Display off with login (Turns the display off)
function display-oft()
{
cat > "/tmp/display-oft.py" <<"End-of-message"
#!/usr/bin/python
import time
import subprocess
from Xlib import X
from Xlib.display import Display
display = Display(':0')
root = display.screen().root
root.grab_pointer(True,
        X.ButtonPressMask | X.ButtonReleaseMask | X.PointerMotionMask,
        X.GrabModeAsync, X.GrabModeAsync, 0, 0, X.CurrentTime)
root.grab_keyboard(True,
        X.GrabModeAsync, X.GrabModeAsync, X.CurrentTime)
subprocess.call('xset dpms force off'.split())
p = subprocess.Popen('gnome-screensaver-command -i'.split())
time.sleep(1)
while True:
    print display.next_event()
    p.terminate()
    subprocess.Popen('gnome-screensaver-command -l'.split())
    break
End-of-message
chmod +x "/tmp/display-oft.py"
"/tmp/display-oft.py"
rm "/tmp/display-oft.py"
}



##################################################
# Change to specified pkg's documentation dir and#
# display the files				 #
##################################################

###### Usage: doc
function doc() {
    pushd "/usr/share/doc/$1" && ls
}



##################################################
# Lists unique IPs currently connected to 	 #
# logged-in system & how many concurrent 	 #
# connections each IP has			 #
##################################################

function doscheck()
{
"netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
}



##################################################
# Symlinks all hidden files in a directory to the#
# same names without the dot			 #
##################################################

function dot_ln()
{
    for file in `/bin/ls -a | /bin/egrep "^\.[^./]"` ; do
        if [[ "$1" == "-f" ]] ; then
            /bin/ln -svif $file ${file:1}
        else
            /bin/ln -svi $file ${file:1}
        fi
    done
}



##################################################
# Site down for everyone or just me?		 #
##################################################

function downforme() {
	RED='\e[1;31m'
	GREEN='\e[1;32m'
	YELLOW='\e[1;33m'
	NC='\e[0m'
	if [ $# = 0 ]
	then
		echo -e "${YELLOW}usage:${NC} downforme website_url"
	else
		JUSTYOUARRAY=(`lynx -dump http://downforeveryoneorjustme.com/$1 | grep -o "It's just you"`)
		if [ ${#JUSTYOUARRAY} != 0 ]
		then
			echo -e "${RED}It's just you. \n${NC}$1 is up."
		else
			echo -e "${GREEN}It's not just you! \n${NC}$1 looks down from here."
		fi
	fi
}



##################################################
# Size of directories in MB			 #
##################################################

function ds()
{
    echo "size of directories in MB"
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "you did not specify a directy, using pwd"
        DIR=$(pwd)
        find $DIR -maxdepth 1 -type d -exec du -sm \{\} \; | sort -nr
    else
        find $1 -maxdepth 1 -type d -exec du -sm \{\} \; | sort -nr
    fi
}



##################################################
# Size of items in directory			 #
##################################################

function dubigf() {
  du -sh * | awk '/[[:space:]]*[[:digit:]]+,*[[:digit:]]*G/' | sort -nr
  du -sh * | awk '/[[:space:]]*[[:digit:]]+,*[[:digit:]]*M/' | sort -nr
}



##################################################
# View portage changelog for specified package	 #
##################################################

######   $1 = package name
function echange() {
    PACKAGE="$(eix -e --only-names $1)"
    if [ "$PACKAGE" != "" ]; then
        view /usr/portage/$PACKAGE/ChangeLog
    fi
}



##################################################
# Directory operations: editd, flipd, popd, 	 #
# printd, pushd, rotd, swapd			 #
##################################################

###### Edit directory stack
function editd() {
  export EDITDNO=$((${EDITDNO:=0} + 1))
  typeset FiLe=/tmp/`basename -- $0`$$.${EDITDNO}
  printd >${FiLe}
  ${EDITOR} ${FiLe}
  DS=`while read ea; do echo -n "$ea:"; done <${FiLe}`
  rm -f ${FiLe}
}



###### flip back-and-forth between current dir and top of stack (like "cd -")
function flipd() {
  if [ "$DS" ]
  then
    cd "${DS%%:*}"
    export DS="$OLDPWD:${DS#*:}"
  else
    echo "$0: empty directory stack" >&2
  fi
}



###### pop top dir off stack and cd to it
function popd() {
  if [ "$DS" ]
  then
    cd "${DS%%:*}"
    export DS="${DS#*:}"
  else
    echo "$0: empty directory stack" >&2
  fi
}



###### Print directory stack
function printd() {
  ( IFS=:; for each in $DS; do echo $each; done; )
}



###### Change to new dir, pushing current onto stack
function pushd() {
  export DS="$PWD:$DS"
  if [ -n "$1" ]; then cd "$1"; else cd; fi || export DS="${DS#*:}"
}



###### rotate thru directory stack (from bottom to top)
function rotd() {
  if [ "$DS" ]
  then
    typeset DSr="${DS%:*:}"
    [ "${DSr}" = "${DS}" ] || export DS="${DS##${DSr}:}$DSr:"
    flipd
  else
    echo "$0: directory stack is empty" >&2
  fi
}



###### swap top two dir stack entries
function swapd() {
  typeset DSr="${DS#*:}"
  if [ "$DSr" ]
  then
    export DS="${DSr%%:*}:${DS%%:*}:${DSr#*:}"
  else
    echo "$0: less than two on directory stack" >&2
  fi
}



if [ ! -f ${HOME}/.lastdir ];then
	cat > ${HOME}/.lastdir
fi



alias lastd="cd $(cat ~/.lastdir)"         # change to last dir at 'bye'



###### save current dir for lastd on exit if not $HOME
alias saved='[ ${PWD} != ${HOME} ] && pwd >~/.lastdir; [ -n "${DS}" ] && echo "${DS}" >~/.dirstak'



###### get dir stack back on login
[ -s ${HOME}/.dirstak ] && export DS=`cat ${HOME}/.dirstak`



##################################################
# Download ed2k file				 #
##################################################

function ed2k()
{
wget -q -O - "$1" | grep "ed2k://" |  sed -e 's/^.*=//g;s/..$//g'
}



##################################################
# Edit your history file			 #
##################################################

function eh() { history -a ; vi ~/.bash_history ; history -r ; }



##################################################
# Elements database				 #
##################################################

function ele() {
    dict -d elements $@
}



##################################################
# Show empty files in the directed directory	 #
##################################################

function empty() {
	# copyright 2007 - 2010 Christopher Bratusek
	find "$1" -empty
}



##################################################
# Surround lines with quotes (useful in pipes)	 #
# - from mervTormel				 #
##################################################

function enquote() { /usr/bin/sed 's/^/"/;s/$/"/' ; }



##################################################
# Determining the meaning of error codes	 #
##################################################

function err()
{
    grep --recursive --color=auto --recursive -- "$@" /usr/include/*/errno.h
    if [ "${?}" != 0 ]; then
        echo "Not found."
    fi
}



##################################################
# View latest installable portage ebuild for	 #
# specified package				 #
##################################################

######   $1 = package name
function eview() {
    FILE=$(equery which $1)
    if [ -f "$FILE" ]; then
        view $FILE
    fi
}



##################################################
# Exchange stuff from two places		 #
##################################################

function exchange()
# copyright 2007 - 2010 Christopher Bratusek
{
	typeset temp
	SAVE=$IFS
	IFS=''
	eval $(echo "temp=\"\$$1\"")
	eval $(echo "$1=\"\$$2\"")
	eval $(echo "$2=\"$temp\"")
	IFS=$SAVE
}



##################################################
# Extract - extract most common compression	 #
# types						 #
##################################################

function extract() {
  local e=0 i c
  for i; do
    if [[ -f $i && -r $i ]]; then
        c=''
        case $i in
          *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                 c='bsdtar xvf' ;;
          *.7z)  c='7z x'       ;;
          *.Z)   c='uncompress' ;;
          *.bz2) c='bunzip2'    ;;
          *.exe) c='cabextract' ;;
          *.gz)  c='gunzip'     ;;
          *.rar) c='unrar x'    ;;
          *.xz)  c='unxz'       ;;
          *.zip) c='unzip'      ;;
          *)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
        esac
        [[ $c ]] && command $c "$i"
    else
        echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
    fi
  done
  return $e
}



##################################################
# CIA world fact book				 #
##################################################

function fact() {
    dict -d world02 $@
}



##################################################
# Passwording					 #
##################################################

###### fake name and pass
function fakepass()
{
  local l=8
  [ -n "$1" ] && l=$1
  dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | head -n 2 | tail -n 1 | cut -c $l
}



alias fakename='nc koeln.ccc.de 23 | cut -d \  -f 4,5'



###### password file
function pw()
{
    if [ "$OS" = "Linux" ]; then
        gpg $HOME/priv.asc
        vi -n $HOME/priv
        gpg -ea $HOME/priv
        wipe -f $HOME/priv
    elif [ "$OS" = "Darwin" ]; then
        gpg $HOME/Documents/priv.asc
        vi -n $HOME/Documents/priv
        gpg -ea $HOME/Documents/priv
        srm -f $HOME/Documents/priv
    fi
}



###### generate a random password
#   $1 = number of characters; defaults to 32
#   $2 = include special characters; 1 = yes, 0 = no; defaults to 1
# copyright 2007 - 2010 Christopher Bratusek
function randompw() {
	if [[ $2 == "!" ]]; then
		echo $(cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-32})
	else	echo $(cat /dev/urandom | tr -cd '[:alnum:]' | head -c ${1:-32})
	fi
}



###### generate a random left-hand password
alias randompwl='</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo ""'



###### generate a unique and secure password for every website that you login to
function sitepass() { echo -n "$@" |  md5sum | sha1sum | sha224sum | sha256sum | sha384sum | sha512sum | gzip - | strings -n 1 | tr -d "[:space:]"  | tr -s '[:print:]' | tr '!-~' 'P-~!-O' | rev | cut -b 2-11; history -d $(($HISTCMD-1)); }



###### generates a unique and secure password with SALT for every website that you login to
function sitepass2()
{
salt="this_salt";pass=`echo -n "$@"`;for i in {1..500};do pass=`echo -n $pass$salt|sha512sum`;done;echo$pass|gzip -|strings -n 1|tr -d "[:space:]"|tr -s '[:print:]' |tr '!-~' 'P-~!-O'|rev|cut -b 2-15;history -d $(($HISTCMD-1));
}



###### trunc	password
function trunc_pwd()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}trunc_pwd ${ewhite}|${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			pwdmaxlen=$(get_key pwdmaxlength)
			trunc_symbol=$(get_key pwdchar)
			dirchar=$(get_key dirchar)
			newsepacolor=$(echo $sepacolor | sed -e 's/\\\[//g' -e 's/\\\]//g')
			newwdircolor=$(echo $wdircolor | sed -e 's/\\\[//g' -e 's/\\\]//g')
			newpscoloror=$(echo $pscolor | sed -e 's/\\\[//g' -e 's/\\\]//g')
			if [ ${#PWD} -gt $pwdmaxlen ]; then
				pwdoffset=$(( ${#PWD} - $pwdmaxlen ))
				if [[ $pstyle_supported == true ]]; then
					xPWD="$newpscoloror${trunc_symbol}${PWD:$pwdoffset:$pwdmaxlen}"
				else	xPWD="${trunc_symbol}${PWD:$pwdoffset:$pwdmaxlen}"
				fi
				if [[ $enabcol == true && $pstyle_supported == true ]]; then
					newPWD="${xPWD//\//$newsepacolor$dirchar$newwdircolor}"
				else	newPWD="${xPWD//\//$dirchar}"
				fi
			else
				if [[ $enabcol == true && $pstyle_supported == true ]]; then
				newPWD="${PWD//\//$newsepacolor$dirchar$newwdircolor}"
			else	newPWD="${PWD//\//$dirchar}"
			fi
			fi
			echo -e $newPWD
		;;
	esac
}



##################################################
# Find a file(s) ...				 #
##################################################

###### ... with pattern $1 in name and Execute $2 on it
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }



###### ... under the current directory
function ff() { /usr/bin/find . -name "$@" ; }



###### ... whose name ends with a given string
function ffe() { /usr/bin/find . -name '*'"$@" ; }



###### ... whose name starts with a given string
function ffs() { /usr/bin/find . -name "$@"'*' ; }



###### ... larger than a certain size (in bytes)
function find_larger() { find . -type f -size +${1}c ; }



###### find a file with a pattern in name in the local directory
function fp()
{
    find . -type f -iname '*'$*'*' -ls ;
}



###### find pattern in a set of files and highlight them
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    local SMSO=$(tput smso)
    local RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sn ${case} "$1" 2>&- | \
sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}



###### searches through the text of all the files in your current directory
# http://seanp2k.com/?p=13
# Good for debugging a PHP script you didn't write and can't trackdown where MySQL connect string actually is
# function grip() {
# grep -ir "$1″ "$PWD"
# }



###### ... who is the newest file in a directory
function newest() { find ${1:-\.} -type f |xargs ls -lrt ; }



##################################################
# Festival - text-to-speech 			 #
##################################################

###### requires festival: sudo apt-get install festival
# Usage:	fest "text"
function fest() {
    echo $1 | festival --tts
}



##################################################
# Find in file and ( AND relation )		 #
##################################################

# Will search PWD for text files that contain $1 AND $2 AND $3 etc...
# Actually it does the same as grep word1|grep word2|grep word3 etc, but in a more elegant way.
function ffa() { (($# < 2)) && { echo "usage: ffa pat1 pat2 [...]" >&2; return 1; };awk "/$1/$(printf "&&/%s/" "${@:2}")"'{ print FILENAME ":" $0 }' *; }



##################################################
# Pick the first program found from a list of 	 #
# alternatives	 				 #
##################################################

###### used to set environmental variables from list of alternatives depending on what's installed (uses bash setting 'export BROWSER' above)
# it returns the first program found in the list
# Usage:	export BROWSER=$(find_alternatives chromium-browser google-chrome opera firefox firefox-bin iceweasel konqueror w3m lynx)
function find_alternatives() { for i;do which "$i" >/dev/null && { echo "$i"; return 0;};done;return 1; }



##################################################
# Find out the pid of a specified process	 #
##################################################

######  note that the command name can be specified via a regex
#    E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#    Without the 'sudo' it will only find processes of the current user
function findPid() { sudo /usr/sbin/lsof -t -c "$@" ; }



##################################################
# Search for a word in the Unix word list	 #
##################################################

function findword() { /usr/bin/grep ^"$@"$ /usr/share/dict/words ; }



##################################################
# Recursively fix dir/file permissions on a	 #
# given directory				 #
##################################################

function fix() {
if [ -d $1 ]; then
find $1 -type d -exec chmod 755 {} \;
find $1 -type f -exec chmod 644 {} \;
else
echo "$1 is not a directory."
fi
}



##################################################
# Edit files in place to ensure Unix line-	 #
# endings					 #
##################################################

function fixlines() { /usr/bin/perl -pi~ -e 's/\r\n?/\n/g' "$@" ; }



##################################################
# Fix eclipse mistakes with tabs		 #
##################################################

###### Sources files should never use TABs for indenting because they may looks different in different editors
# For example there popular Eclipse IDE use a the non default tab size 4
function fix-tabs() { expand -t 4 "$1" > "$1.expanded"; mv -f "$1.expanded" "$1"; }



##################################################
# Inserts a flag with the specified content	 #
##################################################

###### Usage: flag "comment"
# If no comment, inserts the date.
function flag() {
    if [ "$1" == "" ];
    then
        echo -e  "\e[0;31m[====== " `date +"%A %e %B %Y"`, `date +"%H"`h`date +"%M"` " ======]\e[0m"
    else
        echo -e  "\e[0;31m[====== " $@ " ======]\e[0m"
    fi
}



##################################################
# Inserts a flag and executes the command	 #
##################################################

###### Example: flagcommand ls
function flagcommand() {
    if [ "$1" == "" ];
    then
        return
    else
        flag $@
        $@
    fi
}



##################################################
# Flight status					 #
##################################################

###### track flights from the command line (requires html2text: sudo apt-get install html2text)
function flight_status() { if [[ $# -eq 3 ]];then offset=$3; else offset=0; fi; curl "http://mobile.flightview.com/TrackByRoute.aspx?view=detail&al="$1"&fn="$2"&dpdat=$(date +%Y%m%d -d ${offset}day)" 2>/dev/null |html2text |grep ":"; }



##################################################
# Autofocus window after executing some command` #
##################################################

###### example: focus make all
# from: http://noisy-coder.blogspot.com/2010/10/autofocus-window.html
function focus() { winID=`xprop -root |awk '/_NET_ACTIVE_WINDOW/ {print $5; exit;}'`; $@; wmctrl -i -a $winID; }



##################################################
# Weather and stuff				 #
##################################################

###### 10-day forcast
# USAGE:	forecast 50315
function forecast() {
_ZIP=$1

if   [ $# = 1 ];then
     printf "$_ZIP\n" | egrep '^[0-9][0-9][0-9][0-9][0-9]$' >>/dev/null
     if   [ $? = 0 ];then
          printf "Your 10 Day Weather Forecast as follows:\n";
          lynx -dump "http://www.weather.com/weather/print/$_ZIP" | sed -n '/%$/s/\[.*\]//p';
          printf "\n"
     elif [ $? = 1 ];then
          printf "Bad ZIP code!\n"
     fi
elif [ $# != 1 ];then
     printf "You need to supply a ZIP code!\n"
fi
}



###### get sunrise and sunset times
function suntimes()
{
l=12765843;curl -s http://weather.yahooapis.com/forecastrss?w=$l|grep astronomy| awk -F\" '{print $2 "\n" $4;}'
}



###### weather by US zip code - Can be called two
# ways	# weather 50315	# weather "Des
# Moines"
function weather()
{
declare -a WEATHERARRAY
WEATHERARRAY=( `lynx -dump http://google.com/search?q=weather+$1 | grep -A 5 '^ *Weather for' | grep -v 'Add to'`)
echo ${WEATHERARRAY[@]}
}



##################################################
# Easily run a program in the background without #
# losing output	 				 #
##################################################

function fork() { tf=$(tempfile -d /tmp -p $1.);echo -n "$tf "; $@ &>$tf& }



##################################################
# Get FreeMusicCharts of the current month	 #
##################################################

function freemusiccharts()
{
wget -O - "http://www.darkerradio.com/news/free-music-charts-$(date "+%B-%Y")/" 2> /dev/null | grep -o "http://[^ \"']*\.mp3" |grep "freemusiccharts.songs" | sort | uniq | xargs -n1 wget -c
}



##################################################
# Find all bash functions in a file		 #
##################################################

###### finds all functions defined in any shell script secified, including .bashrc
function functions() { read -p "File name> "; sort -d $REPLY | grep "() {" | sed -e 's/() {//g' | less; }



##################################################
# ISO-maker from disc				 #
##################################################

function geniso() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $CD_WRITER ]]; then
		dd $DD_OPTS if=$CD_WRITER of="$1"
	else	dd $DD_OPTS if=/dev/dvdrw of="$1"
	fi
}



##################################################
# Extract a particular column of space-		 #
# separated output				 #
##################################################

###### e.g.: lsof | getcolumn 0 | sort | uniq
function getcolumn() { perl -ne '@cols = split; print "$cols['$1']\n"' ; }



##################################################
# Download the latest kernel			 #
##################################################

function get_kernel() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $1 == "-s" ]]; then
		wget http://www.kernel.org/pub/linux/kernel/v2.6/linux-${2}.tar.bz2
	elif [[ $1 == "-t" ]]; then
		wget http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-${2}.tar.bz2
	elif [[ $1 == "-sg" ]]; then
		git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-${2}.y.git
	elif [[ $1 == "-tg" ]]; then
		git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
	elif [[ $1 == "-z" ]]; then
		wget http://downloads.zen-kernel.org/${2}/${2}-zen${3}.patch.lzma
	fi
}



##################################################
# Git stuff					 #
##################################################

###### copyright 2007 - 2010 Christopher Bratusek
function git_action() {
	if [[ -d .git ]]; then
		if [[ -f .git/dotest/rebasing ]]; then
			ACTION="rebase"
		elif [[ -f .git/dotest/applying ]]; then
			ACTION="apply"
		elif [[ -f .git/dotest-merge/interactive ]]; then
			ACTION="rebase -i"
		elif [[ -d .git/dotest-merge ]]; then
			ACTION="rebase -m"
		elif [[ -f .git/MERGE_HEAD ]]; then
			ACTION="merge"
		elif [[ -f .git/index.lock ]]; then
			ACTION="locked"
		elif [[ -f .git/BISECT_LOG ]]; then
			ACTION="bisect"
		else	ACTION="nothing"
		fi
		echo $ACTION
	else	echo --
	fi
}



function git_branch() {
	if [[ -d .git ]]; then
		BRANCH=$(git symbolic-ref HEAD 2>/dev/null)
		echo ${BRANCH#refs/heads/}
	else	echo --
	fi
}



function git_bzip() {
	git archive master | bzip2 -9 >"$PWD".tar.bz2
}



function git_e() {
	if [[ "$SVN_USER_ENLIGTENMENT" && $1 == "-m" ]]; then
		svn co svn+ssh://"$SVN_USER_ENLIGTENMENT"@svn.enlightenment.org/var/svn/$2
	else
		svn co http://svn.enlightenment.org/svn/$2
	fi
}



function git_export() {
	if [[ "$1" != "" ]]; then
		git checkout-index --prefix="$1"/ -a
	fi
}



function git_gnome() {
	if [[ $GIT_USER_GNOME ]]; then
		if [[ $1 == "-m" ]]; then
			git clone git+ssh://$GIT_USER_GNOME@git.gnome.org/git/$2
		elif [[ $1 == "-mb" ]]; then
			git clone -b $3 git+ssh://$GIT_USER_GNOME@git.gnome.org/git/$2
		fi
	fi
	if [[ $1 == "-b" ]]; then
		git clone -b $3 git://git.gnome.org/$2
	else 	git clone git://git.gnome.org/$1
	fi
}



function git_kde() {
	if [[ "$SVN_USER_KDE" ]]; then
		if [[ $1 == "-m" ]]; then
			svn co --user-name="$SVN_USER_KDE" svn+ssh://svn.kde.org/home/kde/trunk/KDE/$2
		elif [[ $1 == "-mb" ]]; then
			svn co --user-name="$SVN_USER_KDE" svn+ssh://svn.kde.org/home/kde/branches/KDE/$2
		fi
	fi
	if [[ $1 == "-b" ]]; then
		svn co svn://svn.kde.org/home/kde/branches/KDE/$2
	else	svn co svn://svn.kde.org/home/kde/trunk/KDE/$2
	fi
}



function git_revision() {
	if [[ -d .git ]]; then
		REVISION=$(git rev-parse HEAD 2>/dev/null)
		REVISION=${REVISION/HEAD/}
		echo ${REVISION:0:6}
	else	echo --
	fi
}



function git_xfce() {
	if [[ $GIT_USER_XFCE ]]; then
		if [[ $1 == "-m" ]]; then
			git clone ssh://$GIT_USER_XFCE@git.xfce.org/git/$2
		elif [[ $1 == "-mb" ]]; then
			git clone -b $3 ssh://$GIT_USER_XFCE@git.xfce.org/git/$2
		fi
	fi
	if [[ $1 == "-b" ]]; then
		git clone -b $3 git://git.xfce.org/$2
	else	git clone git://git.xfce.org/$1
	fi
}



function git_xz() {
	git archive master | xz -9 > "$PWD".tar.xz
}



function gup() {
  git fetch && git rebase origin/$(git branch | grep '^\*' | cut -d\  -f2)
}



###### edit the svn log at  the given revision
function svnlogedit() {
    svn propedit svn:log --revprop -r$1 --editor-cmd gedit
}



###### svn recursive directory/file adder
# this will recursively add files/directories in SVN
function svnradd() { for i in $1/*;do if [ -e "$i" ];then if [ -d "$i" ];then svn add $i;svnradd $i;else svn add $i;fi; fi;done }



###### display the revision number of the current repository					 #
function svn_rev() {
	svn info $@ | awk '/^Revision:/ {print $2}'
}



###### do a svn update and show the log messages since the last update
function svn_uplog() {
	local old_revision=`svn_rev $@`
	local first_update=$((${old_revision} + 1))

	svn up -q $@
	if [ $(svn_rev $@) -gt ${old_revision} ]
	then
		svn log -v -rHEAD:${first_update} $@
	else
		echo "No Changes."
	fi
}



##################################################
# Twitter, Twitter, Twitter			 #
##################################################

###### view someone's twitter stream from terminal
function grabtweets() { curl -s "twitter.com/$1" | sed -ne '/entry-content/{s/<[^>]*>//g;s/^[ \t]*//;p}'; }



###### update twitter via curl as function
function tweet() { curl -u "$1" -d status="$2" "http://twitter.com/statuses/update.xml"; }



##################################################
# Cool History Summerizer			 #
##################################################

function historyawk() { history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; }



##################################################
# Get just the HTTP headers from a web page	 #
# (and its redirects)				 #
##################################################

function http_headers() { /usr/bin/curl -I -L $@ ; }



##################################################
# :h gets you to the vim help menu or directly	 #
# to :help wordname				 #
##################################################

function :h() {  vim --cmd ":silent help $@" --cmd "only"; }



##################################################
# Show computer information of all sorts	 #
# (requires 'gawk': sudo apt-get install gawk)	 #
##################################################

###### machine details
function ii()
{
    echo -e "\n${RED}You are logged onto:$NC " ; hostname
    echo -e "\n${RED}Additionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date:$NC " ; date
    echo -e "\n${RED}Machine stat:$NC " ; uptime
    echo -e "\n${RED}Disk space:$NC " ; df -h
    echo -e "\n${RED}Memory stats (in MB):$NC " ;
    if [ "$OS" = "Linux" ]; then
        free -m
    elif [ "$OS" = "Darwin" ]; then
        vm_stat
    fi
    echo -e "\n${RED}IPs:$NC " ; ips
}



###### colored status of running services
function services() { printf "$(service --status-all 2>&1|sed -e 's/\[ + \]/\\E\[42m\[ + \]\\E\[0m/g' -e 's/\[ - \]/\\E\[41m\[ - \]\\E\[0m/g' -e 's/\[ ? \]/\\E\[43m\[ ? \]\\E\[0m/g')\n"; }



function show_battery_load()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*acpi )
			check_opt acpi show_battery_load::acpi
			if [[ $? != "1" ]]; then
				load=$(acpi -b | sed -e "s/.* \([1-9][0-9]*\)%.*/\1/")
				out="$(acpi -b)"
				state="$(echo "${out}" | awk '{print $3}')"
				case ${state} in
					charging,)
						statesign="^"
					;;
					discharging,)
						statesign="v"
					;;
					charged,)
						statesign="°"
					;;
				esac
				battery="${statesign}${load}"
				echo $battery
			fi
		;;
		*apm )
			check_opt apm show_battery_load::apm
			if [[ $? != "1" ]]; then
				result="$(apm)"
				case ${result} in
					*'AC on'*)
						state="^"
					;;
					*'AC off'*)
						state="v"
					;;
				esac
				load="${temp##* }"
				battery="${state}${load}"
				echo $battery
			fi
		;;
		* )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_battery_load${ewhite} |${egreen} --acpi${eiceblue} [show batteryload using acpi]\
			\n${eorange}show_battery_load${ewhite} |${egreen} --apm${eiceblue} [show batteryload using apm]" | column -t
			echo ""
			tput sgr0
		;;
	esac
}



function show_cpu_load()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_cpu_load${ewhite} |${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			NICE_IGNORE=20
			t="0"
			while read cpu ni; do
				if [[ $ni == *-* || $ni -le $NICE_IGNORE ]]; then
					t="$t + $cpu"
				fi
				if [[ ${cpu%%.*} -eq 0 ]]; then
					break
				fi
			done < <(ps -Ao "%cpu= ni="| sort -r)
			cpu=$(echo "$t" | bc)
			if [[ ! "${cpu#.}x" = "${cpu}x" ]]; then
				cpu="0${cpu}"
			fi
			cpu=${cpu%%.*}
			if [[ $cpu -gt 100 ]]; then
				cpu=100
			fi
			if [[ $cpu -lt 16 ]]; then
				color=${eiceblue}
			elif [[ $cpu -lt 26 ]]; then
				color=${eturqoise}
			elif [[ $cpu -lt 41 ]]; then
				color=${esmoothgreen}
			elif [[ $cpu -lt 61 ]]; then
				color=${egreen}
			elif [[ $cpu -lt 81 ]]; then
				color=${eyellow}
			else	color=${ered}
			fi
			if [[ $cpu -lt 10 ]]; then
				prepend=00
			elif [[ $cpu -lt 100 ]]; then
				prepend=0
			fi
			if [[ $enabcol == true ]]; then
				echo -e "$color$prepend$cpu"
			else	echo $prepend$cpu
			fi
		;;
	esac
}



function show_mem() {
	# copyright 2007 - 2010 Christopher Bratusek
	case $1 in
		*used )
			used=$(free -m | grep 'buffers/cache' | awk '{print $3}')
			if [[ $used -lt 1000 ]]; then
				echo 0$used
			elif [[ $used -lt 100 ]]; then
				echo 00$used
			else	echo $used
			fi
		;;
		*free )
			free=$(free -m | grep 'buffers/cache' | awk '{print $4}')
			if [[ $free -lt 1000 ]]; then
				echo 0$free
			elif [[ $free -lt 100 ]]; then
				echo 00$ree
			else	echo $free
			fi
		;;
		*used-percent )
			free | {
				read
				read m t u f s b c;
				f=$[$f + $b + $c]
				f=$[100-100*$f/$t]
				if [ $f -gt 100 ]; then
					f=100
				fi
				echo ${f}%
		}
		;;
		*free-percent )
			free | {
				read
				read m t u f s b c;
				f=$[$f + $b + $c]
				f=$[100-100*$f/$t]
				if [ $f -gt 100 ]; then
					f=100
				fi
				echo $((100-${f}))%
				}
		;;
		* )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "\n${eorange}show_mem ${ewhite}|${egreen} --used ${eiceblue}[display used memory in mb]\
			\n${eorange}show_mem ${ewhite}|${egreen} --free ${eiceblue}[display free memory in mb]\
			\n${eorange}show_mem ${ewhite}|${egreen} --percent-used ${eiceblue}[display used memory in %]\
			\n${eorange}show_mem ${ewhite}|${egreen} --percent-free ${eiceblue}[display free memory in %]" | column -t
			echo ""
			tput sgr0
		;;
	esac
}



function show_size()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_size ${ewhite}|${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			let TotalBytes=0
			for Bytes in $(ls -lA -1 | grep "^-" | awk '{ print $5 }'); do
				let TotalBytes=$TotalBytes+$Bytes
			done
			if [ $TotalBytes -lt 1024 ]; then
				TotalSize=$(echo -e "scale=1 \n$TotalBytes \nquit" | bc)
				suffix="B"
			elif [ $TotalBytes -lt 1048576 ]; then
				TotalSize=$(echo -e "scale=1 \n$TotalBytes/1024 \nquit" | bc)
				suffix="KB"
			elif [ $TotalBytes -lt 1073741824 ]; then
				TotalSize=$(echo -e "scale=1 \n$TotalBytes/1048576 \nquit" | bc)
				suffix="MB"
			else
				TotalSize=$(echo -e "scale=1 \n$TotalBytes/1073741824 \nquit" | bc)
				suffix="GB"
			fi
			echo "${TotalSize} ${suffix}"
		;;
	esac
}



function show_space()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*used-percent )
			echo $(df | grep -w $2 | gawk '{print $5}')
		;;
		*free-percent )
			echo $((100-$(df | grep -w $2 | gawk '{print $5}' | sed -e 's/\%//g')))%
		;;
		*used )
			echo $(df -h | grep -w $2 | gawk '{print $3}')B
		;;
		*free )
			echo $(df -h | grep -w $2 | gawk '{print $4}')B
		;;
		*total )
			echo $(df -h | grep -w $2 | gawk '{print $2}')B
		;;
		* )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_space ${ewhite}|${egreen} --used ${eiceblue}[display used space in mb/gb]\
			\n${eorange}show_space ${ewhite}|${egreen} --free ${eiceblue}[display free space in mb/gb]\
			\n${eorange}show_space ${ewhite}|${egreen} --percent-used ${eiceblue}[display used space in %]\
			\n${eorange}show_space ${ewhite}|${egreen} --percent-free ${eiceblue}[display free space in %]" | column -t
			echo ""
			tput sgr0
		;;
	esac
}



function show_system_load() {
	# copyright 2007 - 2010 Christopher Bratusek
	case $1 in
		1 )
			load=$(uptime | sed -e "s/.*load average: \(.*\...\), \(.*\...\), \(.*\...\)/\1/" -e "s/ //g")
		;;
		10 )
			load=$(uptime | sed -e "s/.*load average: \(.*\...\), \(.*\...\), \(.*\...\)/\2/" -e "s/ //g")
		;;
		15 )
			load=$(uptime | sed -e "s/.*load average: \(.*\...\), \(.*\...\), \(.*\...\)/\3/" -e "s/ //g")
		;;
		*help | "")
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_system_load${ewhite} | ${egreen}1 ${eiceblue}[load average for 1 minute]\
			\n${eorange}show_system_load${ewhite} | ${egreen}10 ${eiceblue}[load average for 10 minutes]\
			\n${eorange}show_system_load${ewhite} | ${egreen}15 ${eiceblue}[load average for 15 minutes]\n" | column -t
			tput sgr0
		;;
	esac
	if [[ $load != "" ]]; then
	tmp=$(echo $load*100 | bc)
	load100=${tmp%.*}
	if [[ $enabcol == true ]]; then
		if [[ ${load100} -lt 35 ]]; then
			loadcolor=${eblue}
		elif [[ ${load100} -ge 35 ]] && [[ ${load100} -lt 120 ]]; then
			loadcolor=${eiceblue}
		elif [[ ${load100} -ge 120 ]] && [[ ${load100} -lt 200 ]]; then
			loadcolor=${egreen}
		elif [[ ${load100} -ge 200 ]] && [[ ${load100} -lt 300 ]]; then
			loadcolor=${eyellow}
		else	loadcolor=${ered}
		fi
	fi
	echo -e $loadcolor$load
	fi
}



function show_tty()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_tty${ewhite}|${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			TTY=$(tty)
			echo ${TTY:5} | sed -e 's/\//\:/g'
		;;
	esac
}



function show_uptime() {
	# copyright 2007 - 2010 Christopher Bratusek
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_uptime${ewhite} |${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			uptime=$(</proc/uptime)
			timeused=${uptime%%.*}
			if (( timeused > 86400 )); then
			((
				daysused=timeused/86400,
				hoursused=timeused/3600-daysused*24,
				minutesused=timeused/60-hoursused*60-daysused*60*24,
				secondsused=timeused-minutesused*60-hoursused*3600-daysused*3600*24
			))
				if (( hoursused < 10 )); then
					hoursused=0${hoursused}
				fi
				if (( minutesused < 10 )); then
					minutesused=0${minutesused}
				fi
				if (( secondsused < 10 )); then
					secondsused=0${secondsused}
				fi
				output="${daysused}d ${hoursused}h:${minutesused}m:${secondsused}s"
			elif (( timeused < 10 )); then
				output="0d 00h:00m:0$(timeused)s"
			elif (( timeused < 60 )); then
				output="0d 00h:00m:${timeused}s"
			elif (( timeused < 3600 )); then
			((
				minutesused=timeused/60,
				secondsused=timeused-minutesused*60
			))
				if (( minutesused < 10 )); then
					minutesused=0${minutesused}
				fi
				if (( secondsused < 10 )); then
					secondsused=0${secondsused}
				fi
				output="0d 00h:${minutesused}m:${secondsused}s"
			elif (( timeused < 86400 )); then
			((
				hoursused=timeused/3600,
				minutesused=timeused/60-hoursused*60,
				secondsused=timeused-minutesused*60-hoursused*3600
			))
				if (( hoursused < 10 )); then
					hoursused=0${hoursused}
				fi
				if (( minutesused < 10 )); then
					minutesused=0${minutesused}
				fi
				if (( secondsused < 10 )); then
					secondsused=0${secondsused}
				fi
				output="0d ${hoursused}h:${minutesused}m:${secondsused}s"
			fi
			echo "$output"
		;;
	esac
}



###### STAT Function showing ALL info, stat options, and descriptions
function statt() { C=c;stat --h|sed '/Th/,/NO/!d;/%/!d'|while read l;do p=${l/% */};[ $p == %Z ]&&C=fc&&echo ^FS:^;echo "`stat -$C $p \"$1\"` ^$p^${l#%* }";done|column -ts^; }



function system_infos()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*cpu)
			echo -e "${ewhite}CPU:\n"
			echo -e "${eorange}Model:${eiceblue} $(grep "model name" /proc/cpuinfo | sed -e 's/.*: //g')"
			echo -e "${eorange}MHz  :${eiceblue} $(grep "cpu MHz" /proc/cpuinfo | sed -e 's/.*: //g')\n"
		;;
		*kernel)
			echo -e "${ewhite}Kernel:\n"
			echo -e "${eorange}Release:${eiceblue} $(uname -r)"
			echo -e "${eorange}Version:${eiceblue} $(uname -v)"
			echo -e "${eorange}Machine:${eiceblue} $(uname -m)\n"
		;;
		*mem | *ram)
			echo -e "${ewhite}RAM:\n"
			echo -e "${eorange}Total:${eiceblue} $(((`showmem --free`) + (`showmem --used`))) MB"
			echo -e "${eorange}Free :${eiceblue} $(showmem --free) MB"
			echo -e "${eorange}Used :${eiceblue} $(showmem --used) MB\n"
		;;
		*partitions)
			echo -e "${ewhite}Partitions:${eorange}\n"
			echo -e "major minor blocks device-node ${eiceblue}\
			\n$(cat /proc/partitions | sed -e '1,2d')" | column -t
			echo ""
		;;
		*pci)
			check_opt lspci systeminfos::pci
			if [[ $? != "1" ]]; then
				echo -e "${ewhite}PCI Devices:\n${eiceblue}"
				lspci -vkmm
				echo ""
			fi
		;;
		*usb)
			check_opt lsusb systeminfos::usb
			if [[ $? != "1" ]]; then
				echo -e "${ewhite}USB Devices:\n${eiceblue}"
				lsusb -v
				echo ""
			fi
		;;
		*mounts)
			echo -e "${ewhite}Mounts:\n${eorange}\
			\ndevice-node on mount-point type filesystem options\n" ${eiceblue} "\n\n$(mount)" | column -t
			echo ""
		;;
		*bios)
			check_opt dmidecode systeminfos::bios
			if [[ $? != "1" && $EUID == 0 ]]; then
				echo -e "${ewhite}SMBIOS/DMI Infos:${eiceblue}\n"
				dmidecode -q
			fi
		;;
		*all)
			system_infos_cpu
			system_infos_kernel
			system_infos_memory
			system_infos_partitions
			# system_infos_pci
			# system_infos_usb
			system_infos_mounts
			# system_infos_bios
		;;
		*)
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}system_infos ${ewhite}|${egreen} --cpu\t\t${eiceblue}[Display CPU Model and Freq]\
			\n${eorange}system_infos ${ewhite}|${egreen} --kernel\t${eiceblue} 	[Display Kernel Version, Release and Machine]\
			\n${eorange}system_infos ${ewhite}|${egreen} --memory\t${eiceblue} 	[Display Total, Free and Used RAM]\
			\n${eorange}system_infos ${ewhite}|${egreen} --partitions\t${eiceblue}[Display Major, Minor, Blocks and Node for all Paritions]\
			\n${eorange}system_infos ${ewhite}|${egreen} --pci\t\t${eiceblue}[Display Infos about all PCI Devices (and their kernel-module)]\
			\n${eorange}system_infos ${ewhite}|${egreen} --usb\t\t${eiceblue}[Display Infos about all USB Devices (and their kernel-module)]\
			\n${eorange}system_infos ${ewhite}|${egreen} --bios\t${eiceblue} 	[Display SMBIOS DMI Infos]\
			\n${eorange}system_infos ${ewhite}|${egreen} --mounts\t${eiceblue} 	[Display all mounted devices]\n"
			tput sgr0
		;;
	esac
}



###### shows various info on running activities
# copyright 2007 - 2010 Christopher Bratusek
function treeps() {
	ps f -u $USER -o command,pid,%cpu,%mem,time,etime,tty | \
		awk 'NR <= 1 {print;next} !/awk/ && $0~var' var=${1:-".*"}
}



###### info about current open windows
# copyright 2007 - 2010 Christopher Bratusek
function wininfo() {
	xprop | grep -w "WM_NAME\|WM_CLASS\|WM_WINDOW_ROLE\|_NET_WM_STATE"
}



##################################################
# Resizing an image				 #
##################################################

# USAGE: image_resize "percentage of image resize" "input image" "output image"
function image_resize()
{
convert -sample "$1"%x"$1"% "$2" "$3"
}



##################################################
# Search IMDB.COM				 #
##################################################

function imdb()
{
firefox "http://www.imdb.com/find?s=all&q="${@}"&x=0&y=0" &
}



##################################################
# INC						 #
##################################################

function inc() {
    let OPS=$OPS+1
    echo "* pcur $OPS"
}



##################################################
# Displays metadata for specified media file	 #
##################################################

######   $1 = media file name
function info() {
    EXT=`echo "${1##*.}" | sed 's/\(.*\)/\L\1/'`
    if [ "$EXT" == "mp3" ]; then
        id3v2 -l "$1"
        echo
        mp3gain -s c "$1"
    elif [ "$EXT" == "flac" ]; then
        metaflac --list --block-type=STREAMINFO,VORBIS_COMMENT "$1"
    else
        echo "ERROR: Not a supported file type."
    fi
}



##################################################
# Sample introduction				 #
##################################################

function intro() {
less <<INTRO
Hi, welcome to your bytesized shell :)
We've added a few shell aliases (commands) for common
things, to make your life easier, here's a quick list of
things you might want to do:
command - what it does
For more advances users:
press "q" to exit this screen
This screen will not be displayed to you in the future, if you want to see it again, type "intro"
INTRO
}



##################################################
# Kill a process by name			 #
##################################################

###### example: killps firefox-bin
function killps()
{
    local pid pname sig="-TERM" # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(myps | nawk '!/nawk/ && $0~pat { print $2 }' pat=${!#}) ; do
        pname=$(myps | nawk '$2~var { print $6 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig ? "
            then kill $sig $pid
        fi
    done
}



###### example: pskill firefox-bin
# copyright 2007 - 2010 Christopher Bratusek
function psgrep() {
	if [[ $1 == "-u" ]]; then
		ps aux | grep -v grep | grep $2 | awk '{ print $2 " : " $11}' | tee .temp
		CMDS=$(cat .temp)
	elif [[ $1 != "" ]]; then
		ps aux | grep -v grep | grep "$1" | awk '{ print $11 " : " $2 " : " $1 }' | tee .temp
		CMDS=$(cat .temp)
	fi
	if [[ $CMDS == "" ]]; then
		echo "no matching process"
	fi
	rm -f .temp
}



function pskill() {
	if [[ $1 ]]; then
		psgrep $1
		shift
		if [[ $CMDS != "" ]]; then
			echo -e "\nenter process number to kill:\n"
			read ID
			if [[ ! $ID == 0 || ! $ID == "" ]]; then
				kill $@ $ID
			fi
		fi
	fi
}



##################################################
# Led set and reset				 #
##################################################

function kitt() {
	# copyright 2007 - 2010 Christopher Bratusek
	setleds -L -num;
	setleds -L -caps;
	setleds -L -scroll;
	while :; do
		setleds -L +num;
		sleep 0.2;
		setleds -L -num;
		setleds -L +caps;
		sleep 0.2;
		setleds -L -caps;
		setleds -L +scroll;
		sleep 0.2;
		setleds -L -scroll;
		setleds -L +caps;
		sleep 0.2;
		setleds -L -caps;
	done
	resetleds
}



function resetleds()
# copyright 2007 - 2010 Christopher Bratusek
{
	setleds -L < /dev/tty1
}



##################################################
# Concatenate stuff				 #
##################################################

function kitty() {
	# copyright 2007 - 2010 Christopher Bratusek
	cat -n "$@"
}



##################################################
# Advanced ls functions				 #
##################################################

function la() {
	# copyright 2007 - 2010 Christopher Bratusek
	ls -A --group-directories-first "$@"
}



function lg() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ "$@" == "" ]]; then
		$@="*"
	fi
	ls -l --group-directories-first "$@" | gawk '{print $9, "belongs to Group ->", $4}' | column -t
}



function ll() {
	# copyright 2007 - 2010 Christopher Bratusek
	ls -l --group-directories-first "$@"
}



###### Counts files, subdirectories and directory size and displays details
# about files depending on the available space
function lls() {
	# count files
	echo -n "<`find . -maxdepth 1 -mindepth 1 -type f | wc -l | tr -d '[:space:]'` files>"
	# count sub-directories
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d '[:space:]'` dirs/>"
	# count links
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type l | wc -l | tr -d '[:space:]'` links@>"
	# total disk space used by this directory and all subdirectories
	echo " <~`du -sh . 2> /dev/null | cut -f1`>"
	ROWS=`stty size | cut -d' ' -f1`
	FILES=`find . -maxdepth 1 -mindepth 1 |
	wc -l | tr -d '[:space:]'`
	# if the terminal has enough lines, do a long listing
	if [ `expr "${ROWS}" - 6` -lt "${FILES}" ]; then
		ls
	else
		ls -hlAF --full-time
	fi
}



function lo() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ "$@" == "" ]]; then
		$@="*"
	fi
	ls -l --group-directories-first "$@" | gawk '{print $9, "belongs to User ->", $3}' | sed -e '1d' | column -t
}



function l1() {
	# copyright 2007 - 2010 Christopher Bratusek
	ls -1 --group-directories-first "$@"
}




function lm() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ ! "$@" == "" ]]; then
		for file in "$@"; do
			stat -c "%A %a %n" "$file" | gawk '{print "Permissions of:", $3, "->", $1, "("$2")"}'
		done | column -t
	fi
}



###### inspired by http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x279.html
# but I made it a single awk instead of an awk, forloop and a bc
# asumes we have awk available.  but really, who doesnt have awk?
# let's get the size of the files in this dir
function lsbytes() {
    echo -n $(ls -l | awk '/^-/{total += $5} END{printf "%.2f", total/1048576}')
}



function lscd() {
	# copyright 2007 - 2010 Christopher Bratusek
	builtin cd "${@}" &>/dev/null
	. $BSNG_RC_DIR/dirinfo/display
	dirinfo_display
	echo -e "${epink}content:"
	ls $LSCD_OPTS
	echo "$PWD" > $HOME/.lastpwd
}



###### display long list of files with the given extension
# example: lsext txt
function lsext()
{
find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
}



###### another way to call for a list of files/folders
function lsr() { /bin/ls -l "$@"/..namedfork/rsrc ; }



##################################################
# Uppercase, lowercase, & cleanup strings & names#
##################################################

###### lowercase all files in the current directory
function lcfiles() {
	print -n 'Really lowercase all files? (y/n) '
	if read -q ; then
		for i in * ; do
			mv $i $i:l
	done
	fi
}



###### Convert the first letter into lowercase letters
function lcfirst() {
      if [ -n "$1" ]; then
          perl -e 'print lcfirst('$1')'
      else
          cat - | perl -ne 'print lcfirst($_)'
      fi
}



###### move filenames to lowercase
function lowercase()
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: $file not changed."
        fi
    done
}



###### Remove whitespace at the beginning of a string
#  @param string $1 string (optional, can also handle STDIN)
#  @return string
#  @example:    echo " That is a sentinece " | trim
function ltrim() {
      if [ -n "$1" ]; then
              echo $1 | sed 's/^[[:space:]]*//g'
      else
              cat - | sed 's/^[[:space:]]*//g'
      fi
}



###### Space removal and lowercases folders in current dir.
function rmspaces() {
    ls | while read -r FILE
        do
        mv -v "$FILE" `echo $FILE | tr ' ' '_' | tr -d '[{}(),\!]' | tr -d "\'" | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g'`
        done
}



###### Remove whitespace at the end of a string
#  @param string $1 string (optional, can also handle STDIN)
#  @return string
#  @example:    echo "That is a sentinece " | rtrim
function rtrim() {
      if [ -n "$1" ]; then
              echo $1 | sed 's/[[:space:]]*$//g'
      else
              cat - | sed 's/[[:space:]]*$//g'
      fi
}



###### Cut a string after X chars and append three points
# string strim( string string [, int length ] )
function strim() {
      local string="$1"
      local length=${2:-30}
      [ "${#string}" -gt ${length} ] && string="${string:0:${length}}..."
      echo $string
}



###### Convert all alphabetic characters to lowercase
#  @param string $1|STDIN string
#  @return string
function strtolower() {
      if [ -n "$1" ]; then
      	echo $1 | tr '[:upper:]' '[:lower:]'
      else
      	cat - | tr '[:upper:]' '[:lower:]'
      fi
}



###### Convert all alphabetic characters converted to uppercase
#  @param string $1|STDIN string
#  @return string
function strtoupper() {
      if [ -n "$1" ]; then
      	echo $1 | tr '[:lower:]' '[:upper:]'
      else
      	cat - | tr '[:lower:]' '[:upper:]'
      fi
}



###### Remove whitespace at the beginning and end of a string
#  @param string $1 string (optional, can also handle STDIN)
#  @return string
#  @example:    echo " That is a sentinece " | trim
function trim() {
      if [ -n "$1" ]; then
              echo $1 | sed 's/^[[:space:]]*//g' | sed 's/[[:space:]]*$//g'
      else
              cat - | sed 's/^[[:space:]]*//g' | sed 's/[[:space:]]*$//g'
      fi
}



###### Convert the first letter into uppercase letters
function ucfirst() {
      if [ -n "$1" ]; then
          perl -e 'print ucfirst('$1')'
      else
          cat - | perl -ne 'print ucfirst($_)'
      fi
}




###### Converts first letter of each word within a string into an uppercase, all other to lowercase
#     string ucwords( string string )
function ucwords() {
      local string="$*"
      for word in $string; do
          # Get the first character with cut and convert them into uppercase.
          local first="$( echo $word | cut -c1 | tr '[:lower:]' '[:upper:]' )"
          # Convert the rest of the word into lowercase and append them to the first character.
          word="$first$( echo $word | cut -c2-${#word} | tr '[:upper:]' '[:lower:]' )"
          # Put together the sentence.
          local phrase="$phrase $word"
      done
      echo "$phrase"
}



##################################################
# Corporate ldapsearch for users		 #
##################################################

function ldapfind() {
        ldapsearch -x -h ldap.foo.bar.com -b dc=bar,dc=com uid=$1
}



##################################################
# Organize a text file				 #
##################################################

###### sort lines in a text file
function linesort()
{
sort -u "$1" > "$1".new
}



###### remove duplicate lines in a file (without resorting)
function removeduplines()
{
awk '!x[$0]++' "$1" > "$1".new
}



##################################################
# Livehttpheaders (firefox addon) replacement	 #
##################################################

###### usage: liveh [-i interface] [output-file] && firefox &
function liveh() { tcpdump -lnnAs512 ${1-} tcp |sed ' s/.*GET /GET /;s/.*Host: /Host: /;s/.*POST /POST /;/[GPH][EOo][TSs]/!d;w '"${2-liveh.txt}"' ' >/dev/null ; }



##################################################
# Search for music in the specified location	 #
##################################################

function locatemusic()
{
slocate -i "${1}" | grep "$HOME/Music/";
}



##################################################
# Use a logger					 #
##################################################

function log() {
    echo "$1" 1>&2
    logger -ist "$(basename -- "$0")" "$1"
}



##################################################
# List your MACs address			 #
##################################################

function lsmac() { ifconfig -a | awk '/HWaddr/ {print $5}' ; }



##################################################
# MPD music stuff				 #
##################################################

###### Add music files in MPD
function madd()
{
    # while [ $# -gt 0 ]; do
        # case "$1" in
            # a)
            # args[i++]=artist;;
            # b)
            # args[i++]=album;;
            # t)
            # args[i++]=title;;
            # *)
            # args[i++]=$1;;
        # esac; shift;
    # done
    # mpc search "${args[@]}" |
    mpc search "$@" |
    mpc add
}



###### Clear, add and play: MPD
function mcap()
{
    mpc clear
    # while [ $# -gt 0 ]; do
        # case "$1" in
            # a)
            # args[i++]=artist;;
            # b)
            # args[i++]=album;;
            # t)
            # args[i++]=title;;
            # *)
            # args[i++]=$1;;
        # esac; shift; done
    # mpc search "${args[@]}" |
    mpc search "$@" |
    mpc add
    mpc play
}



##################################################
# Mailme					 #
##################################################

function mailme()
{
	echo "$@" | mail -s "$1" $SERVERMAIL
}



##################################################
# Manpage to ... document			 #
##################################################

###### example:	man2pdf wipe	=	wipe.pdf
# copyright 2007 - 2010 Christopher Bratusek
function man2pdf()
{
	case $1 in
		*help | "" )
			echo -e "\n${ewhite}Usage:"
			echo -e	"\n${eorange}man2pdf${ewhite} |${egreen} <manualpage>${eiceblue} [generate a pdf from <manualpage>]\n"
			tput sgr0
		;;
		* )
			check_opt ps2pdf man2pdf
			if [[ $? != "1"  && $1 ]]; then
				man -t $1 | ps2pdf - >$1.pdf
			else	echo "No manpage given."
			fi
		;;
	esac
}



###### example:	man2text wipe	=	wipe.txt
function man2text()
{
man "$1" | col -b > ~/man_"$1".txt
}



##################################################
# .. And function				 #
##################################################

function man_()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -F -a "$i"
    done
}



##################################################
# Map a command over a list of files - map-files #
# /lib *.so ls -la				 #
##################################################

function map-files() { find $1 -name $2 -exec ${@:3} {} \ ; }



##################################################
# Meta-Backup - backup your software selection 	 #
# and repositories in a deb meta package	 #
##################################################

function meta-backup()
{
## Written by Arjan van Lent aka socialdefect ## VERSION: 2.1 ## Modified by Inameiname
DIALOG1="Did you enable extra repositories or PPAs on this system?. If you have no idea what this is just enter no"
DIALOG2="Your backup has been created succesfully"
DIALOG3="Something went wrong. Type bash -x meta-backup in a terminal to debug"
DIALOG4="Would you like to use the backup for a distribution upgrade?"
DIALOG5="Enter the codename of the distribution you'd like to upgrade to. eg. sid or maverick"
DIALOG6="Where woud you like to save your backup files? Enter full path. eg /home/username/backups"
mkdir -p /tmp/meta-backup/my-meta-backup/DEBIAN						## creating build directories
  dialog --title "Meta-backup" --yesno "$DIALOG1" 8 40					## repository dialog ## question add repo's
  dialog --title "Meta-backup" --infobox "..." 8 40
if [ $? = 0 ] ; then
  mkdir -p /tmp/meta-backup/my-repo-backup/etc/apt/sources.list.d
  mkdir /tmp/meta-backup/my-repo-backup/DEBIAN
  cp -R /etc/apt/sources.list.d/* /tmp/meta-backup/my-repo-backup/etc/apt/sources.list.d/
  cp -R /etc/apt/sources.list /tmp/meta-backup/my-repo-backup/etc/apt/
fi
											## create the control file for the repo-backup
echo 'Section: misc
Priority: optional
Package: my-repo-backup
Version: 2.1
Maintainer: meta-backup
Depends:
Architecture: all
Description: Repository/PPA backup created by meta-backup.
 Repository/PPA backup created by meta-backup. This package can be used to install all repositories and PPAs that are installed on the computer where the backup is made.' >> /tmp/meta-backup/my-repo-backup/DEBIAN/control
											## create the preinst file for the repo-backup
echo '#!/bin/sh
set -e
# Backup repo config
mv /etc/apt/sources.list /etc/apt/sources.list.old
mv /etc/apt/sources.list.d /etc/apt/sources.list.d.old' >> /tmp/meta-backup/my-repo-backup/DEBIAN/preinst
chmod +x /tmp/meta-backup/my-repo-backup/DEBIAN/preinst
											## create the postinst file for the repo-backup
echo '#!/bin/sh
set -e
# Pubkeys (to generate this large key, which is all of them in one: sudo apt-key exportall > /tmp/repokeys.key)
if [ -f /tmp/repokeys.key ];then
	rm /tmp/repokeys.key
fi
sudo cat > "/tmp/repokeys.key" <<"End-of-message"' >> /tmp/meta-backup/my-repo-backup/DEBIAN/postinst
  ## get the repository keys
apt-key exportall >> /tmp/meta-backup/my-repo-backup/DEBIAN/postinst
echo 'End-of-message
if which sudo apt-key >> /dev/null; then
	if sudo apt-key add "/tmp/repokeys.key"; then
		echo "OK - repokeys key was installed"
	else
		echo "ERROR: there was a problem installing the repokeys-key"
	fi
fi
sudo rm -fv "/tmp/repokeys.key"' >> /tmp/meta-backup/my-repo-backup/DEBIAN/postinst
chmod +x /tmp/meta-backup/my-repo-backup/DEBIAN/postinst
											## create the postrm file for the repo-backup
echo '#!/bin/sh
set -e
# Restore repo config
mv /etc/apt/sources.list.old /etc/apt/sources.list
mv /etc/apt/sources.list.d.old /etc/apt/sources.list.d' >> /tmp/meta-backup/my-repo-backup/DEBIAN/postrm
chmod +x /tmp/meta-backup/my-repo-backup/DEBIAN/postrm
dialog --title "Meta-backup" --yesno "$DIALOG4" 8 40					## Distupgrade feature
  dialog --title "Meta-backup" --infobox "..." 8 40
if [ $? = 0 ] ; then
    dialog --title "Meta-backup" --inputbox "$DIALOG5" 8 40 2> /tmp/meta-backup/upgrade
    UPGRADE=`cat /tmp/meta-backup/upgrade`
    dialog --title "Meta-backup" --infobox "..." 8 40
fi
if [ $UPGRADE = 0 ] ; then
  MYDIST=`lsb_release -cs`
  sed 's/$MYDIST/$UPGRADE/' /tmp/meta-backup/myrepo-backup/etc/apt/sources.list
  sed 's/$MYDIST/$UPGRADE/' /tmp/meta-backup/myrepo-backup/etc/apt/sources.list.d/*
fi											## end dist upgrade feature
  DEPS=`aptitude search -F %p ~i --disable-columns | sed 's/$/,/' | tr '\n\r' ' ' | sed 's/, $//'`	## get list of inst. packages to fill DEPS variable
											## create the control file for the meta-backup
echo "Section: misc
Priority: optional
Package: my-meta-backup
Version: 2.1
Maintainer: meta-backup
Depends: $DEPS
Architecture: all
Description: Personal system backup created by meta-backup
 Personal system backup created by meta-backup. This package can be used to install all applications that are installed on the computer where the backup is made. Can be used on all systems using the same base system version as used on the backup machine." >> /tmp/meta-backup/my-meta-backup/DEBIAN/control
cd /tmp/meta-backup && dpkg --build my-meta-backup					## build and save the package(s)
if [ $? = 0 ] ; then
    cd /tmp/meta-backup && dpkg --build my-repo-backup
fi
ls /tmp/meta-backup/my-meta-backup.deb							## finish backup
  if [ $? = 0 ] ; then
    ERROR=no
    else ERROR=yes
  fi
ls /tmp/meta-backup/my-repo-backup.deb
  if [ $? = 0 ] ; then
    ERROR=no
  else ERROR=yes
  fi
dialog --title "Meta-backup" --inputbox "$DIALOG6" 8 40 2> /tmp/meta-backup/save	## move the debs to selected location
    SAVE=`cat /tmp/meta-backup/save`
    dialog --title "Meta-backup" --infobox "..." 8 40
    ls $SAVE
  if [ $? = 0 ] ; then
    mv /tmp/meta-backup/*.deb $SAVE
    chmod 777 $SAVE/my-*-backup.deb
  else
    mkdir -p $SAVE
    mv /tmp/meta-backup/*.deb $SAVE
    chmod -R 777 $SAVE
  fi
if [ $ERROR = no ] ; then								## Display exit message
  dialog --title "Meta-backup" --infobox "$DIALOG2" 8 40
 else
  dialog --title "Meta-backup" --infobox "$DIALOG3" 8 40
fi
rm -rf /tmp/meta-backup									## cleaning up
}



##################################################
# Automatically inputs aliases here in		 #
# '.bashrc'					 #
##################################################

###### Usage: mkalias <name> "<command>"
# Example: mkalias rm "rm -i"
function mkalias()
{
        if [[ $1 && $2 ]]
        then
        echo -e "alias $1=\"$2\"" >> ~/.bashrc
        alias $1=$2
        fi
}



##################################################
# Makes directory then moves into it		 #
##################################################

function mkcdr() {
    mkdir -p -v $1
    cd $1
}



function mkdircd()	{ mkdir -p "$@" && eval cd "\"\$$#\""; }



##################################################
# Creates an archive from directory		 #
##################################################

function mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }



function mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }



function mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }



##################################################
# Reminder / to do list				 #
##################################################

function mnote()
{
    echo -e "- $* \n" >> ~/todo
    echo -e "- $* \n" >> ~/todo.perm
    ~/motd.pl
}



##################################################
# Morse code encoding and decoding		 #
##################################################

###### this is a short Morse code decoder written as a shellscript using sed
# the Morse coded text should be written with spaces between the letters
# only good to convert from Morse code to text
# by scvalex
function morse2text()
{
echo $1\  | tr . 0 | sed -e {s/0----\ /1/g} -e {s/00---\ /2/g} -e {s/000--\ /3/g} -e {s/000-\ /4/g} -e {s/00000\ /5/g} -e {s/-0000\ /6/g} -e {s/--000\ /7/g} -e {s/---00\ /8/g} -e {s/----0\ /9/g} -e {s/-----\ /0/g} \
	| sed -e {s/-0-0\ /c/g} -e {s/-000\ /b/g} -e {s/00-0\ /f/g} -e {s/0000\ /h/g} -e {s/0---\ /j/g} -e {s/0-00\ /l/g} -e {s/0--0\ /p/g} -e {s/--0-\ /q/g} -e {s/000-\ /v/g} -e {s/-00-\ /x/g} -e {s/-0--\ /y/g} -e {s/--00\ /z/g} \
	| sed -e {s/0--\ /w/g} -e {s/-00\ /d/g} -e {s/--0\ /g/g} -e {s/-0-\ /k/g} -e {s/---\ /o/g} -e {s/0-0\ /r/g} -e {s/000\ /s/g} -e {s/00-\ /u/g} \
	| sed -e {s/0-\ /a/g} -e {s/00\ /i/g} -e {s/--\ /m/g} -e {s/-0\ /n/g} \
	| sed -e {s/0\ /e/g} -e {s/-\ /t/g}
}



function text2morse()
{
cat > "/tmp/text2morse.py" <<"End-of-message"
#!/usr/bin/python
# short mark, dot or 'dit' (.) = .
# longer mark, dash or 'dah' (-) = -
# intra-character gap (between the dots and dashes within a character) = no space
# short gap (between letters) = single space
# medium gap (between words) = double space
import sys
__author__="Aanand Natarajan"
# morse code dictionary
codes = {'1':".----",'2':"..---",'3':"...--",'4':"....-",'5':".....",'6':"-....",'7':"--...",'8':"---..",
'9':"----.",'0':"-----",'A':".-",'B':"-...",'C':"-.-.",'D':"-..",'E':".",'F':"..-.",'G':"--.",
'H':"....",'I':"..",'J':".---",'K':"-.-",'L':".-..",'M':"--",'N':"-.",'O':"---",'P':".--.",
'Q':"--.-",'R':".-.",'S':"...",'T':"-",'U':"..-",'V':"...-",'W':".--",'X':"-..-",'Y':"-.--",
'Z':"--..",
# punctuations
',':"--..--",'.':".-.-.-",'?':"..--..",';':"-.-.-",':':"---...",'/':"-..-.",
'-':"-....-","'":".----.",'(':"-.--.",')':"-.--.-",'!':"-.-.--",'&':".-...",
'=':"-...-",'+':".-.-.",'_':"..--.-",'"':".-..-.",'$':"...-..-",'@':".--.-.",
# space
' ':"|"}
binary = {'.':'.','-':'-',',':' ','|':'  '}
def encode(value):
    """ encodes the value into morse code """
    morse_value=""
    value.replace('*', 'X')
    value.replace('^', 'XX')
    for c in value:
       try :
               morse_value += codes[c.upper()]+','
       except :
         print "Unintended character " + c + " omitted"
    return _get_binary(morse_value)
def decode(morse_code_value):
    """ decodes the morse bytes """
    decoded_value = _decode_binary(morse_code_value)
    ascii_value=""
    for v in decoded_value.split(","):
        ascii_value += _get_key(v)
    return ascii_value
def _get_binary(value):
     binary_value = ""
     for c in value:
         binary_value += binary[c]
     return binary_value
def _get_key(value):
     """ returns the key for the given value """
     for k,v in codes.items():
         if v == value:
            return k
     return ''
def _decode_binary(binary):
    dah_replaced = binary.replace('-', '-')
    dit_replaced = dah_replaced.replace('.', '.')
    comma_replaced = dit_replaced.replace(' ', ',')
    zero_replaced = comma_replaced.replace('', '|,')
    return zero_replaced
def _do_decode(value):
    print "Decoded : "+decode(value)
def _do_encode(value):
    print "Encoded : "+encode(value)
if __name__ == "__main__":
   if len(sys.argv) > 2:
      if sys.argv[1] == 'd' :
         print "decoding"
         _do_decode(sys.argv[2])
      else:
         print "encoding"
         _do_encode(sys.argv[2])
   elif len(sys.argv) > 1:
        print "encoding"
        _do_encode(sys.argv[1])
   else:
        print "Usage : "+sys.argv[0]+" [d (decode) |e (encode)] [input string]"
End-of-message
chmod +x "/tmp/text2morse.py"
"/tmp/text2morse.py" "$1"
rm "/tmp/text2morse.py"
}



##################################################
# Computes most frequent used words of text file #
##################################################

###### usage:	most_frequent "file.txt"
function most_frequent()
{
cat "$1" | tr -cs "[:alnum:]" "\n"| tr "[:lower:]" "[:upper:]" | awk '{h[$1]++}END{for (i in h){print h[i]" "i}}'|sort -nr | cat -n | head -n 30
}



##################################################
# Mount Fat					 #
##################################################

function mount_fat()
{
    local _DEF_PATH="/media/tmp1"
    if [ -n "$2" ];then
        sudo mount -t vfat -o rw,users,flush,umask=0000 "$1" "$2"
    else
        sudo mount -t vfat -o rw,users,flush,umask=0000 "$1" $_DEF_PATH
    fi
}



##################################################
# Youtube stuff					 #
##################################################

###### stream YouTube videos directly to your media player
function mtube() {
  video_id=$(curl -s $1 | sed -n "/watch_fullscreen/s;.*\(video_id.\+\)&title.*;\1;p");
  mplayer -fs $(echo "http://youtube.com/get_video.php?$video_id");
}



alias mtube_='mplayer -fs $(echo "http://youtube.com/get_video.php?$(curl -s "$1" | sed -n "/watch_fullscreen/s;.*\(video_id.\+\)&title.*;\1;p")")'



###### Youtube-dl
alias yt='youtube-dl -t '



###### YouTube convert and download all user's videos to MP3s on the fly
function yt2mp3() { for j in `seq 1 301`;do i=`curl -s gdata.youtube.com/feeds/api/users/$1/uploads\?start-index=$j\&max-results=1|grep -o "watch[^&]*"`;ffmpeg -i `wget youtube.com/$i -qO-|grep -o 'url_map"[^,]*'|sed -n '1{s_.*|__;s_\\\__g;p}'` -vn -ab 128k "`youtube-dl -e ${i#*=}`.mp3";done;}



function yt2mp3-chanrip() { for count in 1 51 101 151 201 251 301; do for i in $(curl -s http://gdata.youtube.com/feeds/api/users/"$1"/uploads\?start-index="$count"\&max-results=50 | grep -Eo "watch\?v=[^[:space:]\"\'\\]{11}" | uniq); do ffmpeg -i $(wget http://youtube.com/"$i" -qO- | sed -n "/fmt_url_map/{s/[\'\"\|]/\n/g;p}" | sed -n '/^fmt_url_map/,/videoplayback/p' | sed -e :a -e '$q;N;5,$D;ba' | tr -d '\n' | sed -e 's/\(.*\),\(.\)\{1,3\}/\1/') -vn -ab 128k "$(youtube-dl -e http://youtube.com/"$i").mp3"; done; done; unset count i; }



###### convert to ogg
function yt2ogg() {
	# copyright 2007 - 2010 Christopher Bratusek
	ffmpeg -i "$1" -vn "$1".ogg
}



###### play YouTube's first match directly
function ytplay() { args="$*";mplayer -fs $(youtube-dl -g "http://www.youtube.com$(lynx --source "http://www.youtube.com/results?search_query=${args// /+}&aq=f"|grep -m1 '<a id=.*watch?v=.*title'|cut -d\" -f4)"); }



###### download entire YouTube channel - all of a user's videos					 #
function yt-chanrip() { for i in $(curl -s http://gdata.youtube.com/feeds/api/users/"$1"/uploads | grep -Eo "watch\?v=[^[:space:]\"\'\\]{11}" | uniq); do youtube-dl --title --no-overwrites http://youtube.com/"$i"; done }



###### download YouTube music playlist and convert it to mp3 files
function yt-pl2mp3() { umph -m 50 $1 | cclive -f mp4_720p; IFS=$(echo -en "\n\b"); for track in $(ls | grep mp4 | awk '{print $0}' | sed -e 's/\.mp4//'); do (ffmpeg -i $track.mp4 -vn -ar 44100 -ac 2 -ab 320 -f mp3 $track.mp3); done; rm -f *.mp4 ; }



##################################################
# Find artist and title of music cd, UPC code 	 #
# given						 #
##################################################

function musiccdinfo()
{
wget http://www.discogs.com/search?q=724349691704 -O foobar &> /dev/null ; grep \/release\/ foobar | head -2 | tail -1 | sed -e 's/^<div>.*>\(.*\)<\/a><\/div>/\1/' ; rm foobar
}



##################################################
# Query Wikipedia via console over DNS		 #
##################################################

function mwiki() { blah=`echo $@ | sed -e 's/ /_/g'`; dig +short txt $blah.wp.dg.cx; }



# function mwiki() { dig +short txt `echo $*|sed 's| *|_|g'`.wp.dg.cx; }



##################################################
# User friendly ps				 #
##################################################

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }



function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }



function psaux() {
    [ $# == 1 ] && ps aux | grep $1
}



##################################################
# Editor startup, should be transparent for 	 #
# different versions				 #
##################################################

# function ned()
# {   if [[ -n `which neditc` ]] ; then
#         neditc $@
#     elif [[ -n `which nedit` ]] ; then
#         nedit $@ >&/dev/null &
#     else
#         echo NEdit does not appear to be on this computer.
#     fi
# }



##################################################
# Download all data from Google Ngram Viewer	 #
##################################################

function ngramviewerdl()
{
wget -qO - http://ngrams.googlelabs.com/datasets | grep -E href='(.+\.zip)' | sed -r "s/.*href='(.+\.zip)'.*/\1/" | uniq | while read line; do `wget $line`; done
}



##################################################
# Run command detached from terminal and without #
# output					 #
##################################################

###### Usage: nh
function nh() {
    nohup "$@" &>/dev/null &
}



##################################################
# Stupid simple note taker			 #
##################################################

function note()
{
        # if file doesn't exist, create it
        [ -f $HOME/.notes ] || touch $HOME/.notes
        # no arguments, print file
        if [ $# = 0 ]
        then
                cat $HOME/.notes
        # clear file
        elif [ $1 = -c ]
        then
                > $HOME/.notes
        # add all arguments to file
        else
                echo "$@" >> $HOME/.notes
        fi
}



##################################################
# Open a new terminal tab in the same directory  #
# as the current				 #
##################################################

###### SOURCE => http://pastie.caboo.se/188640
#    AND => http://justinfrench.com/index.php?id=231
function nth() {
  osascript -e "
  Tell application \"Terminal\"
    activate
    tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
    do script with command \"cd '$(pwd)'; clear\" in selected tab of the front window
  end tell"
}



##################################################
# Remove apps with style: nuke it from orbit	 #
##################################################

###### You can't stand programs x, y, and z. Remove all trace of their existence by adding this function to your config. It will remove the cruft, the settings, #and such and such. This function doesn't even give a damn about you trying to remove programs that don't exist: it'll just for loop to the next one on #your hit list.
function nuke() { if [ $(whoami) != "root" ] ; then for x in $@; do sudo apt-get autoremove --purge $x; done; else for x in $@; do apt-get autoremove --purge $x; done; fi }




##################################################
# Echo the lines of a file preceded by line	 #
# number					 #
##################################################

function numberLines() { perl -pe 's/^/$. /' "$@" ; }



##################################################
# How many pages will my text files print on?	 #
##################################################

function numpages() { echo $(($(wc -l $* | sed -n 's/ total$//p')/60)); }



##################################################
# Open a GUI app from CLI			 #
##################################################

function open() {
  $1 >/dev/null 2>&1 &
}



##################################################
# Convert a single-page PDF to a hi-res PNG, at  #
# 300dpi					 #
##################################################

###### If you skip this part: -density 300x300, you'll get a very lo-res image
function pdf2png()
{
convert -density 300x300 $1 $2
}



##################################################
# Optimize PNG files				 #
##################################################

function pngoptim()
{
       NAME_="pngoptim"
       HTML_="optimize png files"
    PURPOSE_="reduce the size of a PNG file if possible"
   SYNOPSIS_="$NAME_ [-hl] <file> [file...]"
   REQUIRES_="standard GNU commands, pngcrush"
    VERSION_="1.0"
       DATE_="2004-06-29; last update: 2004-12-30"
     AUTHOR_="Dawid Michalczyk <dm@eonworks.com>"
        URL_="www.comp.eonworks.com"
   CATEGORY_="gfx"
   PLATFORM_="Linux"
      SHELL_="bash"
 DISTRIBUTE_="yes"
# This program is distributed under the terms of the GNU General Public License
usage() {
echo >&2 "$NAME_ $VERSION_ - $PURPOSE_
Usage: $SYNOPSIS_
Requires: $REQUIRES_
Options:
     -h, usage and options (this help)
     -l, see this script"
exit 1
}
# tmp file set up
tmp_1=/tmp/tmp.${RANDOM}$$
# signal trapping and tmp file removal
trap 'rm -f $tmp_1 >/dev/null 2>&1' 0
trap "exit 1" 1 2 3 15
# var init
old_total=0
new_total=0
# arg handling and main execution
case "$1" in
    -h) usage ;;
    -l) more $0; exit 1 ;;
     *.*) # main execution
        # check if required command is in $PATH variable
        which pngcrush &> /dev/null
        [[ $? != 0 ]] && { echo >&2 required \"pngcrush\" command is not in your PATH; exit 1; }
        for a in "$@";do
            if [ -f $a ] && [[ ${a##*.} == [pP][nN][gG] ]]; then
                old_size=$(ls -l $a | { read b c d e f g; echo $f ;} )
                echo -n "${NAME_}: $a $old_size -> "
                pngcrush -q $a $tmp_1
                rm -f -- $a
                mv -- $tmp_1 $a
                new_size=$(ls -l $a | { read b c d e f g; echo $f ;} )
                echo $new_size bytes
                (( old_total += old_size ))
                (( new_total += new_size ))
            else
                echo ${NAME_}: file $a either does not exist or is not a png file
            fi
        done ;;
    *) echo ${NAME_}: skipping $1 ; continue ;;
esac
percentage=$(echo "scale = 2; ($new_total*100)/$old_total" | bc)
reduction=$(echo $(( old_total - new_total )) \
| sed '{ s/$/@/; : loop; s/\(...\)@/@.\1/; t loop; s/@//; s/^\.//; }')
echo "${NAME_}: total size reduction: $reduction bytes (total size reduced to ${percentage}%)"
}



##################################################
# Display text of ODF document in terminal	 #
##################################################

######   $1 = ODF file
function o3() { unzip -p "$1" content.xml | o3totxt | utf8tolatin1; }



##################################################
# Random data overwriting			 #
##################################################

function overwriter()
{
# The author of this script, Elias Amaral,
# claims no copyright over it.
# http://iamstealingideas.wordpress.com/2010/05/20/writing-random-data-to-a-hard-drive-again
msg() {
  printf "\n - $1\n\n" $2
}
mbs=4 # 4mb
blocksize=$(($mbs * 1024 * 1024))
dev=$1
if [[ -z $dev ]]; then
  msg "usage: $0 <device>"; exit
elif [[ ! -b $dev ]]; then
  msg "$dev: not a block device"; exit
elif [[ ! -w $dev ]]; then
  msg "$dev: no write permission"; exit
elif grep -q $dev /etc/mtab; then
  msg "$dev: mounted filesystem on device, omgomg!"; exit
fi
cat <<end
This program writes random data to a hard disk.
It is intended to be used before storing encrypted data.
It may contain bugs (but seems to work for me).
It seems you have chosen to wipe data from the disk $dev.
Here is the partition table of this disk:
end
fdisk -l $dev
echo
echo 'Are you sure you want to proceed?'
msg 'WARNING: IT WILL DESTROY ALL DATA ON THE DISK'
read -p 'Type uppercase yes if you want to proceed: ' q
if [[ $q != YES  ]]; then
  exit
fi
while
  echo $i > step.new
  mv step.new step
  msg 'Writing at offset %s' $(($mbs * $i))M
  openssl rand \
          -rand /dev/urandom \
          $blocksize | \
  dd of=$dev \
     bs=$blocksize \
     seek=$i
do
  let i++
done
msg Finished.
}



alias overwriter_='sudo dd if=/dev/zero bs=1M | openssl bf-cbc -pass pass:`cat /dev/urandom | tr -dc [:graph:] | head -c56` | sudo dd of=$dev bs=1M'



##################################################
# Ownership Changes { own file user }		 #
##################################################

function own() { chown -R "$2":"$2" ${1:-.}; }



##################################################
# Hold/Unhold packages				 #
##################################################

function packagehold()
{
echo -n "Please enter the package you wish to put a hold on:
"
read progID
echo "$progID hold" |sudo dpkg --set-selections
}



function packageunhold()
{
echo -n "Please enter the package you wish to remove the hold on:
"
read progID
echo "$progID install" |sudo dpkg --set-selections
}



##################################################
# Download all installed deb packages from 	 #
# official repos currently on system		 #
##################################################

function packagelistdl()
{
sudo dpkg --get-selections | awk '{ print $1};' | while read package; do apt-cache show "$package"| wget -c 'http://ae.archive.ubuntu.com/ubuntu/'`sed -ne '/^Filename/s/^Filename: //p'`; done
}



##################################################
# Pacman Search					 #
##################################################

function pacsearch() {
       echo -e "$(pacman -Ss $@ | sed \
       -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
       -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
       -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
       -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
}



##################################################
# Removes duplicate paths			 #
##################################################

###### NOTE: symlinks aren't dereferenced (e.g., using `readlink`) as they may
# exist for compatibility reasons
function pathremove() {
    local IFS=':'
    local newpath
    local i

    for i in ${!2}; do
        if [ "$i" != "$1" ]; then
            newpath=${newpath:+$newpath:}$i
        fi
    done
    export $2="$newpath"
}



##################################################
# Print character classes			 #
##################################################

function pcharc() { perl -e 'for (0..255) {$_ = chr($_); print if /['$1']/}' | cat -v; echo; }



##################################################
# Quick plot of numbers on stdin (can also pass	 #
# plot paramaters)				 #
##################################################

# requires gnuplot: sudo apt-get install gnuplot
# example: seq 1000 | sed 's/.*/s(&)/' | bc -l | plot linecolor 2
function plot() { { echo 'plot "-"' "$@"; cat; } | gnuplot -persist; }



##################################################
# Scans a port, returns what's on it.		 #
##################################################

function port() {
lsof -i :"$1"
}



##################################################
# Portscan in one line				 #
##################################################

function portscan()
{
$HOST=127.0.0.1;for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done
}



##################################################
# Find the printer driver (ppd) type being used	 #
##################################################

function printdriver() {
        lpoptions -d $1 | grep -oe "printer-make-and-model='.*'" | cut -f2 -d "=" | sed -r s/\'//g
}



##################################################
# Print a row of characters across the terminal	 #
##################################################

###### Default character is "=", default color is white
function println()
{
echo -n -e "\e[038;05;${2:-255}m";printf "%$(tput cols)s"|sed "s/ /${1:-=}/g"
}



##################################################
# Run program on a timer			 #
##################################################

###### Example: program-timer 20 viewnior arg1
function program-timer() { perl -e 'alarm shift; exec @ARGV' "$@" & exit; }



##################################################
# Progress visuals				 #
##################################################

function progressbar()
# copyright 2007 - 2010 Christopher Bratusek
{
	SP_COLOUR="\e[37;44m"
	SP_WIDTH=5.5
	SP_DELAY=0.2
	SP_STRING=${2:-"'|/=\'"}
	while [ -d /proc/$1 ]
	do
		printf "$SP_COLOUR\e7  %${SP_WIDTH}s  \e8\e[01;37m" "$SP_STRING"
		sleep ${SP_DELAY:-.2}
		SP_STRING=${SP_STRING#"${SP_STRING%?}"}${SP_STRING%?}
	done
	tput sgr0
}



###### please wait...
# copyright 2007 - 2010 Christopher Bratusek
function spanner() {
	PROC=$1;COUNT=0
	echo -n "Please wait "
	while [ -d /proc/$PROC ];do
		while [ "$COUNT" -lt 10 ];do
			echo -ne '\x08  ' ; sleep 0.1
			((COUNT++))
		done
		until [ "$COUNT" -eq 0 ];do
			echo -ne '\x08\x08 ' ; sleep 0.1
			((COUNT -= 1))
		done
	done
}



function spin() {
	# copyright 2007 - 2010 Christopher Bratusek
        echo -n "|/     |"
        while [ -d /proc/$1 ]
        do
        # moving right
        echo -ne "\b\b\b\b\b\b\b-     |"
        sleep .05
        echo -ne "\b\b\b\b\b\b\b\\     |"
        sleep .05
        echo -ne "\b\b\b\b\b\b\b|     |"
        sleep .05
        echo -ne "\b\b\b\b\b\b\b /    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b-    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b\\    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b|    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b /   |"
        sleep .05
        echo -ne "\b\b\b\b\b-   |"
        sleep .05
        echo -ne "\b\b\b\b\b\\   |"
        sleep .05
        echo -ne "\b\b\b\b\b|   |"
        sleep .05
        echo -ne "\b\b\b\b\b /  |"
        sleep .05
        echo -ne "\b\b\b\b-  |"
        sleep .05
        echo -ne "\b\b\b\b\\  |"
        sleep .05
        echo -ne "\b\b\b\b|  |"
        sleep .05
        echo -ne "\b\b\b\b / |"
        sleep .05
        echo -ne "\b\b\b- |"
        sleep .05
        echo -ne "\b\b\b\\ |"
        sleep .05
        echo -ne "\b\b\b| |"
        sleep .05
        echo -ne "\b\b\b /|"
        sleep .05
        echo -ne "\b\b-|"
        sleep .05
        echo -ne "\b\b\\|"
        sleep .05
        echo -ne "\b\b||"
        sleep .05
        echo -ne "\b\b/|"
        sleep .05
        # moving left
        echo -ne "\b\b||"
        sleep .05
        echo -ne "\b\b\\|"
        sleep .05
        echo -ne "\b\b-|"
        sleep .05
        echo -ne "\b\b\b/ |"
        sleep .05
        echo -ne "\b\b\b| |"
        sleep .05
        echo -ne "\b\b\b\\ |"
        sleep .05
        echo -ne "\b\b\b- |"
        sleep .05
        echo -ne "\b\b\b\b/  |"
        sleep .05
        echo -ne "\b\b\b\b|  |"
        sleep .05
        echo -ne "\b\b\b\b\\  |"
        sleep .05
        echo -ne "\b\b\b\b-  |"
        sleep .05
        echo -ne "\b\b\b\b\b/   |"
        sleep .05
        echo -ne "\b\b\b\b\b|   |"
        sleep .05
        echo -ne "\b\b\b\b\b\\   |"
        sleep .05
        echo -ne "\b\b\b\b\b-   |"
        sleep .05
        echo -ne "\b\b\b\b\b\b/    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b|    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b\\    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b-    |"
        sleep .05
        echo -ne "\b\b\b\b\b\b\b/     |"
        sleep .05
        done
	echo -e "\b\b\b\b\b\b\b\b\b|=======| done!"
}



function spinner()
# copyright 2007 - 2010 Christopher Bratusek
{
	PROC=$1
	while [ -d /proc/$PROC ];do
		echo -ne '\e[01;32m/\x08' ; sleep 0.05
		echo -ne '\e[01;32m-\x08' ; sleep 0.05
		echo -ne '\e[01;32m\\\x08' ; sleep 0.05
		echo -ne '\e[01;32m|\x08' ; sleep 0.05
	done
}



###### Display a progress process
# To start the spinner2 function, you have to send the function
# into the background. To stop the spinner2 function, you have
# to define the argument "stop".
# EXAMPLE:
#    echo -n "Starting some daemon "; spinner2 &
#    if sleep 10; then
#       spinner2 "stop"; echo -e "\t[ OK ]"
#    else
#       spinner2 "stop"; echo -e "\t[ FAILED ]"
#    fi
function spinner2() {
      local action=${1:-"start"}
      declare -a sign=( "-" "/" "|" "\\\\" )
      # define singnal file...
      [ "$action" = "start" ] && echo 1 > /tmp/signal
      [ "$action" = "stop" ] && echo 0 > /tmp/signal
      while [ "$( cat /tmp/signal 2>/dev/null )" == "1" ] ; do
          for (( i=0; i<${#sign[@]}; i++ )); do
              echo -en "${sign[$i]}\b"
              # with this command you can use millisecond as sleep time - perl rules ;-)
              perl -e 'select( undef, undef, undef, 0.1 );'
          done
      done
      # clear the last ${sign[$i]} sign at finish...
      [ "$action" = "stop" ] && echo -ne " \b"
}



function working()
# copyright 2007 - 2010 Christopher Bratusek
{
   while [ -d /proc/$1 ]
   do
	echo -ne "w      \b\b\b\b\b\b\b";sleep .08;
	echo -ne "wo     \b\b\b\b\b\b\b";sleep .08;
	echo -ne "wor    \b\b\b\b\b\b\b";sleep .08;
	echo -ne "work   \b\b\b\b\b\b\b";sleep .08;
	echo -ne "worki  \b\b\b\b\b\b\b";sleep .08;
	echo -ne "workin \b\b\b\b\b\b\b";sleep .08;
	echo -ne "working\b\b\b\b\b\b\b";sleep .08;
	echo -ne " orking\b\b\b\b\b\b\b";sleep .08;
	echo -ne "  rking\b\b\b\b\b\b\b";sleep .08;
	echo -ne "   king\b\b\b\b\b\b\b";sleep .08;
	echo -ne "    ing\b\b\b\b\b\b\b";sleep .08;
	echo -ne "     ng\b\b\b\b\b\b\b";sleep .08;
	echo -ne "      g\b\b\b\b\b\b\b";sleep .08;
   done
}



##################################################
# Pronounce an English word			 #
##################################################

###### usage:	pronounce "word1" "word2" "word3" "..."
function pronounce() { for a in $@; do wget -qO- $(wget -qO- "http://www.m-w.com/dictionary/$a" | grep 'return au' | sed -r "s|.*return au\('([^']*)', '([^'])[^']*'\).*|http://cougar.eb.com/soundc11/\2/\1|") | aplay -q; done }



###### usage:	pronounce_ "word1" "word2" "word3" "..."
# requires 'mpg123' - sudo apt-get install mp321, but better dictionary
function pronounce_() { wget -qO- $(wget -qO- "http://dictionary.reference.com/browse/$@" | grep 'soundUrl' | head -n 1 | sed 's|.*soundUrl=\([^&]*\)&.*|\1|' | sed 's/%3A/:/g;s/%2F/\//g') | mpg123 -; }



##################################################
# Pull a single file out of a .tar.gz		 #
##################################################

function pullout() {
  if [ $# -ne 2 ]; then
    echo "need proper arguments:"
    echo "pullout [file] [archive.tar.gz]"
    return 1
  fi
  case $2 in
    *.tar.gz|*.tgz)
    gunzip < $2 | tar -xf - $1
    ;;
    *)
    echo $2 is not a valid archive
    return 1
    ;;
  esac
  return 0
}



##################################################
# Create QR codes from a URL			 #
##################################################

function qrurl() { curl -sS "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chld=H|0&chl=$1" -o - | display -filter point -resize 600x600 png:-; }



##################################################
# Email yourself a short note			 #
##################################################

function quickemail() { echo "$*" | mail -s "$*" email@email.com; }



##################################################
# Turning on and off Internet radio		 #
##################################################

function radio() { if [ "$(pidof mpg123)" ] ; then killall mpg123; else mpg123 -q -@ http://173.236.29.51:8200 & fi }



##################################################
# Scroll file one line at a time (w/only UNIX 	 #
# base tools)					 #
##################################################

###### usage:	rd < file ; or ... | rd
function rd_() { IFS='<ctrl-m>';$@;for i in `sed 's.\\\.\\\134.g;s.%.\\\045.g'`;do printf "$i$IFS";sleep 1;done ; }



##################################################
# Resize images					 #
##################################################

function resizeimg()
{
       NAME_="resizeimg"
       HTML_="batch resize image"
    PURPOSE_="resize bitmap image"
    PURPOSE_="resize bitmap image"
   SYNOPSIS_="$NAME_ [-hlv] -w <n> <file> [file...]"
   REQUIRES_="standard GNU commands, ImageMagick"
    VERSION_="1.2"
       DATE_="2001-04-22; last update: 2004-10-02"
     AUTHOR_="Dawid Michalczyk <dm@eonworks.com>"
        URL_="www.comp.eonworks.com"
   CATEGORY_="gfx"
   PLATFORM_="Linux"
      SHELL_="bash"
 DISTRIBUTE_="yes"
# This program is distributed under the terms of the GNU General Public License
usage () {
echo >&2 "$NAME_ $VERSION_ - $PURPOSE_
Usage: $SYNOPSIS_
Requires: $REQUIRES_
Options:
     -w <n>, an integer referring to width in pixels; aspect ratio will be preserved
     -v, verbose
     -h, usage and options (this help)
     -l, see this script"
    exit 1
}
gfx_resizeImage() {
    # arg check
    [[ $1 == *[!0-9]* ]] && { echo >&2 $1 must be an integer; exit 1; }
    [ ! -f $2 ] && { echo >&2 file $2 not found; continue ;}
    # scaling down to value in width
    mogrify -geometry $1 $2
}
# args check
[ $# -eq 0 ] && { echo >&2 missing argument, type $NAME_ -h for help; exit 1; }
# var init
verbose=
width=
# option and arg handling
while getopts vhlw: options; do
    case $options in
        v) verbose=on ;;
        w) width=$OPTARG ;;
        h) usage ;;
        l) more $0; exit 1 ;;
       \?) echo invalid argument, type $NAME_ -h for help; exit 1 ;;
    esac
done
shift $(( $OPTIND - 1 ))
# check if required command is in $PATH variable
which mogrify &> /dev/null
[[ $? != 0 ]] && { echo >&2 the required ImageMagick \"mogrify\" command \
is not in your PATH variable; exit 1; }
for a in "$@";do
    gfx_resizeImage $width $a
    [[ $verbose ]] && echo ${NAME_}: $a
done
}



##################################################
# Copy Remastersys backups to '~/Backups'	 #
# folder (only after Remastersys has backed-up	 #
# something)					 #
##################################################

function remastersys-copy()
{
    notify-send -t 3000 -i /usr/share/icons/gnome/32x32/status/info.png "Remastersys ISO Copy Started"
    DISTRIB_ID=`cat /etc/lsb-release | grep DISTRIB_ID | cut -d '=' -f 2`
    DISTRIB_CODENAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d '=' -f 2`
    mkdir "/home/$USER/Backups"
    mkdir "/home/$USER/Backups/$DISTRIB_ID $DISTRIB_CODENAME Backup `date +-%e-%m-%Y`"
    cd "/home/$USER/Backups/$DISTRIB_ID $DISTRIB_CODENAME Backup `date +-%e-%m-%Y`"
    echo 'Password:		password' >> Password.txt
    cp /home/remastersys/remastersys/custombackup.iso "/home/$USER/Backups/$DISTRIB_ID $DISTRIB_CODENAME Backup `date +-%e-%m-%Y`"
    cd "/home/$USER/Backups/"
    rename 's/\b([a-z])/\u$1/g' "$DISTRIB_ID $DISTRIB_CODENAME Backup `date +-%e-%m-%Y`"
    notify-send -t 3000 -i /usr/share/icons/gnome/32x32/status/info.png "Remastersys ISO Copy Finished" ;
}



##################################################
# Reminder for whatever whenever		 #
##################################################

function remindme()
{
sleep $1 && zenity --info --text "$2" &
}



##################################################
# Remount a device				 #
##################################################

function remount() {
	# copyright 2007 - 2010 Christopher Bratusek
	DEVICE=$1
	shift
	mount -oremount,$@ $DEVICE
}



##################################################
# Repeats a command every x seconds		 #
##################################################

###### Usage: repeat PERIOD COMMAND
function repeat() {
    local period
    period=$1; shift;
    while (true); do
        eval "$@";
    sleep $period;
    done
}



##################################################
# Add repo					 #
##################################################

function repoadd() {
	# copyright 2007 - 2010 Christopher Bratusek
	reprepro -Vb "$REPO_HOME" include "$REPO_DIST" *.changes
	cd "$REPO_HOME"/dists/"$REPO_DIST"
	gpg -abs -o Release.gpg Release
}



##################################################
# Set permissions to "standard" values (644/755),#
# recursive					 #
##################################################

###### Usage: resetp
function resetp() {
    chmod -R u=rwX,go=rX "$@"
}



##################################################
# X DISPLAY functions				 #
##################################################

function reset_display()
{
    if [ "$SHLVL" -eq 1 ]; then
        echo $DISPLAY > $HOME/.display
    else
        if [ -e $HOME/.display ]; then
            export DISPLAY=$(cat $HOME/.display)
        fi
    fi
}



function set_xtitle()
{
    if [ $TERM == "xterm" ]; then
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    fi
}
# if [ "$UID" -ne 0 ]; then
#     reset_display
# fi



##################################################
# Daemon management				 #
##################################################

# function restart() { sudo /etc/rc.d/$1 restart; }



# function start() { sudo /etc/rc.d/$1 start; }



# function stop() { sudo /etc/rc.d/$1 stop; }



##################################################
# Restart the windows, only once		 #
##################################################

function restowin() { sudo grub-set-default 3 && sudo reboot; }



##################################################
# Rip a file with handbrake and good options	 #
##################################################

# function rip() {
# handbrake -i /dev/dvd -o ${HOME}/${1}.mp4 -L -U -F -f mp4 -e x264 -b 4000 -B 192
# }



##################################################
# Using associative array to remove all files and#
# directories under PWD except			 #
##################################################

function rmall_but() { declare -A keep;for arg;do keep[$arg]=1;done;for file in *;do [[ ${keep[$file]} ]] || rm -rf "$file";done; }



##################################################
# Remove an inode via inode number		 #
##################################################

function rminode() {
        find . -inum $1 -exec rm -i {} \;
}



##################################################
# Roll - archive wrapper			 #
##################################################

###### usage: roll <foo.tar.gz> ./foo ./bar
function roll()
{
  FILE=$1
  case $FILE in
    *.tar.bz2) shift && tar cjf $FILE $* ;;
    *.tar.gz) shift && tar czf $FILE $* ;;
    *.tgz) shift && tar czf $FILE $* ;;
    *.zip) shift && zip $FILE $* ;;
    *.rar) shift && rar $FILE $* ;;
  esac
}



##################################################
# Removing all extended attributes from a	 #
# directory tree				 #
##################################################

function rr()
{
    for i in $(ls -Rl@ | grep '^    ' | awk '{print $1}' | sort -u); \
       do echo Removing $i ... >&2;  \
       find . | xargs xattr -d $i 2>/dev/null ; done
}



##################################################
# RTFM function					 #
##################################################

function rtfm() { help $@ || man $@ || $BROWSER "http://www.google.com/search?q=$@"; }



##################################################
# Make a backup before editing a file		 #
##################################################

function safeedit() {
cp $1 ${1}.backup && vim $1
}



##################################################
# Sanitize - set file/directory owner and	 #
# permissions to normal values (644/755)	 #
##################################################

###### usage: sanitize <file>
function sanitize()
{
  chmod -R u=rwX,go=rX "$@"
  chown -R ${USER}:users "$@"
}



##################################################
# Save a specified directory			 #
##################################################

function save() { /usr/bin/sed "/$@/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; }



##################################################
# Save a file to ~/Temp				 #
##################################################

function saveit() {
cp $1 ${HOME}/Temp/${1}.saved
}



##################################################
# Screencasting with mplayer webcam window	 #
##################################################

function screencastw()
{
mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop | ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4
}



##################################################
# Search package database			 #
##################################################

###### search Gentoo package database (portage) using eix
#   $1 = search term (package name)
# function sd() { eix -FsSc "$1"; }  # Search all available w/ desc.; show summary



# function se() { eix -F "^$1\$"; }  # Search exact available; show details



# function si() { eix -FIc "$1"; }   # Search installed; show summary



# function sp() { eix -Fc "$1"; }     # Search all available; show summary



###### search Arch package database using pacman
#   $1 = search term (package name
# function sp() {
#    echo -e "$(pacman -Ss "$@" | sed \
#        -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
#        -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
#        -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
#        -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
#        \033[0m"
# }



###### search Debian (or Ubuntu) package database (apt) using dpkg
#   $1 = search term (package name)
function sp() { apt-cache search "$1" | grep -i "$1"; }  # search all available



##################################################
# Sed /pat/!d without using sed (no RE; limited  #
# to shell patterns aka globbing)		 #
##################################################

# usage: se pattern # use in place of sed /pat/!d where RE are overkill
function se_() { while read a;do [ "$a" != "${a#*$@*}" ]&&echo $a;done ; }



##################################################
# Search and replace words/phrases from text file#
##################################################

###### usage:	searchnreplace "whatever oldtext" "whatever newtext" "file(s) to act on"
function searchnreplace()
{
# Store old text and new text in variables
old=$1;
new=$2;
# Shift positional parameters to places to left (get rid of old and
# new from command line)
shift;
shift;
# Store list of files as a variable
files=$@;
a='';
for a in $files
 do
  temp=$(echo "/tmp/$LOGNAME-$a");
# echo "$temp";
  echo -n ".";
  sed -e "s/$old/$new/g" $a > $temp;
  mv $temp $a;
 done
echo;
echo -e "Searched $# files for '$old' and replaced with '$new'";
}



##################################################
# Auto send an attachment from CLI		 #
##################################################

function send() {
echo "File auto-sent from linux." | mutt -s "See Attached File" -a $1 $2
}



##################################################
# Manage services				 #
##################################################

function service() {
  if [ $# -lt 2 ]; then
    echo "Missing service name or command"
    return 1
  fi
  sudo /etc/init.d/$1 $2 && return 0
}



###### service() { /etc/rc.d/$1 $2; }
function service_() {
        if [ -n "$2"  ]
        then
                /etc/rc.d/$1 $2
        else
                echo    "All daemons"
                ls --ignore=functions* /etc/rc.d/
                echo    "Running daemons"
                ls /var/run/daemons
        fi
}



##################################################
# Create a new script, automatically populating  #
# the shebang line, editing the script, and 	 #
# making it executable.				 #
##################################################

function shebang() { if i=$(which $1); then printf '#!%s\n\n' $i >  $2 && vim + $2 && chmod 755 $2; else echo "'which' could not find $1, is it in your \$PATH?"; fi; }



##################################################
# Pseudo namespaces in bash			 #
##################################################

## copyright: 2009, Poor Yorick
## author url:  http://www.pooryorick.com
## license: http://www.ynform.org/w/Pub/OpenSourceSharewareLicense
## to "import" functions and assign them to pseudo namespaces using prefixes
## caveat: works well for functions, but there is still only one global namespace -- no script-level namespace like Python's
# function shimport() {
#	local magic part prefix script script2 t tvar var vartype
#	magic=__shimport__
#	script='
#	{ @1 ; } >&2
#	@script2
#	'
#	script="${script//@1/$(< /dev/stdin)}"
#	script=$(printf '%s\n%s' "$script" "declare -p $magic")
#	prefix="$1"
#	shift
#	script2=''
#	while test ${#@} -gt 0; do
#		var=${1%%=*}
#		vartype=${1#*=}
#		case "$vartype" in
#			f*)
#				t=-f
#				;;
#			v*)
#				t=-p
#				;;
#			*)
#				echo "$vartype" is an invalid type specifier for "$var"!
#				return 1
#				;;
#		esac
#		read -d '' part <<-'EOF'
#			@magic=$(declare @t @var)
#			@magic=${@magic/@var/@prefix@var}
#			printf '%s\\n' "$@magic"
#		EOF
#		for tvar in magic t var prefix; do
#			part=${part//@$tvar/${!tvar}}
#		done
#		script2="$(printf '%s\n%s\n' "$script2" "$part")"
#		shift
#	done
#	printf '%s\n' "$(bash -c "${script//@script2/$script2}")"
# }
# shimport_test1=$(cat <<-'EOG'
#	eval "$(shimport mod1_ var1=v var2=v func1=f <<-'EOF'
#		echo welcome to the inner script!
#		var1=( one two "forty three" )
#		var2=val2
#		function func1() {
#			echo welcome to func1!
#		}
#		EOF
#	)"
#	mod1_func1
#	printf 'mod1_var1: %s\n' "${mod1_var1[@]}"
# EOG
# )
# eval "$shimport_test1"
#    }}}



##################################################
# Shot - takes a screenshot of your current	 #
# window					 #
##################################################

function shot()
{
import -frame -strip -quality 75 "$HOME/$(date +%s).png"
}



##################################################
# Create an easy to pronounce shortened URL from #
# CLI						 #
##################################################

function shout() { curl -s "http://shoutkey.com/new?url=$1" | sed -n 's/\<h1\>/\&/p' | sed 's/<[^>]*>//g;/</N;//b' ;}



##################################################
# To remind yourself of an alias (given some	 #
# part of it)					 #
##################################################

function showa() { /usr/bin/grep -i -a1 $@ ~/.aliases.bash | grep -v '^\s*$' ; }



##################################################
# Show the contents of a file, including 	 #
# additional useful info			 #
##################################################

function showfile()
{
width=72
for input
do
  lines="$(wc -l < $input | sed 's/ //g')"
  chars="$(wc -c < $input | sed 's/ //g')"
  owner="$(ls -ld $input | awk '{print $3}')"
  echo "-----------------------------------------------------------------"
  echo "File $input ($lines lines, $chars characters, owned by $owner):"
  echo "-----------------------------------------------------------------"
  while read line
    do
      if [ ${#line} -gt $width ] ; then
        echo "$line" | fmt | sed -e '1s/^/  /' -e '2,$s/^/+ /'
      else
        echo "  $line"
      fi
    done < $input
  echo "-----------------------------------------------------------------"
done | more
}



##################################################
# ShowTimes: show the modification, metadata-	 #
# change, and access times of a file		 #
##################################################

function showTimes() { stat -f "%N:   %m %c %a" "$@" ; }



##################################################
# Used by file					 #
##################################################

function sh_coloroff()
{
echo -en "$reset_color"
}



function sh_colormsg()
{
[ -n "$1" ] && echo -en "${fg_bold}${@}${reset_color}"
}



function sh_error()
{
echo -e "${fg_bold}[ e ]${reset_color} $@"
}



function sh_info()
{
echo -e "${fg_bold}[ i ]${reset_color} $@"
}



function sh_success()
{
echo -e "${fg_bold}[ k ]${reset_color} $@"
}



function sh_mesg()
{
echo -e "${fg_bold}[ m ]${reset_color} $@"
}



###### use with   svn diff -r `sh_svnprev`
function sh_svnprev()
{ echo $(( `svnversion . | sed 's/[^0-9].*//'` - 1))
}



###### $1 - path
function sh_fcore()
{
  p="."
  [ -n "$1" ] && p="$1"
  find $p -name "core\.*[[:digit:]]*" -type f 2>& /dev/null
  return 0
}



##################################################
# Ssh functions					 #
##################################################

function slak()
{
    if [ $# -lt 2 ]; then
        echo "add public key to securelink server"
        echo "usage: skak [accountname] [sl port]"
    else
        cat /Volumes/Library/ssh/id_rsa-$1.pub | ssh -q lila@localhost -p $2 "if [ ! -d ~/.ssh/ ] ; then mkdir ~/.ssh ; fi ; chmod 700 ~/.ssh/ ; cat - >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys"
    fi
}



function slssh()
{
    if [ $# -lt 1 ]; then
        echo "connect to securelink ssh session"
        echo "usage slssh [port#]"
        echo "ssh -p \$1 localhost"
    else
        ssh -p $1 localhost
    fi
}



function slpg()
{
    if [ $# -lt 1 ]; then
        echo "create securelink ssh tunnel for postgres"
        echo "usage: slpg [port#]"
        echo "ssh -N localhost -L 2345/localhost/5432 -p \$1"
    else
        ssh -N localhost -L 2345/localhost/5432 -p $1
    fi
}



function sshpg()
{
    if [ $# -lt 1 ]; then
        echo "create ssh tunnel for postgres"
        echo "usage: sshpg username@server"
        echo "ssh -N \$1 -L 2345/localhost/5432"
    else
        ssh -N $1 -L 2345/localhost/5432
    fi
}



function sshpg2()
{
    if [ $# -lt 1 ]; then
        echo "create ssh tunnel for postgres"
        echo "usage: sshpg username@server"
        echo "ssh -N \$1 -L \$2/localhost/5432"
    else
        ssh -N $1 -L $2/localhost/5432
    fi
}



##################################################
# Function that outputs dots every second until  #
# command completes				 #
##################################################

function sleeper() { while `ps -p $1 &>/dev/null`; do echo -n "${2:-.}"; sleep ${3:-1}; done; }; export -f sleeper



##################################################
# Slow down CPU and IO for process and its 	 #
# offsprings					 #
##################################################

###### requires gawk: sudo apt-get install gawk
function slow2() { ionice -c3 renice -n 20 $(pstree `pidof $1` -p -a -u -A|gawk 'BEGIN{FS=","}{print $2}'|cut -f1 -d " ") ; }



##################################################
# Sort a list of comma-separated list of numbers #
##################################################

function sort_csn() { echo "${1}" | sed -e "s/,/\n/g"| sort -nu | awk '{printf("%s,",$0)} END {printf("\n")}' | sed -e "s/,$//"; }



##################################################
# Get function's source				 #
##################################################

function source_print() { set | sed -n "/^$1/,/^}$/p"; }



##################################################
# Spellchecking					 #
##################################################

###### I-Spell @ work: ENGLISH
# requires ispell: sudo apt-get install ispell
function spell()
{
    local CHATTO
    if [ $# -ne 1 ]; then
        echo -e "\033[1;32mUSAGE: \033[33mis word_to_check\033[0m"
    else
        CHATTO=$( echo $* | awk '{print $1}' )
        shift
        echo -e "----------------------------------------------------->\n"
        echo $CHATTO | ispell -a -m -B |grep -v "@"
        echo -e "----------------------------------------------------->"
    fi
}



###### Google spell checker
function spellcheck() { typeset y=$@;curl -sd "<spellrequest><text>$y</text></spellrequest>" https://www.google.com/tbproxy/spell|sed -n '/s="[0-9]"/{s/<[^>]*>/ /g;s/\t/ /g;s/ *\(.*\)/Suggestions: \1\n/g;p}'|tee >(grep -Eq '.*'||echo -e "OK");}



###### spell checks either a Web page URL or a file
# requires ispell: sudo apt-get install ispell
function webspell()
{
okaywords="$HOME/.okaywords"
tempout="/tmp/webspell.$$"
trap "/bin/rm -f $tempout" 0
if [ $# -eq 0 ] ; then
  echo "Usage: webspell file|URL" >&2;
fi
for filename
do
  if [ ! -f "$filename" -a "$(echo $filename|cut -c1-7)" != "http://" ] ; then
     continue;      # picked up directory in '*' listing
  fi
  lynx -dump $filename | tr ' ' '\n' | sort -u | \
    grep -vE "(^[^a-z]|')" | \
    # adjust the following line to produce just a list of misspelled words
    ispell -a | awk '/^\&/ { print $2 }' | \
    sort -u > $tempout
  if [ -r $okaywords ] ; then
    # if you have an okaywords file, screen okay words out
    grep -vif $okaywords < $tempout > ${tempout}.2
    mv ${tempout}.2 $tempout
  fi
  if [ -s $tempout ] ; then
    echo "Probable spelling errors: ${filename}"
    echo '-------' ; cat $tempout ; echo '========='
    cat $tempout | paste - - - -  | sed 's/^/  /'
  fi
done
}



##################################################
# Cut a part of a video 			 #
##################################################

# ("$1" for original file, "$2" for new file, "$3" is start time, & "$4" is length of video desired)
function splitvideo()
{
ffmpeg -vcodec copy -acodec copy -i "$1" -ss "$3" -t "$4" "$2"
}



##################################################
# Posts a file to sprunge.us and copies the 	 #
# related url to the clipboard			 #
##################################################

function sprunge() { curl -s -F "sprunge=@$1" http://sprunge.us | xclip -selection clipboard && xclip -selection clipboard -o; }



##################################################
# Stock prices - can be called two ways:	 #
# stock novl  (this shows stock pricing):	 #
# stock "novell"  (this way shows stock symbol	 #
# for novell)					 #
##################################################

function stock()
{
stockname=`lynx -dump http://finance.yahoo.com/q?s=${1} | grep -i ":${1})" | sed -e 's/Delayed.*$//'`
stockadvise="${stockname} - delayed quote."
declare -a STOCKINFO
STOCKINFO=(` lynx -dump http://finance.yahoo.com/q?s=${1} | egrep -i "Last Trade:|Change:|52wk Range:"`)
stockdata=`echo ${STOCKINFO[@]}`
   if [[ ${#stockname} != 0 ]] ;then
      echo "${stockadvise}"
      echo "${stockdata}"
         else
         stockname2=${1}
         lookupsymbol=`lynx -dump -nolist http://finance.yahoo.com/lookup?s="${1}" | grep -A 1 -m 1 "Portfolio" | grep -v "Portfolio" | sed 's/\(.*\)Add/\1 /'`
            if [[ ${#lookupsymbol} != 0 ]] ;then
            echo "${lookupsymbol}"
               else
               echo "Sorry $USER, I can not find ${1}."
            fi
   fi
}



###### command line way to get the stock quote via Yahoo
function stock_()
{
curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1'
}



##################################################
# Stopwatch and Countdown Timer			 #
##################################################

function stopwatch() {
# copyright 2007 - 2010 Christopher Bratusek
BEGIN=$(date +%s)
while true; do
    NOW=$(date +%s)
    DIFF=$(($NOW - $BEGIN))
    MINS=$(($DIFF / 60))
    SECS=$(($DIFF % 60))
    echo -ne "Time elapsed: $MINS:`printf %02d $SECS`\r"
    sleep .1
done
}



###### stopwatch with log
function stop_watch()
{
START=$( date +%s ); while true; do CURRENT=$( date +%s ) ; echo $(( CURRENT-START )) ; sleep 1 ; echo -n ^[[A ; done
}



###### countdown clock
function countdown() { case "$1" in -s) shift;; *) set $(($1 * 60));; esac; local S=" "; for i in $(seq "$1" -1 1); do echo -ne "$S\r $i\r"; sleep 1; done; echo -e "$S\rBOOM!"; }



###### countdown clock
alias countdown2='MIN=1 && for i in $(seq $(($MIN*60)) -1 1); do echo -n "$i, "; sleep 1; done; echo -e "\n\nBOOOM! Time to start."'



##################################################
# Transcodes and streams a video over http on	 #
# port 6789 (vlc required)			 #
##################################################

# function stream() { cvlc $1 --extraintf rc --sout
# 'transcode{vcodec=h264,vb=256,fps=12,scale=1,deinterlace,acodec=mp3,threads=3,ab=64,channels=2}:duplicate{dst=std{access=http,mux=ts,dst=0.0.0.0:6789}}';
# }



##################################################
# Print the corresponding error message		 #
##################################################

function strerror() { python -c "import os; print os.strerror($1)"; }



##################################################
# Function to split a string into an array	 #
##################################################

function string2array()
{
read -a ARR <<<'world domination now!'; echo ${ARR[2]};
}



##################################################
# Count total number of subdirectories in current#
# directory starting with specific name.	 #
##################################################

function subdir_find()
{
find . -type d -name "*TestDir*" | wc -l
}



##################################################
# Check tcp-wrapping support			 #
##################################################

###### returns TRUE if the application supports tcp-wrapping or FALSE if not by reading the shared libraries used by this application.
function supportsWrap() { ldd `which ${1}` | grep "libwrap" &>/dev/null && return 0 || return 1; }



##################################################
# Swap 2 filenames around			 #
##################################################

###### from Uzi's bashrc
function swap()
{
    local TMPFILE=tmp.$$
    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}



function swap2() { if [ -f "$1" -a -f "$2" ]; then mv "$1" "$1.$$" && mv "$2" "$1" && mv "$1.$$" "$2" && echo "Success"; else echo "Fail"; fi; }



##################################################
# Switch two files (comes in handy)		 #
##################################################

function switchfile() {
mv $1 ${1}.tmp && $2 $1 && mv ${1}.tmp $2
}



##################################################
# Creates a dated tarball			 #
##################################################

function tarball()
{
    name=$1
    shift
    tar zcvf $name-`date +%Y%m%d`.tar.gz "$@"
}



##################################################
# Monitor progress of data through a pipeline	 #
##################################################

function tarcp() {
    if (( $# >= 2 )); then
        echo "copy ${@[1, -2]} => ${@[-1]}"
        # http://www.ivarch.com/programs/pv.shtml
        if which pv ; then
            tar -c -f - ${@[1, -2]} | pv -t -b -r | tar -x -f - -C ${@[-1]}
        else
            tar -c -v -f - ${@[1, -2]} | tar -x -f - -C ${@[-1]}
        fi
    else
        "error, not enough parameters."
        return 1
    fi
}



##################################################
# TODO: fix so -s can be sent to cp		 #
##################################################

function tcp() {
        if [ "$1" = "-s" -o "$1" = "--set-target" ]; then
                COPY_TARGET="$(realpath $2)";
        elif [ "$1" = "-h" -o "$1" = "--help" ]; then
                echo "usage: tcp [-s|--set-target <dir>] | <mv args> <files>";
        else
                cp --target-directory "$COPY_TARGET" "$@";
        fi
}



##################################################
# Keeping your $HOME directory organized	 #
##################################################

## having one temp dir for dls etc can quickly become mess, so try this tip to organise by date
# export TD="$HOME/temp/`date +'%Y-%m-%d'`"
# function td() {
#    td=$TD
#    if [ ! -z "$1" ]; then
#        td="$HOME/temp/`date -d "$1 days" +'%Y-%m-%d'`";
#    fi
#    mkdir -p $td; cd $td
#    unset td
# }



##################################################
# Make the following commands run in		 #
# background automatically:			 #
##################################################

###### wrapper around xemacs/gnuserv ...
function te()
{
    if [ "$(gnuclient -batch -eval t 2>&-)" == "t" ]; then
        gnuclient -q "$@";
    else
        ( xemacs "$@" &);
    fi
}



##################################################
# Set terminal title				 #
##################################################

function terminal_title {
    echo -en "\033]2;$@\007"
}



##################################################
# Set/Unset a proxy for the terminal using tor	 #
##################################################

###### For a HTTP proxy in a single terminal window, simply run the following command in a terminal:
# export http_proxy='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# For a secure connection (HTTPS), use:
# export https_proxy='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# Obviously, replace everything with your username, password, proxy ip and port.
# If the proxy does not require an username and password, skip that part
function termproxy()
{
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'
}



###### To close the HTTP proxy in the terminal, either close the terminal, or enter this:
function termproxyX()
{
unset http_proxy
unset https_proxy
}



##################################################
# Terrorist threat level text			 #
##################################################

function terrorist-level()
{
echo "Terrorist threat level: $(curl -s 'http://www.dhs.gov/dhspublic/getAdvisoryCondition' | awk -F\" 'NR==2{ print $2 }')"
}



##################################################
# Display theme info				 #
##################################################

function themeinfo() {
  if [ `pgrep emerald` ]; then
    echo "  Emerald:    `cat $HOME/.emerald/theme/theme.ini | grep description | awk -F= '{print $2}'`"
  else
    echo "  Metacity:   `gconftool-2 -g /apps/metacity/general/theme`"
  fi
  echo "  GTK:        `gconftool-2 -g /desktop/gnome/interface/gtk_theme`"
  echo "  Icons:      `gconftool-2 -g /desktop/gnome/interface/icon_theme`"
  echo "  Cursor:     `gconftool-2 -g /desktop/gnome/peripherals/mouse/cursor_theme`"
  echo "  Font:       `gconftool-2 -g /desktop/gnome/interface/font_name`"
  echo "  Wallpaper:  `gconftool-2 -g /desktop/gnome/background/picture_filename | xargs basename | cut -d. -f 1`"
  echo
}



##################################################
# Thesaurus					 #
##################################################

###### requires dict: sudo apt-get install dict
function ths() {
    dict -d moby-thes $@
}



##################################################
# Timer function				 #
##################################################

###### Elapsed time.  Usage:
#   t=$(timer)
#   ... # do something
#   printf 'Elapsed time: %s\n' $(timer $t)
#      ===> Elapsed time: 0:01:12
# If called with no arguments a new timer is returned.
# If called with arguments the first is used as a timer
# value and the elapsed time is returned in the form HH:MM:SS.
function timer()
{
    if [[ $# -eq 0 ]]; then
        echo $(date '+%s')
    else
        local  stime=$1
        etime=$(date '+%s')
        if [[ -z "$stime" ]]; then stime=$etime; fi
        dt=$((etime - stime))
        ds=$((dt % 60))
        dm=$(((dt / 60) % 60))
        dh=$((dt / 3600))
        printf '%d:%02d:%02d' $dh $dm $ds
    fi
}



##################################################
# To examine lots of files and potentially move  #
# them to a common directory			 #
##################################################

###### ex:	tmv -s /mnt/disk/5k
# ex:	make a playlist
# ex:	tmv eye-of-the-tiger.mp3 #  <-> mv eye-of-the-tiger.mp3 /mnt/disk/5k
function tmv() {
        if [ "$1" = "-s" -o "$1" = "--set-target" ]; then
                MOVE_TARGET="$(realpath $2)";
        elif [ "$1" = "-h" -o "$1" = "--help" ]; then
                echo "usage: tmv [-s|--set-target <dir>] | <mv args> <files>";
        else
                mv --target-directory "$MOVE_TARGET" "$@";
        fi
}



##################################################
# Top-ten commands				 #
##################################################

function top10() {
	# copyright 2007 - 2010 Christopher Bratusek
	history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head
}



##################################################
# Switch tor on and off (requires privoxy)	 #
##################################################

function torswitch() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $EUID == 0 ]]; then
		case $1 in
			*on )
				if [[ $(grep forward-socks4a /etc/privoxy/config) == "" ]]; then
					echo "forward-socks4a / 127.0.0.1:9050 ." >> /etc/privoxy/config
				else
					sed -e 's/\# forward-socks4a/forward-socks4a/g' -i /etc/privoxy/config
					/etc/init.d/tor restart
					/etc/init.d/privoxy restart
				fi
			;;
			*off )
				sed -e 's/forward-socks4a/\# forward-socks4a/g' -i /etc/privoxy/config
				/etc/init.d/tor restart
				/etc/init.d/privoxy restart
			;;
		esac
	fi
}



##################################################
# Touchpad stuff				 #
##################################################

###### to get information on touchpad
alias touchpad_id='xinput list | grep -i touchpad'



###### to disable touchpad
# using 'touchpad_id', set the number for your touchpad (default is 12)
function touchpad_off()
{
touchpad=12
xinput set-prop $touchpad "Device Enabled" 0
}



###### to enable touchpad
# using 'touchpad_id', set the number for your touchpad (default is 12)
function touchpad_on()
{
touchpad=12
xinput set-prop $touchpad "Device Enabled" 1
}



##################################################
# Moves specified files to ~/.Trash		 #
##################################################

###### will not overwrite files that have the same name
function trashit()
{   local trash_dir=$HOME/.Trash
    for file in "$@" ; do
        if [[ -d $file ]] ; then
            local already_trashed=$trash_dir/`basename $file`
            if [[ -n `/bin/ls -d $already_trashed*` ]] ; then
                local count=`/bin/ls -d $already_trashed* | /usr/bin/wc -l`
                count=$((++count))
                /bin/mv --verbose "$file" "$trash_dir/$file$count"
                continue
            fi
        fi
        /bin/mv --verbose --backup=numbered "$file" $HOME/.Trash
    done
}



##################################################
# Tree stuff					 #
##################################################

###### shows directory tree (requires 'tree': sudo apt-get install tree)
function treecd() {
	builtin cd "${@}" &>/dev/null
	. $BSNG_RC_DIR/dirinfo/display
	dirinfo_display
	echo -e "${epink}content:"
	tree -L 1 $TREE_OPTS
	echo "$PWD" > $HOME/.lastpwd
}



###### displays a tree of the arborescence
function treefind() {
	find "$@" | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'
}



##################################################
# Search for a show at TV.COM			 #
##################################################

function tvcom() {
firefox "http://www.tv.com/search.php?type=11&stype=all&tag=search%3Bfrontdoor&qs="${@}"&stype=program" &
}



##################################################
# Convert text file to pdf			 #
##################################################

# Requires:	sudo apt-get install txt2html python-pisa
function txt2pdf() { xhtml2pdf -b "${1%.*}" < <(txt2html "$1"); }



##################################################
# Adds "-c" canonical option to bash "type" 	 #
# builtin command to follow symbolic links	 #
##################################################

function type() { if [ "$1" = "-c" ]; then shift; for f in "$@"; do ff=$(builtin type -p "$f"); readlink -f "$ff"; done; else builtin type $typeopts "$@"; fi; }



##################################################
# Changes spaces to underscores in names	 #
##################################################

function underscore()
{
	for f in * ; do
    	[ "${f}" != "${f// /_}" ]
		mv -- "${f}" "${f// /_}"
	done
}



##################################################
# Decompiler for jar files using jad		 #
##################################################

function unjar() { mkdir -p /tmp/unjar/$1 ; unzip -d /tmp/unjar/$1 $1 *class 1>/dev/null && find /tmp/unjar/$1 -name *class -type f | xargs jad -ff -nl -nonlb -o -p -pi99 -space -stat ; rm -r /tmp/unjar/$1 ; }



##################################################
# Remove all files created by latex		 #
##################################################

function unlatex() {
if [ "$1" == "" ]; then
return
fi
i=${1%%.*}
rm -f $i.aux $i.toc $i.lof $i.lot $i.los $i.?*~ $i.loa $i.log $i.bbl $i.blg $i.glo
rm -f $i.odt $i.tns $i.fax $i.bm $i.out $i.nav $i.snm
rm -f $i.mtc* $i.bmt
mv -f $i.dvi .$i.dvi
mv -f $i.ps .$i.ps
mv -f $i.pdf .$i.pdf
rm -f $i.dvi $i.ps $i.pdf
unset i
}



##################################################
# Up to top directory				 #
##################################################

function up() {
# copyright 2007 - 2010 Christopher Bratusek
[ "${1/[^0-9]/}" == "$1" ] && {
        local ups=""
        for ((i=1; i<=$1; i++))
        do
                ups=$ups"../"
        done
        cd $ups
        }
}



##################################################
# Short URLs with ur1.ca			 #
##################################################

function ur1() { curl -s --url http://ur1.ca/ -d longurl="$1" | sed -n -e '/Your ur1/!d;s/.*<a href="\(.*\)">.*$/\1/;p' ; }



##################################################
# Easily decode unix-time (function)		 #
##################################################

function utime() { perl -e "print localtime($1).\"\n\"";}



##################################################
# Checks to ensure that all 			 #
# environment variables are valid		 #
##################################################

###### looks at SHELL, HOME, PATH, EDITOR, MAIL, and PAGER
function validator()
{
errors=0
function in_path()
{
  # given a command and the PATH, try to find the command. Returns
  # 1 if found, 0 if not.  Note that this temporarily modifies the
  # the IFS input field seperator, but restores it upon completion.
  cmd=$1    path=$2    retval=0
  oldIFS=$IFS; IFS=":"
  for directory in $path
  do
    if [ -x $directory/$cmd ] ; then
      retval=1      # if we're here, we found $cmd in $directory
    fi
  done
  IFS=$oldIFS
  return $retval
}
function validate()
{
  varname=$1    varvalue=$2
  if [ ! -z $varvalue ] ; then
    if [ "${varvalue%${varvalue#?}}" = "/" ] ; then
      if [ ! -x $varvalue ] ; then
        echo "** $varname set to $varvalue, but I cannot find executable."
        errors=$(( $errors + 1 ))
      fi
    else
      if in_path $varvalue $PATH ; then
        echo "** $varname set to $varvalue, but I cannot find it in PATH."
        errors=$(( $errors + 1 ))
      fi
    fi
  fi
}
####### Beginning of actual shell script #######
if [ ! -x ${SHELL:?"Cannot proceed without SHELL being defined."} ] ; then
  echo "** SHELL set to $SHELL, but I cannot find that executable."
  errors=$(( $errors + 1 ))
fi
if [ ! -d ${HOME:?"You need to have your HOME set to your home directory"} ]
then
  echo "** HOME set to $HOME, but it's not a directory."
  errors=$(( $errors + 1 ))
fi
# Our first interesting test: are all the paths in PATH valid?
oldIFS=$IFS; IFS=":"     # IFS is the field separator. We'll change to ':'
for directory in $PATH
do
  if [ ! -d $directory ] ; then
      echo "** PATH contains invalid directory $directory"
      errors=$(( $errors + 1 ))
  fi
done
IFS=$oldIFS             # restore value for rest of script
# Following can be undefined, & also be a progname, rather than fully qualified path.
# Add additional variables as necessary for your site and user community.
validate "EDITOR" $EDITOR
validate "MAILER" $MAILER
validate "PAGER"  $PAGER
# and, finally, a different ending depending on whether errors > 0
if [ $errors -gt 0 ] ; then
  echo "Errors encountered. Please notify sysadmin for help."
else
  echo "Your environment checks out fine."
fi
}



##################################################
# Converts VCD/SVCD to MPEG files		 #
##################################################

function vcd2mpeg()
{
# Made by ioccatflashdancedotcx
# Version 1.6, Thu Aug  4 00:43:44 CEST 2005
if [ -n "$(ls 2>/dev/null *001|grep *001)" ]; then
                rar x *01.rar
		if [ -n "$(ls 2>/dev/null *bin)" ]; then
                	for i in *bin ; do vcdxrip -p --bin-file="$i" ; done
                	mv *mpg cd.mpg
               		rm *cue *bin *.xml _cdi_cdi_* _extra_svcdinfo.txt &>/dev/null
		fi
fi
if [ -n "$(ls 2>/dev/null *01.rar|grep *01.rar)" ]; then
                rar x *01.rar
		if [ -n "$(ls 2>/dev/null *bin)" ]; then
                	for i in *bin ; do vcdxrip -p --bin-file="$i" ; done
                	mv *mpg cd.mpg
               		rm *cue *bin *.xml _cdi_cdi_* _extra_svcdinfo.txt &>/dev/null
		fi
fi
if [ -n "$(ls 2>/dev/null *.rar|grep *.rar)" ]; then
                rar x *rar
		if [ -n "$(ls 2>/dev/null *bin)" ]; then
	                for i in *bin ; do vcdxrip -p --bin-file="$i" ; done
	                mv *mpg cd.mpg
               		rm *cue *bin *.xml _cdi_cdi_* _extra_svcdinfo.txt &>/dev/null
		fi
fi
for cddir in CD1 CD2 CD3 CD4 CD5 CD6 Cd1 Cd2 Cd3 Cd4 Cd5 Cd6 cd1 cd2 cd3 cd4 cd5 cd6; do
if cd ${cddir} &>/dev/null; then
	if [ -n "$(ls 2>/dev/null *001|grep *001)" ]; then
		rar x *001
		if [ -n "$(ls 2>/dev/null *bin)" ]; then
			for i in *bin ; do vcdxrip -p --bin-file="$i" ; done
				if [ -n "$(ls 2>/dev/null avseq02.mpg)" ]; then
					rm avseq01.mpg
				fi
			mv *mpg ../${cddir}.mpg
               		rm *cue *bin *.xml _cdi_cdi_* _extra_svcdinfo.txt &>/dev/null
			cd ..
			for i in ${cddir}.mpg ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		elif [ -n "$(ls 2>/dev/null *mpg)" ]; then
			mv *mpg ../${cddir}.mpg
			cd ..
			for i in ${cddir}.mpg ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		elif [ -n "$(ls 2>/dev/null *avi)" ]; then
				mv *avi ../${cddir}.avi
				cd ..
				for i in ${cddir}.avi ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		fi
	else
	if [ -n "$(ls 2>/dev/null *01.rar|grep *01.rar)" ]; then
		rar x *01.rar
		if [ -n "$(ls 2>/dev/null *bin)" ]; then
			for i in *bin ; do vcdxrip -p --bin-file="$i" ; done
				if [ -n "$(ls 2>/dev/null avseq02.mpg)" ]; then
					rm avseq01.mpg
				fi
			mv *mpg ../${cddir}.mpg
               		rm *cue *bin *.xml _cdi_cdi_* _extra_svcdinfo.txt &>/dev/null
			cd ..
			for i in ${cddir}.mpg ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		elif [ -n "$(ls 2>/dev/null *mpg)" ]; then
			mv *mpg ../${cddir}.mpg
			cd ..
			for i in ${cddir}.mpg ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		elif [ -n "$(ls 2>/dev/null *avi)" ]; then
				mv *avi ../${cddir}.avi
				cd ..
				for i in ${cddir}.avi ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		fi
	else
	if [ -n "$(ls 2>/dev/null *.rar|grep *.rar)" ]; then
		rar x *rar
		if [ -n "$(ls 2>/dev/null *bin)" ]; then
			for i in *bin ; do vcdxrip -p --bin-file="$i" ; done
				if [ -n "$(ls 2>/dev/null avseq02.mpg)" ]; then
					rm avseq01.mpg
				fi
			mv *mpg ../${cddir}.mpg
               		rm *cue *bin *.xml _cdi_cdi_* _extra_svcdinfo.txt &>/dev/null
			cd ..
			for i in ${cddir}.mpg ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		elif [ -n "$(ls 2>/dev/null *mpg)" ]; then
				mv *mpg ../${cddir}.mpg
				cd ..
				for i in ${cddir}.mpg ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		elif [ -n "$(ls 2>/dev/null *avi)" ]; then
				mv *avi ../${cddir}.avi
				cd ..
				for i in ${cddir}.avi ; do mv -- $i `echo $i|tr A-Z a-z` ; done
		fi
	fi
	fi
	fi
fi
done
}



##################################################
# Copy a file prefixed with a version number to a#
# subdirectory					 #
##################################################

function vers() { ( IFS=$'\n'; suf="_versions"; mkdir -p "$1$suf"; nr=`ls "$1$suf" | wc -l`; nr=`printf "%02d" $(($nr + 1))`; cp "$1" "$1$suf/v${nr}_$1" ) ; }



##################################################
# Run a command, redirecting output to a file, 	 #
# then edit the file with vim			 #
##################################################

function vimcmd() { $1 > $2 && vim $2; }



##################################################
# Crawl a webpage for links			 #
##################################################

function webcrawl()
{
lynx -dump $1 | grep -A999 "^References$" | tail -n +3 | awk '{print $2 }'
}



##################################################
# Telling you from where your commit come from	 #
##################################################

function where()
{
COUNT=0; while [ `where_arg $1~$COUNT | wc -w` == 0 ]; do let COUNT=COUNT+1; done; echo "$1 is ahead of "; where_arg $1~$COUNT; echo "by $COUNT commits";};function where_arg() { git log $@ --decorate -1 | head -n1 | cut -d ' ' -f3- ;
}



##################################################
# Check hosts that are online			 #
##################################################

###### for those who DO NOT USE their /etc/hosts file for name resolution
# Function whoisonline adapted by:	dewar1
# This can look through resolv.conf file for address of nameservers
# (note: THIS WILL ONLY WORK IF YOU USE LOCAL NAMESERVERS! Nameservers
# from your ISP will render this function useless). It then cuts result to
# show just first 3 octets of IP address and runs nmap just as original function.
if which nmap 2>&1 > /dev/null; then
  function whodat()
  {
    if [ -n "$1" ]; then
      net="$1"
    else
      net=$(cat /etc/resolv.conf | grep 'nameserver' | cut -c12-26 | awk -F '.' '{print $1"."$2"."$3".0/24"}')
    fi
    echo "testing $net for online hosts"
    nmap -sP $net | awk '/Host/ && /up/ { print $0; }'
    echo "done"
}
fi



###### for those who USE their /etc/hosts file for name resolution
#if which nmap 2>&1 > /dev/null; then
#  function whoisonline()
#  {
#    if [ -n "$1" ]; then
#      net="$1"
#    else
#      net=$(grep `hostname` /etc/hosts | awk -F '.' '{ print $1"."$2"."$3".0/24"}')
#    fi
#    sh_info "testing $net for online boxes"
#    sudo nmap -sP $net | awk '/Host/ && /up/ { print $0; }'
#    sh_success "done"
#  }
#fi



##################################################
# Wipe command (uses 'shred', not 'wipe',	 #
# which I think is better (sudo apt-get		 #
# install wipe))				 #
##################################################

function wipe_() {
	# copyright 2007 - 2010 Christopher Bratusek
	cryptsetup -d /dev/urandom -c aes-xts-plain create delete $1
	shred -vzn 0 /dev/mapper/delete
	sync && sleep 4
	cryptsetup remove delete
}



##################################################
# Wordcount					 #
##################################################

###### counts frequency of words in a file
function wordfreq()
{
cat "$1"|tr -d '[:punct:]'|tr '[:upper:]' '[:lower:]'|tr -s ' ' '\n'|sort|uniq -c|sort -rn
}



###### word counter
function words()
{
# words.sh
# counts words in selection and displays result in zenity window
# dependencies xsel, wc, zenity
text=$(xsel)
words=$(wc -w <<<$text)
zenity --info --title "Word Count" --text "Words in selection:\n${words}\n\n\"${text}\""
}



##################################################
# ISO-writer					 #
##################################################

function writeiso() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $CD_WRITER ]]; then
		cdrecord dev=$CD_WRITER "$1"
	else	cdrecord deV=/dev/dvdrw "$1"
	fi
}



##################################################
# Xchown something				 #
##################################################

function xchown() {
	# copyright 2007 - 2010 Christopher Bratusek
	user="$1"
	shift
	for df in "$@";
		do su -c "chown -R $user:$user \"$df\"";
	done
}



##################################################
# X delete - removes files with desired name	 #
# in current directory				 #
##################################################

if [[ ${BASH_VERSINFO[0]} -ge "4" ]]; then
function xdel() {
		# copyright 2007 - 2010 Christopher Bratusek
		shopt -s globstar
		[[ "$@" != "" ]] &&
			{ for argv in "$@"; do
				rm -fv ./**/*"$argv"
			done }
	}
fi



##################################################
# Adds some text in the terminal frame		 #
##################################################

function xtitle()
{
    case "$TERM" in
        *term | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)
            ;;
    esac
}



##################################################
# Busted... (Yaourt)				 #
##################################################

function yaourt() {
EDITORBACKUP="$EDITOR";
export EDITOR=cat;
sudo yaourt "$@";
export EDITOR="$EDITORBACKUP";
export EDITORBACKUP=
}



##################################################
# Overwrite a file with zeros			 #
##################################################

function zero() {
        case "$1" in
                "")     echo "Usage: zero <file>"

                        return -1;
        esac
        filesize=`wc -c  "$1" | awk '{print $1}'`
        `dd if=/dev/zero of=$1 count=$filesize bs=1`
}



##################################################
# To create a ZIP archive of a file or folder	 #
##################################################

function zipf() { zip -r "$1".zip "$1" ; }



##################################################
##################################################
##################################################








######################################################################################################################################################
###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ######
######################################################################################################################################################








##################################################
# App-specific					 #
##################################################

alias audio='ncmpcpp'								# music player
alias daemon-status='for a in deluged deluge rtorrent; do  (ps -u $USER|grep $a$ > /dev/null && echo $a running.) || echo $a not running.; done'	# list the status of the daemons :p
alias daggerfall='dosbox -conf ~/.dosbox.conf.daggerfall'			# launch dosbox with a preset configuration for Daggerfall
# alias deluge-link='echo http://'`hostname`':'$USER_WPRT'/'
alias ftp='ncftp Personal'
alias instaluj='sudo pacman-color -S'
alias links2g='links2 -g'
alias nano='nano -W -m'								# disable annoying line wrapping
alias pacclean='sudo yaourt -Scc' 						# clean package cache
alias pacin='sudo yaourt -S'  							# install a specific package
alias pacman='yaourt' 								# switches from Pacman to Yaourt so we can troll the AUR
alias pacout='sudo yaourt -Rs'							# Remove a specific package
alias pacsync='sudo yaourt -Sy'   						# Sync
alias pacup='sudo yaourt -Syu'							# Sync & Update
alias rc='ssh ${MEDIAPCHOSTNAME} env DISPLAY=:0.0 rhythmbox-client --no-start'	# remote control for Rhythmbox on an Ubuntu Media PC
alias scrot='scrot -c -d 7'
alias skypefix='mv ~/.Skype/shared.xml ~/.Skype/shared~.xml'			# Skype fix for a crash that results in inability to log back in
alias spotify_next='$HOME/spotifycmd/spotify_cmd.exe next; $HOME/spotifycmd/spotify_cmd.exe status'
alias spotify_playpause='$HOME/spotifycmd/spotify_cmd.exe playpause'
alias spotify_prev='$HOME/spotifycmd/spotify_cmd.exe prev; $HOME/spotifycmd/spotify_cmd.exe status'
alias spotify_status='$HOME/spotifycmd/spotify_cmd.exe status'
alias spotify_stop='$HOME/spotifycmd/spotify_cmd.exe stop'
alias ss='gnome-screensaver-command -a'
alias start-deluged='start-stop-daemon -S --pidfile $HOME/.deluged.pid -u $USER -d $HOME -a /usr/bin/deluged -- --pidfile $HOME/.deluged.pid'
alias start-deluge-webui='start-stop-daemon -S --pidfile $HOME/.deluge-web.pid --background --make-pidfile -u $USER -d $HOME -a /usr/bin/deluge --  -u web'
alias start-rtorrent='(screen -ls|grep rtorrent > /dev/null || (screen -dmS rtorrent rtorrent && false)) && echo rtorrent is already running.'
alias start-vnc='vncserver :$USER_VPRT'
alias stop-deluged='start-stop-daemon -K --pidfile $HOME/.deluged.pid -u $USER -d $HOME -a /usr/bin/deluged -- --pidfile $HOME/.deluged.pid || killall -v -u $USER deluged'
alias stop-deluge-webui='start-stop-daemon -K --pidfile $HOME/.deluge-web.pid --make-pidfile -u $USER -d $HOME -a /usr/bin/deluge --  -u web;rm $HOME/.deluge-web.pid;'
alias stop-rtorrent='killall -u $USER rtorrent -q || echo rtorrent is not running'
alias stop-vnc='vncserver -kill :$USER_VPRT'
alias tetris='bastet' 								# bastardly tetris... awesome but deadly
alias tvtime-video0='tvtime-configure -d /dev/video0'
alias tvtime-video1='tvtime-configure -d /dev/video1'
alias tvtime-video2='tvtime-configure -d /dev/video2'
alias tvtime-video3='tvtime-configure -d /dev/video3'
alias tvtime-video4='tvtime-configure -d /dev/video4'
alias tvtime-video5='tvtime-configure -d /dev/video5'
alias wgeturlfromfile='wget -r -l1 -H -t1 -nd -N -np -A.jpg -erobots=off -i'	# -i file.txt
alias wget='wget -c'
alias yr='yaourt -Rs -C'
alias yss='yaourt -Ss -C'
alias ys='yaourt -S -C'
alias ysyu='yaourt -Syu -C'
alias ysy='yaourt -Sy -C'



##################################################
# Apt-cache stuff				 #
##################################################

alias aptadd='sudo apt-cache add'
alias aptdepends='sudo apt-cache depends'
alias aptdotty='sudo apt-cache dotty'
alias aptdumpavail='sudo apt-cache dumpavail'
alias aptdump='sudo apt-cache dump'
alias aptgencaches='sudo apt-cache gencaches'
alias aptpkgnames='sudo apt-cache pkgnames'
alias aptpolicy='sudo apt-cache policy'
alias aptrdepends='sudo apt-cache rdepends'
alias aptsearch='sudo apt-cache search'
alias aptshowpkg='sudo apt-cache showpkg'
alias aptshowsrc='sudo apt-cache showsrc'
alias aptshow='sudo apt-cache show'
alias aptstats='sudo apt-cache stats'
alias aptunmet='sudo apt-cache unmet'
alias aptxvcg='sudo apt-cache xvcg'



##################################################
# Apt-get stuff					 #
##################################################

alias autoremove='sudo apt-get autoremove'
alias check='sudo apt-get check'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias dselect-upgrade='sudo apt-get dselect-upgrade'
alias source='sudo apt-get source'



##################################################
# Apt-history Stuff				 #
##################################################

alias historya='apt-history'
alias historyi='apt-history install'
alias historyre='apt-history remove'
alias historyro='apt-history rollback'
alias historyu='apt-history upgrade'



##################################################
# Aptitude stuff				 #
##################################################

alias autoclean='sudo aptitude autoclean'
alias build-dep='sudo aptitude build-dep'
alias changelog='sudo aptitude changelog'
alias clean='sudo aptitude clean'
alias download='sudo aptitude download'
alias forbid-version='sudo aptitude forbid-version'
alias forget-new='sudo aptitude forget-new'
alias full-upgrade='sudo aptitude full-upgrade'
alias hold='sudo aptitude hold'
alias install='sudo aptitude install'
alias linux-image='sudo aptitude search linux-image'		# linux-image kernel update check
alias markauto='sudo aptitude markauto'
alias purge='sudo aptitude purge'
alias reinstall='sudo aptitude reinstall'
alias remove='sudo aptitude remove'
alias search='sudo aptitude search'
alias show='sudo aptitude show'
alias unhold='sudo aptitude unhold'
alias unmarkauto='sudo aptitude unmarkauto'
alias update='sudo aptitude update'
alias upgrade='sudo aptitude safe-upgrade'
alias why-not='sudo aptitude why-not'
alias why='sudo aptitude why'



##################################################
# Chown substitution				 #
##################################################

alias chown-backgrounds='sudo chown -R $USER:$USER ~/Pictures/Backgrounds'
alias chown-backups='sudo chown -R $USER:$USER ~/Backups'
alias chown-books='sudo chown -R $USER:$USER ~/eBooks'
alias chown-desktop='sudo chown -R $USER:$USER ~/Desktop'
alias chown-documents='sudo chown -R $USER:$USER ~/Documents'
alias chown-downloads='sudo chown -R $USER:$USER ~/Downloads'
alias chown-drive-c='sudo chown -R $USER:$USER ~/.wine/drive_c'
alias chown-home='sudo chown -R $USER:$USER ~/'
alias chown-images='sudo chown -R $USER:$USER ~/Images'
alias chown-localhost='sudo chown -R $USER:$USER ~/var/www'
alias chown-music='sudo chown -R $USER:$USER ~/Music'
alias chown-nautilus-scripts='sudo chown -R $USER:$USER ~/.gnome2/nautilus-scripts'
alias chown-packages='sudo chown -R $USER:$USER ~/Packages'
alias chown-pictures='sudo chown -R $USER:$USER ~/Pictures'
alias chown-ppc='sudo chown -R $USER:$USER ~/PPC'
alias chown-public='sudo chown -R $USER:$USER ~/Public'
alias chown='sudo chown -R $USER:$USER'
alias chown-temp='sudo chown -R $USER:$USER ~/Temp'
alias chown-torrents='sudo chown -R $USER:$USER ~/Torrents'
alias chown-ubuntu-texts='sudo chown -R $USER:$USER ~/Documents/"Ubuntu Texts"'
alias chown-videos='sudo chown -R $USER:$USER ~/Videos'



##################################################
# Command substitution				 #
##################################################

alias abs='sudo abs'
alias a='ssh-agent;ssh-add'
alias bt='aria2c --max-upload-limit=10K --seed-time=60 --listen-port=8900-8909'		# shortcut for downloading a torrent file on the command line
alias c='clear'
alias ci='vim'
alias ck='killall conky && conky -d'
alias cls='clear'
alias contents='/bin/tar -tzf'								# can View the contents of a Tar file
alias cp='cp -iv'
alias d_='ssh 192.168.1.4'
alias dr='dirs -v'
alias ds_='dig +noauthority +noadditional +noqr +nostats +noidentify +nocmd +noquestion +nocomments'		# short and sweet output from dig(1)
alias e='espeak'
alias egrep='egrep –color=auto'
alias enote='vi ~/todo;~/motd.pl'
alias fgrep='fgrep –color=auto'
alias ge='geany'
alias go='startx'
alias grep='grep --color=auto'								# highlight matched pattern
alias g_='mocp -G'
alias halt='sudo /sbin/halt'
alias h='history | grep $1'
alias hib='sudo pm-hibernate'
alias ie='wine iexplore.exe'								# browse the Internet using Internet Explorer
alias im='centerim'  									# terminal based instant messaging client
alias img='imgurbash' 									# uploads image to imgur
alias irc='irssi' 									# terminal based IRC
# alias irssi='screen -wipe; screen -A -U -x -R -S irssi irssi'				# for creating screen session containing IRSSI, named irssi, while checking if existing session is created
alias j='jobs -l'
alias kfx='killall firefox-bin'
alias kgp='killall gnome-panel'
alias k='kill'
alias kk='sendmail -d0.4 -bv root |less'
alias kn='killall nautilus'
alias last='last -a'
alias lock='clear && vlock -c'								# clear and lock console (non-X) terminal
alias logs='tail -f /var/log/messages /var/log/*log'
alias m='~/bin/motd.pl'
alias mc='metacafe-dl -t'
alias me='vi ~/.muttrc'
alias mkdir='mkdir -p -v'
alias mktd='tdir=`mktemp -d` && cd $tdir'						# make a temp dir, then immediately cd into it
alias m=mutt
alias more='less'
alias mp='screen -d -m mousepad'
alias mv='mv -iv'
alias na='nano'
alias n='nautilus & exit'
alias np='mpc --format "np: [[%artist%] - [%title%] - 					#[[%album%] ##[%track%]#]]|[%file%]" | head -n 1'
alias nq='nautilus -q'
alias oe='wine msimn.exe'								# read email with Outlook Express
alias packup='/bin/tar -czvf'								# compress a file in tar format
alias parts='cat /proc/partitions'
# alias paste='ix'  									# pastes to ix.ox pastebin service
alias paste='pastebinit'
alias path='echo -e ${PATH//:/\\n}'
alias pe='vi ~/.procmailrc'
alias pg='ps aux | grep'*								# requires an argument
alias pi='`cat ~/.pi | grep ' ; alias addpi='echo "cd `pwd`" >> ~/.pi'			# fast access to any of your favorite directory.
alias ping='ping -c 10'
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'           				# pretty-print using enscript
alias print='/usr/bin/lp -o nobanner -d $LPDEST'            				# assumes LPDEST is defined (default printer)
alias ps='ps auxf'
alias p_='for ((n=0;n<1;n++)); do dd if=/dev/urandom count=1 2> /dev/null | uuencode -m -| sed -ne 2p | cut -c-8; done' # creating password
alias :q='exit'
alias q='exit'
alias rcci='svn ci ~/rc/'
alias rcup='~/bin/rc_sync.sh'
alias rd='cd "`pwd -P`"' 								# if in directory containing symlink in path, change to "real" path
alias real_location='readlink -f' 							# get real location of file
alias reboot='sudo /sbin/reboot'
# alias reboot='sudo shutdown -r now'   						# easy shutdown management
alias refresh='nautilus -q && gconftool-2 --shutdown && rm -rf /home/$HOME/.gconf/apps/panel && pkill gnome-panel'	# safely close/refresh nautilus and gnome-panel
alias rgrep='find . \( ! -name .svn -o -prune \) -type f -print0 | xargs -0 grep'	# rgrep: recursive grep without .svn
alias rh='rehash'
alias rmdir='rmdir -v'
alias rm='rm -iv'
alias root='sudo bash -l'								# generic shortcut for switching to root user depending on system
# alias root='sudo -i'									# generic shortcut for switching to root user depending on system
# alias root='su -'									# generic shortcut for switching to root user depending on system
alias scx='screen -x'
alias sdi='sudo dpkg -i'
alias se='vi ~/.screenrc'
alias sg='sudo geany'
alias shutdown='sudo shutdown -h now'							# proper restart
alias shutdownde='for ((;;)) do pgrep wget ||shutdown -h now; sleep 5; done'		# if download end, shutdown
alias sn='sudo nano'
alias split='split -d'
alias sr='screen -d -RR'
# alias s='sudo'
# alias s_='screen -X screen'; s top; s vi; s man ls;					# start a new command in a new screen window
alias sshdo='ssh -q -t root@localhost -- cd $PWD \&\& sudo'				# an alternative to sudo
alias sus='sudo pm-suspend'
alias svi='sudo vim'
alias tc='tar cfvz'
alias te='tail -50f /var/log/qmail/qmail-send/current | elog'
alias tf='tail -50f /var/log/iptables.log'
alias tm='tail -50f /var/log/messages.log'
alias ts='tail -50f /var/log/auth.log'
alias tweet_='bti'
alias tx='tar xfvz'
alias u='mocp -P && sudo pm-suspend ; sleep 1s && mocp -U && setxkbmap -option terminate:ctrl_alt_bksp && xmodmap .config/caps-esc && ~/.fehbg'	# something is messed up somewhere, dirty fix
alias unpack='/bin/tar -xzvpf'								# uncompress a a Tar file
alias updatefont='fc-cache -v -f'
alias url='tinyurl'
alias urlping="ping -q -c 1 www.google.com|awk -F/ 'END{print $5}'"			# do one ping to URL: good in MRTG gauge graph to monitor connectivity
alias v='zless -N'									# -N means display line numbers (turn off line numbers with -n)
alias ve='vi ~/.vimrc'
alias vi='vim'
alias web='w3m'   									# terminal based web browser
alias which='type -all'
alias win='/media/win'
alias wtf='watch -n 1 w -hs'
alias xee='cat /var/log/Xorg.0.log |grep EE'
alias xevs="xev | grep 'keycode\|button'"						# only show button events for xev
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
alias x='startx'
alias xww='cat /var/log/Xorg.0.log |grep WW'
alias z='zenity --info --text="You will not believe it, but your command has finished now! :-)" --display :0.0'	# get a desktop notification from the terminal
alias zen='fortune /usr/share/fortune/zen'



##################################################
# Command substitution (for typos)		 #
##################################################

alias findgrep='grepfind'
alias mann='man'
alias moer='more'
alias moew='more'
alias updtae='update'
alias vf='cd'
alias xs='cd'
alias yauort='yaourt'
alias yoaurt='yaourt'
alias youart='yaourt'
alias yuaort='yaourt'
alias yuoart='yaourt'



##################################################
# Computer cleanup				 #
##################################################

alias cleanup="sudo apt-get -y autoclean && sudo apt-get -y autoremove && sudo apt-get -y clean && sudo apt-get -y remove && sudo deborphan | xargs sudo apt-get -y remove --purge && sudo aptitude purge `dpkg --get-selections | grep deinstall | awk '{print $1}'`"
alias configpurge="sudo aptitude purge `dpkg --get-selections | grep deinstall | awk '{print $1}'`"	# purge configuration files of removed packages on debian systems
alias kernelcleanup="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge"										# remove all unused Linux Kernel headers, images & modules
alias orphaned='sudo deborphan | xargs sudo apt-get -y remove --purge'
alias tp='trash-put'											# sends files to trash instead of perm deleting w/rm
alias trash='rm -fr ~/.Trash'



##################################################
# DD substitution				 #
##################################################

alias backup-sda='sudo dd if=/dev/hda of=/dev/sda bs=64k conv=notrunc,noerror'		# to backup the existing drive to a USB drive
alias cdcopy='sudo dd if=/dev/cdrom of=cd.iso'						# for cdrom
alias cdiso='sudo dd if=/dev/hda of=cd.iso bs=2048 conv=sync,notrunc'			# to make an iso image of a CD
alias dd-sda-full='sudo dd if=/dev/urandom of=/dev/sda bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sda-r='sudo dd if=/dev/urandom of=/dev/sda bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sda='sudo dd if=/dev/zero of=/dev/sda conv=notrunc'				# to wipe hard drive with zero
alias dd-sdb-full='sudo dd if=/dev/urandom of=/dev/sdb bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sdb-r='sudo dd if=/dev/urandom of=/dev/sdb bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sdb='sudo dd if=/dev/zero of=/dev/sdb conv=notrunc'				# to wipe hard drive with zero
alias dd-sdc-full='sudo dd if=/dev/urandom of=/dev/sdc bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sdc-r='sudo dd if=/dev/urandom of=/dev/sdc bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sdc='sudo dd if=/dev/zero of=/dev/sdc conv=notrunc'				# to wipe hard drive with zero
alias dd-sdd-full='sudo dd if=/dev/urandom of=/dev/sdd bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sdd-r='sudo dd if=/dev/urandom of=/dev/sdd bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sdd='sudo dd if=/dev/zero of=/dev/sdd conv=notrunc'				# to wipe hard drive with zero
alias dd-sde-full='sudo dd if=/dev/urandom of=/dev/sde bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sde-r='sudo dd if=/dev/urandom of=/dev/sde bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sde='sudo dd if=/dev/zero of=/dev/sde conv=notrunc'				# to wipe hard drive with zero
alias dd-sdf-full='sudo dd if=/dev/urandom of=/dev/sdf bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sdf-r='sudo dd if=/dev/urandom of=/dev/sdf bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sdf='sudo dd if=/dev/zero of=/dev/sdf conv=notrunc'				# to wipe hard drive with zero
alias dd-sdg-full='sudo dd if=/dev/urandom of=/dev/sdg bs=8b conv=notrunc,noerror'	# to wipe hard drive with random data option (1)
alias dd-sdg-r='sudo dd if=/dev/urandom of=/dev/sdg bs=102400'				# to wipe hard drive with random data option (2)
alias dd-sdg='sudo dd if=/dev/zero of=/dev/sdg conv=notrunc'				# to wipe hard drive with zero
alias diskcopy='sudo dd if=/dev/dvd of=/dev/cdrecorder'
alias floppycopy='sudo dd if=/dev/fd0 of=floppy.image'					# to duplicate a floppy disk to hard drive image file
alias partitioncopy='sudo dd if=/dev/sda1 of=/dev/sda2 bs=4096 conv=notrunc,noerror'	# to duplicate one hard disk partition to another hard disk partition
alias restore-sda='sudo dd if=/dev/sda of=/dev/hda bs=64k conv=notrunc,noerror'		# to restore from the USB drive to the existing drive
alias scsicopy='sudo dd if=/dev/scd0 of=cd.iso'						# if cdrom is scsi



##################################################
# Defragmenting and Fragmentation-Checking	 #
# Tools						 #
##################################################

alias defrag-home='defrag ~'			# uses 'defrag' function
alias defrag-root='defrag /root'		# uses 'defrag' function
alias defrag-system='defrag /'			# uses 'defrag' function
alias defrag2-home='defrag2 ~'			# uses 'defrag2' function
alias defrag2-root='defrag2 /root'		# uses 'defrag2' function
alias defrag2-system='defrag2 /'		# uses 'defrag2' function
alias fragcheck-home='fragcheck ~'		# uses 'fragcheck' function
alias fragcheck-root='fragcheck /root'		# uses 'fragcheck' function
alias fragcheck-system='fragcheck /'		# uses 'fragcheck' function
alias fragcheck2-home='fragcheck2 ~'		# uses 'fragcheck2' function
alias fragcheck2-root='fragcheck2 /root'	# uses 'fragcheck2' function
alias fragcheck2-system='fragcheck2 /'		# uses 'fragcheck2' function



##################################################
# Directory shortcuts				 #
##################################################

alias back='cd $OLDPWD'
alias backgrounds='cd ~/Pictures/Backgrounds'
alias backups='cd ~/Backups'
alias books='cd ~/eBooks'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias drive-c='cd ~/.wine/drive_c'
alias dropbox='cd ~/Dropbox'
alias home='cd ~/'
alias images='cd ~/Images'
alias localhost='cd /var/www'
alias movies='cd ~/Videos'
alias music='cd ~/Music'
alias nautilus-scripts='cd ~/.gnome2/nautilus-scripts'
alias packages='cd ~/Packages'
alias packets='cd ~/.packets'
alias pictures='cd ~/Pictures'
alias ppc='cd ~/PPC'
alias public='cd ~/Public'
alias temp='cd ~/Temp'
alias test='cd ~/.test'
alias torrents='cd ~/Torrents'
alias ubuntu-texts='cd ~/Documents/"Ubuntu Texts"'
alias videos='cd ~/Videos'
alias webdesign='cd ~/Web/Design'
alias whereami='display_info'



##################################################
# Espeak commands				 #
##################################################

alias espeak-file='espeak -s 150 -f'
alias espeak-us='espeak -v en-us -s 150'
alias espeak-wav='espeak -s 150 -w voice.wav'
alias espeak-wav-file='espeak -s 150 -w voice.wav -f'



##################################################
# Git stuff					 #
##################################################

alias gitouch='find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;'
alias gitup='git pull'
alias gitci='git commit -a -m'
alias gitco='git clone'
alias gita='git add'
alias gitb='git branch'
alias gitc='git checkout'



##################################################
# Hardware Shortcuts				 #
##################################################

alias 0='amixer set PCM 0'
alias -- -='amixer set PCM 2-'
alias +='amixer set PCM 2+'
alias blankcd='cdrecord -v dev=/dev/cdrom blank=fast gracetime=3'
alias blankdvd='cdrecord -v dev=/dev/dvd blank=fast gracetime=3'
alias blueoff='sudo /etc/rc.d/bluetooth stop'
alias blueon='sudo /etc/rc.d/bluetooth start'
alias blueres='sudo /etc/rc.d/bluetooth restart'
alias brand='growisofs -Z /dev/cdrw -v -l -R -J -joliet-long'
alias burnaudiocd='mkdir ./temp && for i in *.[Mm][Pp]3;do mpg123 -w "./temp/${i%%.*}.wav" "$i";done;cdrecord -pad ./temp/* && rm -r ./temp'	# burn a directory of mp3s to an audio cd
alias cdc='eject -t /dev/cdrecorder'
alias cdo='eject /dev/cdrecorder'
alias cruzer='mount /media/cruzer'
alias dvdc='eject -t /dev/dvd'
alias dvdo='eject /dev/dvd'
alias ipod='mount /media/ipod && cd /media/ipod'
alias kingston='mount /media/kingston && cd /media/kingston'
alias laptop_display='sudo cat /proc/acpi/video/VGA/LCD/brightness'		# set laptop display brightness	(path may vary depending on laptop model
alias laptop_displays='echo <percentage> > /proc/acpi/video/VGA/LCD/brightness'	# to discover the possible values for your display
alias mountcd='sudo mount -t is09660 /dev/sr0 /media/cdrom'
alias mountedinfo='df -hT'
alias mountiso='sudo mount ${1} ${2} -t iso9660 -o ro,loop=/dev/loop0'
alias mountwin='mount -t ntfs /dev/sda1 /media/win'
alias mp3='mount /media/mp3 && cd /media/mp3'
alias playm='for i in *.mp3; do play $i; done'
alias playo='for i in *.ogg; do play $i; done'
alias playw='for i in *.wav; do play $i; done'
alias scan='scanimage -L'
alias sd='mount /media/sd'
alias ucruzer='umount /media/cruzer'
alias uipod='umount /media/ipod'
alias ukingston='umount /media/kingston'
alias umountiso='sudo umount /media/iso'
alias ump3='umount /media/mp3'
alias usd='umount /media/sd'
alias uverbatim='umount /media/verbatim'
alias verbatim='mount /media/verbatim && cd /media/verbatim'



##################################################
# Information					 #
##################################################

alias big='function BIG() { find . -size +${1}M -ls; }; BIG $1'				# find large files in current directory
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'				# show biggest directories
alias boothistory='for wtmp in `dir -t /var/log/wtmp*`; do last reboot -f $wtmp; done | less'
alias charcount='wc -c $1'								# count number of characters in text file
alias color1='sh ~/.scripts/termcolor1'   						# displays colorset 1
alias color2='sh ~/.scripts/termcolor2'   						# displays colerset 2
alias color3='sh ~/.scripts/termcolor3'   						# displays colorset 3
alias counts='sort | uniq -c | sort -nr'						# a nice command for summarising repeated information
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'			# to find CPU hogs
alias cputemp='while sleep 1; do acpi -t | osd_cat -p bottom; done &'			# to get the CPU temperature continuously on the desktop
alias ctemp='sensors -f && sensors'							# to get the computer temperature in Fahrenheit and Celcius
alias df='df -h -x tmpfs -x usbfs'							# displays global disk usage by partition, excluding supermounted devices
alias directorydiskusage='du -s -k -c * | sort -rn'
alias dir='ls --color=auto --format=vertical'
alias diskwho='sudo iotop'
alias dmidecode='sudo dmidecode --type 17 | more'					# check RAM sed and type in Linux
alias ducks='ls -A | grep -v -e '\''^\.\.$'\'' |xargs -i du -ks {} |sort -rn |head -16 | awk '\''{print $2}'\'' | xargs -i du -hs {}'	# useful alias to browse your filesystem for heavy usage quickly						# to show processes reading/writing to disk
alias du='du -h --max-depth=1'								# displays disk usage by directory, in human readable format
alias dush='du -sm *|sort -n|tail'							# easily find megabyte eating files or directories
alias env2='for _a in {A..Z} {a..z};do _z=\${!${_a}*};for _i in `eval echo "${_z}"`;do echo -e "$_i: ${!_i}";done;done|cat -Tsv'	# print all environment variables, including hidden ones
alias exportkeys='sudo apt-key exportall > repokeys.txt'				# exports all repo keys info into single 'repokeys.txt' document
alias exportkey='sudo apt-key export'							# show single repo key info using keyid found in 'sudo apt-key list'
alias ffind='sudo find / -name $1'
alias free='free -m'									# RAM and SWAP detail in MBs
alias freqwatch='watch --interval 1 "cat /proc/acpi/thermal_zone/THRM/*; cat /proc/cpuinfo | grep MHz; cat /proc/acpi/processor/*/throttling"'  # monitor cpu freq and temperature
alias hardware='sudo lshw -html > hardware.html'					# overview of the hardware in the computer
# alias hgrep='history | grep --color=always'						# search commands history
alias hiddenpnps='unhide (proc|sys|brute)'						# forensic tool to find hidden processes and ports
alias hogc='ps -e -o %cpu,pid,ppid,user,cmd | sort -nr | head'				# display the processes that are using the most CPU time and memory
alias hogm='ps -e -o %mem,pid,ppid,user,cmd | sort -nr | head'				# display the processes that are using the most CPU time and memory
alias la_='ls -Al'									# show hidden files
alias l?='cat ~/technical/tips/ls'
alias lc='ls -ltcr'       								# sort by and show change time, most recent last
alias ldir='ls -lhA |grep ^d'
alias ld='ls -ltr' 									# sort by date
alias lfiles='ls -lhA |grep ^-'
alias lf="ls -Alh --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"	# full ls with octal+symbolic permissions
alias lgg='ls --color=always | grep --color=always -i'					# quick case-insenstive partial filename search
alias lh='ls -Al' 									# show hidden files
alias lh='ls -lAtrh' 									# sort by date and human readable
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias li='ls -ai1|sort' 								# sort by index number
alias linecount='wc -l $1'								# count number of lines in text file
alias lk='ls -lSr'									# sort by size
alias llllll='ls -FlaXo --color=auto'							# sort the extensions alphabetically; good for winfiles
alias lllll='ls -Fla --full-time -o -Q --color=auto'					# whatever
alias llll='ls -laS --color=auto'							# sort by size
alias lll='ls -Falot --color=auto'							# sort by mod time
alias ll_='ls -l'									# long listing
alias l.='ls -d .[[:alnum:]]* 2> /dev/null || echo "No hidden file here..."'		# list only hidden files
alias l='ls -hF --color'								# quick listing
alias lm_='ls -al |more'    								# pipe through 'more'
alias ln='ln -s'
alias lr='ls -lR'									# recursice ls
alias lrt='ls -lart'									# list files with last modified at the end
alias lsam='ls -am' 									# List files horizontally
alias lsdd='ls -latr'                                 					# sort by date
alias lsd='ls -l | grep "^d"'								# list only directories
alias lsize='ls --sort=size -lhr'							# list by size
alias lsl='ls -lah'                                   					# long list, human-readable
alias ls='ls -hF --color'								# add colors for filetype recognition
alias lsnew='ls -Alh --color=auto --time-style=+%D | grep `date +%D`'
alias lss='ls -shaxSr'                         			       			# sort by size
alias lsss='ls -lrt | grep $1'								# to see something coming into ls output: lss
alias lsx='ls -ax' 									# sort right to left rather then in columns
alias lt_='ls -alt|head -20' 								# 20, all, long listing, modification time
alias lt='ls -ltr'         								# sort by date, most recent last
alias lu='ls -ltur'        								# sort by and show access time, most recent last
alias lx='ls -lXB'									# sort by extension
# alias man='TERMINFO=~/.terminfo TERM=mostlike LESS=C PAGER=less man'			# cool colors for manpages
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'		# to find memory hogs
alias mem_hogs_top='top -l 1 -o rsize -n 10'						# to find memory hogs
alias mem='~/.scripts/realmem'								# estimates memory usage
alias mypc="hal-get-property --udi /org/freedesktop/Hal/devices/computer --key 'system.hardware.product'"		# show computer model
alias myps='/bin/ps -u "$USER" -o user,pid,ppid,pcpu,pmem,args|less'			# ps
alias numFiles='echo $(ls -1 | wc -l)'							# numFiles: number of (non-hidden) files in current directory
# alias packagelist='sudo dpkg --get-selections'					# show llist of all packages (columns)
alias packagelist="sudo aptitude search -F %p ~i --disable-columns"			# show list of all packages (columns)
alias packagelist_="sudo aptitude search -F %p ~i --disable-columns | sed 's/$/,/' | tr '\n\r' ' ' | sed 's/, $//'"	# list all packages (1-liner)
alias phonesearch='grep '[0-9]\{3\}-[0-9]\{4\}' "$1"'					# search phone #'s in file (requires XXX-XXX-XXXX format)
alias processbycpuusage="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias processbymemusage='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias processtree='ps -e -o pid,args --forest'
alias pss='ps -ef | grep $1'								# to check a process is running in a box with a heavy load: pss
alias rcommand='ls /usr/bin | shuf -n 1'						# get a random command
# alias rcommand='man $(ls /usr/bin | shuf -n 1)'					# get a random command
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'	# display environment vars only, using set
alias showallaliases='compgen -A alias'							# list bash alias defined in .bash_profile or .bashrc
alias showallfunctions='compgen -A function'						# list bash functions defined in .bash_profile or .bashrc
alias showkeys='sudo apt-key list'							# shows list of repository keys
alias sizeof='du -sh'
alias space='df -h'									# disk space usage
alias sshall='logwatch --service sshd --range all --detail high --print --archives'
alias sshtoday='logwatch --service sshd --range today --detail high --print --archives'
alias superfind='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) -name'
alias top-commands='history | awk "{print $2}" | awk "BEGIN {FS="|"} {print $1}" |sort|uniq -c | sort -rn | head -10'	# show most popular commands
alias topforever='top -l 0 -s 10 -o cpu -n 15'						# continual 'top' listing (every 10 sec) showing top 15 CPU things
alias topten='du -sk $(/bin/ls -A) | sort -rn | head -10'				# displays the top ten biggest folders/files in the current directory
alias top20='du -xk | sort -n | tail -20'						# find the 20 biggest directories on the current filesystem
alias top_='xtitle Processes on $HOST && top'						# uses the function 'xtitle'
alias treefind_="find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'"		# displays a tree of the arborescence
alias tree='tree -Cs'									# nice alternative to 'ls'
alias unusedkernels="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'"											# show installed but unused linux headers, image, or modules
alias vdir='ls --color=auto --format=long'
alias ver='cat /etc/lsb-release'							# Ubuntu version detail
alias version='sudo apt-show-versions'							# show version
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'		# which alias
alias WHOAMI='getent passwd $(whoami) | cut -f 5 -d: | cut -f 1 -d,'			# prints out what the users name, notifyed in the gecos field is
alias wordcount='wc -w $1'								# count number of words in text file



##################################################
# Information (clock and date stuff)		 #
##################################################

alias am-pm='date +"%p"'								# AM/PM (ex. AM)
alias bdate2="date +'%a %Y-%m-%d %H:%M:%S %z'"						# date command (ex. Sun 2011-01-23 05:39:26 -0500)
alias bdate3='date "+%Y-%m-%d %A    %T %Z"'						# date command (ex. 2011-01-23 Sunday    05:39:23 EST)
alias bdate="date '+%a, %b %d %Y %T %Z'"						# date command (ex. Sun, Jan 23 2011 05:39:13 EST)
alias cal='cal -3' 									# show 3 months by default
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'	# view all date formats, quick reference help alias
alias day='date +%A'									# day of the week (ex. Saturday)
alias DAY='date "+%A" | tr '[a-z]' '[A-Z]''						# day (text) (ex. SATURDAY)
alias day#='date +%d'									# date (numeric) (ex. 22)
alias daysleft='echo "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'	# how many days until the end of the year
alias epochdaysleft="perl -e 'printf qq{%d\n}, time/86400;'"				# perl one-liner to determine number of days since the Unix epoch
alias epochtime='date +%s'								# report number of seconds since the Epoch (ex. 1295779549)
alias month='date +%B'									# month (ex. January)
alias MONTH='date "+%B" | tr '[a-z]' '[A-Z]''						# month (text) (ex. JANUARY)
alias mytime='date +%H:%M:%S'								# shows just the current time (ex. 05:46:05)
alias ntpdate='sudo ntpdate ntp.ubuntu.com pool.ntp.org'				# time synchronisation with NTP (ex. 23 Jan 05:46:29)
alias oclock='read -a A<<<".*.**..*....*** 8 9 5 10 6 0 2 11 7 4";for C in `date +"%H%M"|fold -w1`;do echo "${A:${A[C+1]}:4}";done'   # odd clock
alias onthisday='grep -h -d skip `date +%m/%d` /usr/share/calendar/*'			# on this day
alias onthisday_='firefox http://en.wikipedia.org/wiki/$(date +'%b_%d')'		# what happened on this day in history?
alias secconvert='date -d@1234567890'							# convert seconds to human-readable format (ex. Fri Feb 13 18:31:30 EST 2009)
alias stamp='date "+%Y%m%d%a%H%M"'							# timestamp (ex. 20110123Sun0545)
alias time2='date +"%I:%M"'								# time (hours:minutes) (ex. 05:13)
alias time3='date +"%l:%M %p"'								# time (ex. 5:13 AM)
alias time4='date +"%H:%M"'								# time (hours:minutes) (ex. 05:13)
alias timestamp='date "+%Y%m%dT%H%M%S"'							# timestamp (ex. 20110123T054906)
alias today='date +"%A, %B %-d, %Y"'							# date command (ex. Sunday, January 23, 2011)
alias weeknum='date +%V'								# perl one-liner to get the current week number (ex. 03)



##################################################
# Miscellaneous					 #
##################################################

alias -- --='-;-'
alias -- ---='-;-;-'
alias -- ----='-;-;-;-'
alias -- -----='-;-;-;-;-'
alias ++='+;+'
alias +++='+;+;+'
alias ++++='+;+;+;+'
alias +++++='+;+;+;+;+'
alias addkey='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'
alias addrepo='sudo add-apt-repository'							# add a repo to repo .list
alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'	# notified when job run in terminal is done using NotifyOSD
alias alert='notify-send -i gnome-terminal "Finished Terminal Job" "[$?] $(alert_helper)"'	# usage: sleep 5; alert
alias alph='cat "$1" | sort > "$1"'							# alphabetizes a file
alias alsamixer='alsamixer -V all'
alias autokey='sudo apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg --keyserver pool.sks-keyservers.net --recv $key && gpg --export --armor $key | sudo apt-key add -; done'	# grab missing keys
alias bashrc-copy-r='sudo cp /root/.bashrc ~/.bashrc'
alias bashrc-copy='sudo cp ~/.bashrc /root/.bashrc'
alias bashrc-cpr='sudo cp ~/.bashrc /root/.bashrc && cp ~/.bashrc ~/Temp && gedit ~/.bashrc && exit'
alias bashrc='gedit ~/.bashrc & exit'
alias bashrc-root='sudo gedit ~/.bashrc & exit'
alias bashrc-temp='cp ~/.bashrc ~/Temp'
alias bbc='lynx -term=vt100 http://news.bbc.co.uk/text_only.stm'
alias bedit='vim ~/.bashrc; source ~/.bashrc'
alias beep='echo -en "\007"'								# ring the bell
alias bgedit='gedit ~/.bashrc; source ~/.bashrc'
alias blipfm="mpg123 `curl -s http://blip.fm/all | sed -e 's#"#\n#g'  | grep mp3$  | xargs`"	# play random music from blip.fm
alias capture='IMAGE="$HOME/Pictures/capture-`date +%Y%m%d%H%M%S`.png"; import -frame $IMAGE; echo "Image saved as $IMAGE"'	# save portion of desktop as image
alias cic='set completion-ignore-case On'						# make tab-completion case-insensitive
alias clisp='clisp -q'
alias commentremove="sed 's/[[:blank:]]*#.*//; /^$/d' "$1""				# this will remove comments that are at the end of lines
alias compiz-replace='compiz --replace'							# refreshes compiz (fixes drag/drop issue, among others)
alias cut80='/usr/bin/cut -c 1-80'							# truncate lines longer than 80 characters (for use in pipes)
alias debrepack='sudo dpkg-repack'							# just an easier-to-remember alias for 'dpkg-repack'
alias differ='sdiff --suppress-common-lines'						# bash alias for sdiff: differ
alias dmregister='lynx http://desmoinesregister.com'
alias dos2unix_='perl -pi -e 's/\r\n/\n/g' *'
alias downNuncompress='wget http://URL/FILE.tar.gz -O- | tar xz'			# download a file and uncompress it while it downloads
# alias downNuncompress='curl http://URL/FILE.tar.gz | tar xz'				# download a file and uncompress it while it downloads
alias du0='du --max-depth=0'
alias du1='du --max-depth=1'
alias ebrc='nano ~/.bashrc'
alias ebrcupdate='source ~/.bashrc'
alias edit='nano'
alias elog='tai64nlocal'
alias encryptall='for f in * ; do [ -f $f ] && openssl enc -aes-256-cbc -salt -in $f -out $f.enc -pass file:/tmp/password-file ; done'	# encrypt every file in current directory with 256-bit AES, retaining original
alias fixmount='sudo e2fsck -f /dev/sda1'						# repair device booting/mounting error (for /dev/sda1)
alias fixopera='rm -r ~/.opera/{mail,lock}'
alias fixres='xrandr --size 1600x1200'      						# reset resolution
alias fix_stty='stty sane'								# restore terminal settings when they get completely screwed up
alias flv2ogg='for i in $(ls *.flv); do ffmpeg2theora -v 6 --optimize $i; done'		# convert all FLV's in a directory to Ogg Theora (video)
alias flvaudio='ffmpeg -i "$1" -f mp3 -vn -acodec copy ouput.mp3'			# extract sound from flv & make mp3
alias foldpb='pbpaste | fold -s | pbcopy'						# make text in clipboard wrap so as to not exceed 80 characters
alias funkcje="grep -o '^[a-zA-Z]\{1,\}.(*)' ~/.bashrc"
alias gdbbt='gdb -q -n -ex bt -batch'							# print stack trace of a core file without needing to enter gdb interactively
alias gifted='giftd -d && giFTcurs'
alias gitk='screen -d -m gitk'
alias gmail='sh /$HOME/.scripts/gmail.sh'
alias googlevideo='wget -qO- "VURL" | grep -o "googleplayer.swf?videoUrl\\\x3d\(.\+\)\\\x26thumbnailUrl\\\x3dhttp" | grep -o "http.\+" | sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' | xargs echo -e | sed 's/.\{22\}$//g' | xargs wget -O "$1"'	# Google video download
alias gsop='gmplayer http://localhost:8909 -prefer-ipv4'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'		# alias HEAD for automatic smart output
alias hiresvideo='mplayer -framedrop -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all'	# play high-res video files on a slow processor
alias image2pdf='convert -adjoin -page A4 *.jpeg multipage.pdf'				# convert images to a multi-page pdf
alias irb='irb --readline -r irb/completion -rubygems'
alias jargon='wget -m http://catb.org/~esr/jargon/html/ -nH --cut-dirs=2 -np -L -P ~/Jargon/'
alias kernbuild='make -j3 && make modules_install && ls -ld ../linux && date'		# compile kernel, install modules, display kernel vers & date
alias kfire='for i in `ps aux | grep [F]irefox `; do echo $i; kill $(($i)); done; '
# alias kfire='kill $(pidof firefox)'
# alias kfire='kill $(ps aux | awk '/firefox/ {print $2}' | tr '\n' ' ')'
alias killall='killall -u $USER -v' 							# only kill our own processes, and also be verbose about it
alias killall_wine='wineserver -k'							# stop all Wine apps and processes
alias lastlog='lastlog | grep -v Never'
alias less='less -Mw'
alias lssd='ps ax | grep -v grep | grep -i firefox | while read pid; do kill "${pid%% *}"; done'
alias lstexfont='ls {/usr/share/texmf-dist/tex/latex/psnfss/*.sty,/usr/share/texmf-dist/tex/latex/pxfonts/*.sty}'
alias lvim="vim -c \"normal '0\""							# open the last file you edited in Vim.
alias makepasswd='makepasswd -minchars 8'
alias make_='xtitle Making $(basename $PWD) ; make'					# uses the function 'xtitle'
alias mencoder-join='mencoder -forceidx -ovc copy -oac copy -o'				# just add: whatever.avi whatever.pt1.avi whatever.pt2.avi ...
alias memlimit='ulimit -v 1000000; $1'							# limit memory usage per script/program
alias mic_record='arecord -q -f cd -r 44100 -c2 -t raw | lame -S -x -h -b 128 - `date +%Y%m%d%H%M`.mp3'	# record microphone input and output to date stamped mp3 file
alias minicom='minicom -c on' 								# enable colour (sudo apt-get install minicom)
alias mkdirday='mkdir `date +%Y%m%d`_$1'						# (by Karl Voit) creates directory that starts with current day
alias mkdsp='sudo mknod /dev/dsp c 14 3 && sudo chmod 777 /dev/dsp'			# remake /dev/dsp
alias mkpkg='makepkg -csi'
alias mp3ogg='mp32ogg *.mp3 && rm *.mp3'
alias mpfb='mplayer -vo fbdev -xy 1024 -fs -zoom "$1"'					# watch a movie in linux without the X windows system
alias mpfb_='mplayer -vo fbdev2 -fs -zoom -xy 1440'
alias mtrue='sudo truecrypt /media/usbdisk/$USER.tc ~/$USER'
alias n2r='sudo /etc/init.d/nginx stop && sleep 2 && sudo /etc/init.d/nginx start'
alias ncftp='xtitle ncFTP ; ncftp'							# uses the function 'xtitle'
alias nytimes='lynx -term=vt100 http://nytimes.com'
alias passwords='passwd && rm -rf ~/.gnome2/keyrings/*'					# removes keyring passwords and lets you change user password
alias ppa-purge='sudo ppa-purge'
alias pstree='/sw/bin/pstree -g 2 -w'
alias puttyreload='export TERM=putty && source ~/.bashrc'
alias quota='quota -s'  								# human readable quota!
alias recursivetouch='find . -exec touch {} \;'						# be careful with this as it can modify time stamp of files
alias repo='gksudo gedit /etc/apt/sources.list'
alias restart-apache='sudo /etc/init.d/apache2 restart'
alias retheme='sudo gnome-settings-daemon'						# refreshes the theme to fix grey basic theme error at startup
alias rkhunter='sudo rkhunter -c'
alias rmao='find . -iname a.out -exec rm {} \;'
alias rm_DS_Store_files='find . -name .DS_Store -exec rm {} \;'				# removes all .DS_Store file from the current dir and below
alias rsync-me='sudo rsync -a -v --progress --delete --modify-window=1 -s $HOME /home/rsync'
alias scpresume='rsync --partial --progress --rsh=ssh'
# alias screencast='ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s 1280x800+0+0 -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.mkv'
# alias screencast='ffmpeg -f x11grab -r 30 -s 1280x800 -i :0.0 $HOME/outputFile.mpg'	# record a screencast and convert it to an mpeg
alias screencast="ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4"		# capture video of a linux desktop
alias screenr='screen -r $(screen -ls | egrep -o -e '[0-9]+' | head -n 1)'		# quick enter into a single screen session
alias screen_restart='sudo /etc/init.d/gdm restart'					# restarts screen to login screen so as to get back in
alias sdiff='/usr/bin/sdiff --expand-tabs --ignore-all-space --strip-trailing-cr --width=160'	# sdiff the way it was at IBM
alias sdirs='source ~/.dirs'
alias service='sudo service'								# access a system service
alias sh_diff='diff -abBpur'
alias sh_indent='indent -nsaf -npcs -cli2 -i2 -lp -nprs -nsaw -nut -cbi2 -bli0 -bls -nbad -npsl'
alias shot!='archey && scrot -d 5 -c screen_`date +%Y-%m-%d`.png'			# is also a function of shot which does the screen for one window
alias show_='cat ~/.dirs'
alias show-colors='~/.bin/colors.sh'
alias show-info='~/.bin/info.pl'
alias show_options='shopt'								# show_options: display bash options settings
alias showrepo='cat /etc/apt/sources.list `ls /etc/apt/sources.list.d/*.list` | egrep -v "^$"'
alias sh_svnstat="svn status | awk '/^[^?]/'"
alias sourcea='source ~/.aliases.bash'							# to source this file (to make changes active after editing)
alias ssinfo='perl ~/.scripts/ssinfo.pl'
alias stopflash='for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done'	# brute force way to block all LSO cookies with the non-free Flash browser plugin
# alias svnaddall='find "$PWD" -exec svn add {} 2>/dev/null \;'				# add all files recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svndelall='svn status | grep "^\!" | awk "{print \$2}" | xargs svn delete'
alias svnrmallentries='find . -name .svn -print0 | xargs -0 rm -rf'			# remove all .svn directories recursively
alias tailm='multitail'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" &>/dev/null ) & )'					# create date-based tgz of current dir (runs in background)
# alias themeinfo='perl ~/Scripts/info.pl'
alias thumbit='mogrify -resize 25%'
alias tinyurl='~/.scripts/tinyurl'							# converts url to tinyurl
alias tkeys='tmux list-keys'  								# shows all tmux keys
alias trace='~/.scripts/trace'								# visual traceroute
alias txt2md='rename 's/\.txt$/\.md$/i' *'						# batch rename extension of all .txt files to .md files in a folder
alias ugrub2='sudo update-grub2'							# update grub2
alias ugrub='sudo update-grub'								# update grub
alias updatedb='sudo updatedb'
alias updatefonts='sudo fc-cache -vf'
alias usbb='rsync -avz /media/usbdisk/ ~/backup/usb/'
alias utrue='sudo truecrypt -d'
alias viaco='task="$(basename "$(pwd)")"; if [ -f "$task.c" ]; then vi -c "set mouse=n" -c "set autoread" -c "vsplit $task.out" -c "split $task.in" -c "wincmd l" -c "wincmd H" $task.c; fi'							# setup Vim environment for USACO coding
alias webcam='mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop'	# mplayer webcam window for screencasts
alias webshare='python -c "import SimpleHTTPServer; SimpleHTTPServer.test();"'
alias wiki='wikipedia2text -p'								# convert wiki to text output
alias wma2wav='for i in *.wma; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader:file="${i%.wma}.wav" "$i" ; done'	# convert wma to wav
alias xinitrc='vim ~/.xinitrc'
alias xsnow='(killall xsnow ; sleep 3 ; exec xsnow -nosanta -notrees -norudolf -nokeepsnow >& /dev/null &)'	# xsnow



##################################################
# Miscellaneous Fun				 #
##################################################

alias 99bottles='x="bottles of beer";y="on the wall";for b in {99..1};do echo "$b $x $y, $b $x. Take one down pass it around, $(($b-1)) $x $y"; sleep 3;done'
alias addictive='count="1" ; while true ; do read next ; if [[ "$next" = "$last" ]] ; then count=$(($count+1)) ; echo "$count" ; else count="1" ; echo $count ; fi ; last="$next" ; done'								# simple addicting bash game
alias aljazeera='rtmpdump -v -r rtmp://livestfslivefs.fplive.net/livestfslive-live/ -y "aljazeera_en_veryhigh" -a "aljazeeraflashlive-live" -o -| mplayer -'												# watch Aljazeera live
alias awesome='while $i;do `notify-send -t 200 "You are awesome :)"`;sleep 60; done;'		# get informed periodically by your box that you are awesome
alias busy='for i in `seq 0 100`;do timeout 6 dialog --gauge "Install..." 6 40 "$i";done'	# pretend to be busy in office to enjoy a cup of coffee
alias busy2='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias busy3='cat /dev/urandom | hexdump -C | highlight ca fe 3d 42 e1 b3 ae f8 | perl -MTime::HiRes -pnE "Time::HiRes::usleep(rand()*1000000)"'
alias earth='rm -f ~/Pictures/Backgrounds/mercator.jpg && wget -r -N http://static.die.net/earth/mercator/1600.jpg -O ~/Pictures/Backgrounds/mercator.jpg && gconftool-2 --type string --set /desktop/gnome/background/picture_filename ~/Pictures/Backgrounds/mercator.jpg'	# live earth wallpaper
# alias earth='mv ~/Pictures/Backgrounds/mercator.jpg ~/Pictures/Backgrounds/mercator.`timestamp`.jpg | wget -r -N http://static.die.net/earth/mercator/1600.jpg -O ~/Pictures/Backgrounds/mercator.jpg && gconftool-2 --type string --set /desktop/gnome/background/picture_filename ~/Pictures/Backgrounds/mercator.jpg'	# live earth wallpaper (downloads and saves each time)
alias einsteiny='A=1;B=100;X=0;C=0;N=$[$RANDOM%$B+1];until [ $X -eq $N ];do read -p "N between $A and $B. Guess? " X;C=$(($C+1));A=$(($X<$N?$X:$A));B=$(($X>$N?$X:$B));done;echo "Took you $C tries, Einstein";'						# numbers guessing game
alias etchasketch='c=12322123;x=20;y=20;while read -sn1 p;do k=${c:(p-1)*2:2};let x+=$((k/10-2));let y+=$((k%10-2));echo -en \\033[$y\;"$x"HX;done'	# use the 1 2 3 and 4 keys to move the cursor around the screen (It's an etch-a-sketch for your terminal!)
alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'		# excuses
alias freechess='telnet fics.freechess.org 5000'						# connects to a telnet server for free internet chess
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias funknet='telnet the-funk.net 7000'							# Access to Funk.net
alias futurama='curl -Is slashdot.org | sed -n '5p' | sed 's/^X-//''				# get Futurama quotations from slashdot.org servers
alias guitartune='for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done'		# tune your guitar from the command line
alias iamcow='fortune | cowsay'
alias iamsurprise='fortune | cowsay -f $(random_cow)'
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias lotto='shuf -i 1-49 -n 6 | sort -n | xargs'						# lotto generator
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias roulette='[ $[ $RANDOM % 6 ] == 0 ] && echo Die || echo Live'				# command line Russian roulette
alias screensaver='for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'												# terminal screensaver
alias starwars='telnet towel.blinkenlights.nl'							# the famous starwars ASCII version from telnet
alias termvideo_bw='mplayer -vo aa'								# watch movies in ASCII (just direct to the video)
alias termvideo='mplayer -vo caca'								# watch movies in ASCII (just direct to the video)
alias wooters='telnet zerocarbs.wooters.us'							# connects to a telnet service monitoring Woot (Gives you an updating woot! item tracker!)



##################################################
# Network/Internet -oriented stuff		 #
##################################################

alias appson="netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq"	# view only the process name using an internet connection
alias bandwidth='dd if=/dev/zero of=/dev/null bs=1M count=32768'			# processor / memory bandwidthd? in GB/s
alias browse_bonjour='dns-sd -B'							# browse services advertised via Bonjour
# alias daemons='ls /var/run/daemons'  							# daemon managment (ommited for function)
alias dbdumpcp='scp -P 1234 username@12.34.56.78:$HOME/Backup/www/data/someSite/db.sql $HOME/Backup/data/db.sql'	# copy remote db to local
alias dns='cat /etc/resolv.conf'							# view DNS numbers
alias domain2ban='~/.scripts/Domain2Ban.sh'
alias estab='ss -p | grep STA' 								# view only established sockets (fails if "ss" is screensaver alias)
alias finchsync='java -jar ~/finchsync/finchsync.jar'					# start FinchSync Admin
# alias ftop='watch -d -n 2 'df; ls -FlAt;''						# like top, but for files
alias hdinfo='hdparm -i[I] /dev/sda'							# hard disk information - model/serial no.
alias hostip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias hostname_lookup='lookupd -d'							# interactive debugging mode for lookupd (use tab-completion)
alias http_trace='pkt_trace port 80'							# to show all HTTP packets
alias iftop='sudo iftop -i eth0' 							# start "iftop" program (sudo apt-get install iftop)
alias ip4grep="grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}'"					# look for IPv4 address in files
alias ip='curl www.whatismyip.org'
alias ip_info='ipconfig getpacket en1'							# info on DHCP server, router, DNS server, etc (for en0 or en1)
alias ipt80='sudo iptstate -D 80'							# check out only iptables state of http port 80 (requires iptstate)
alias ip_trace='pkt_trace ip'								# to show all IP packets
alias ipttrans='sudo iptstate -D 51413'							# iptables state of Transmission-Daemon port (requires iptstate)
alias listen='sudo netstat -pnutl' 							# lists all listening ports together with PID of associated process
alias lsock='sudo /usr/sbin/lsof -i -P'							# to display open sockets ( -P option to lsof disables port names)
alias memrel='free && sync && echo 3 > /proc/sys/vm/drop_caches && free'		# release memory used by the Linux kernel on caches
alias net1='watch --interval=2 "sudo netstat -apn -l -A inet"'
alias net2='watch --interval=2 "sudo netstat -anp --inet --inet6"'
alias net3='sudo lsof -i'
alias net4='watch --interval=2 "sudo netstat -p -e --inet --numeric-hosts"'
alias net5='watch --interval=2 "sudo netstat -tulpan"'
alias net6='sudo netstat -tulpan'
alias net7='watch --interval=2 "sudo netstat -utapen"'
alias net8='watch --interval=2 "sudo netstat -ano -l -A inet"'
alias netapps="lsof -P -i -n | cut -f 1 -d ' '| uniq | tail -n +2"
alias nethogs='sudo nethogs eth0' 							# start "nethogs" program (sudo apt-get install nethogs)
alias netl='sudo nmap -sT -O localhost'
alias netscan='sudo iwlist wlan0 scan'							# to scan your environment for available networks, do the following
alias netstats='sudo iwspy wlan0'							# if card supports it, you can collect wireless statistics by using
alias network='sudo lshw -C network' 							# view network device info
alias networkdump='sudo tcpdump not port 22' 						# dump all the network activity except ssh stuff
alias nmr='sudo /etc/rc.d/networkmanager restart'
alias nsl='netstat -f inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'		# show all programs connected or listening on a network port
alias ns='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias openports='sudo netstat -nape --inet' 						# view open ports
alias pkt_trace='sudo tcpflow -i `active_net_iface` -c'
alias ports='lsof -i -n -P' 								# view programs using an internet connection
alias portstats='sudo netstat -s' 							# show statistics for all ports
alias proxy1='ssh -p 1234 -D 5678 username@12.34.56.78'					# SOCKS proxy - these anonomise browsing - 12.34.56.78
alias proxy2='ssh -p 8765 -D 4321 username@87.65.43.21'					# SOCKS proxy - these anonomise browsing - 87.65.43.21
alias QUERY='psql -h $MYDBHOST -p 5432 -d $MYDB -U $MYLOGIN --no-align'			# lazy SQL QUERYING
alias randomip='echo $((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256))'	# generate a random IP address
alias ramvalue='sudo dd if=/dev/mem | cat | strings'					# will show you all the string (plain text) values in ram
alias randommac='python -c "from itertools import imap; from random import randint; print ':'.join(['%02x'%x for x in imap(lambda x:randint(0,255), range(6))])"'										# generate random valid mac addresses
alias rdp='rdesktop -u "$USER" -g 1600x1200 -D -r disk:home=/home -r clipboard:PRIMARYCLIPBOARD'	# quick full screen RDP connection
alias remote='ssh -p 1234 12.34.56.78'							# access some remote host
alias restartnet='sudo /etc/rc.d/network restart;sudo /etc/rc.d/wicd restart'
alias rssup='php /srv/http/rssupdate.php'
alias setessid='sudo iwconfig wlan0 essid network-essid'				# set the essid, which identifies the network access point you want
alias smtp_trace='pkt_trace port smtp'							# to show all SMTP packets
alias someDBdump='sudo mysqldump someDB -uroot -p > $HOME/www/_dbs/someDB.sql'
alias spavr='gtkterm -c avr'
# alias spavr='sudo chmod a=rw /dev/ttyUSB0; gtkterm -c avr'
alias spk800i='gtkterm -c k800i'
# alias spk800i='sudo chmod a=rw /dev/rfcomm0; gtkterm -c k800i'
alias sql='mysql -p -u root'
alias sync='java -jar ~/finchsync/finchsync.jar -nogui'					# sync to PDA .. well, that'll be a sync then! - start FinchSync SVR
alias syncoff='java -jar ~/Apps/FinchSync/finchsync.jar -stopserver'			# sync to PDA .. well, that'll be a sync then! - stop FinchSync SVR
alias tcpstats='sudo netstat -st' 							# show statistics for tcp ports
alias tcp_='sudo netstat -atp' 								# list all TCP ports
alias tcp_trace='pkt_trace tcp'								# to show all TCP packets
alias topsites='curl -s -O http://s3.amazonaws.com/alexa-static/top-1m.csv.zip ; unzip -q -o top-1m.csv.zip top-1m.csv ; head -1000 top-1m.csv | cut -d, -f2 | cut -d/ -f1 > topsites.txt'							# get a list of top 1000 sites from alexa
alias tproxy='ssh -ND 8118 user@server&; export LD_PRELOAD="/usr/lib/libtsocks.so"'	# creates a proxy based on tsocks
alias udpstats='sudo netstat -su' 							# show statistics for udp ports
alias udp='sudo netstat -aup' 								# list all UDP ports
alias udp_trace='pkt_trace udp'								# to show all UDP packets
alias uploads='cd /some/folder'								# access some folder
alias vncup='x11vnc -nopw -ncache 10 -display :0 -localhost'
alias website_dl='wget --random-wait -r -p -e robots=off -U mozilla "$1"'		# download an entire website
alias website_images='wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" "$1"'	# download all images from a site
alias whois='whois -H'
alias wscan_='iwlist scan'								# terminal network scan for wireless signals
alias wwwmirror2='wget -k -r -l ${2} ${1}'						# wwwmirror2 usage: wwwmirror2 [level] [site_url]
alias wwwmirror='wget -ErkK -np ${1}'



##################################################
# Package holding, making, and installation	 #
##################################################

alias checkinstall-force='sudo checkinstall --dpkgflags "--force-overwrite"'
alias checkinstall-noinstall='sudo checkinstall -y --fstrans=no --install=no'
alias checkinstall='sudo checkinstall -y --fstrans=no'
alias debinstall-force='sudo dpkg -i --force-overwrite'
alias debinstall='sudo dpkg -i'
alias diffinstall='diff /tmp/install.pre /tmp/install.pos | grep \"^>\" | sed \"s/^> //g\"'	# run diffinstall fourth, after diffinstall to show what files were copied in your system
alias postinstall='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) > /tmp/install.pos'	# run postinstall third, after "make install"
alias preinstall='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) > /tmp/install.pre'	# run preinstall first, then "make install"



##################################################
# Permissions					 #
##################################################

alias 000='chmod 000'
alias 640='chmod 640'
alias 644='chmod 644'
alias 755='chmod 755'
alias 775='chmod 775'
alias mx='chmod a+x'
alias perm='stat --printf "%a %n \n "'								# requires a file name e.g. perm file
alias restoremod='chgrp users -R .;chmod u=rwX,g=rX,o=rX -R .;chown $(pwd |cut -d / -f 3) -R .'	# restore user,group and mod of an entire website



##################################################
# Personal help					 #
##################################################

alias a?='cat ~/.alias.help'
alias dn='OPTIONS=$(\ls -F | grep /$); select s in $OPTIONS; do cd $PWD/$s; break;done'
alias espanol='echo -e \"á Á é É í Í ó Ó ú Ú ñ Ñ ü Ü ¿ ¡ ¢ ‘ ’ “ ” „ ‚ …\"'
alias f?='cat ~/.function.help'
alias help='OPTIONS=$(\ls ~/.tips -F);select s in $OPTIONS; do less ~/.tips/$s; break;done'
alias testh='help test|sed -e :a -e "$!N;s/\(-n STRING\)\n/\1, /;s/\n\( \{23\}\| \{4\}\([a-z]\)\)/ \2/;ta;P;D"|sed "s/ \{1,\}/ /g;/^ $/d;/:$/s/^/\n/"|sed -n "/File operators:/,\$p"'				# test quick help alias



##################################################
# Secure-delete substitution			 #
##################################################

alias sfill-freespace='sudo sfill -I -l -l -v'
alias sfill-f='sudo sfill -f -l -l -v -z'
alias sfill='sudo sfill -l -l -v -z'
alias sfill-usedspace='sudo sfill -i -l -l -v'
alias smem-f='sudo sdmem -f -l -l -v'
alias smem-secure='sudo sdmem -v'
alias smem='sudo sdmem -l -l -v'
alias srm-m='sudo srm -f -m -z -v'
alias srm='sudo srm -f -s -z -v'
alias sswap-sda5='sudo sswap -f -l -l -v -z /dev/sda5'
alias sswap='sudo sswap -f -l -l -v -z'
alias swapoff='sudo swapoff /dev/sda5'
alias swapon='sudo swapon /dev/sda5'



##################################################
# Set up auto extension stuff			 #
##################################################

###### If -s flags present, define suffix alias: if command word on command line is in form `text.name',
# where text is any non-empty string, its replaced by text 'value text.name'. Note that names treated as literal
# string, not pattern.  A trailing space in value is not special in this case. For example, alias -s ps=gv
# will cause command `*.ps' to be expanded to `gv *.ps'. As alias expansion is carried out earlier than globbing,
# `*.ps' will then be expanded. Suffix aliases constitute different name space from other aliases (so in above
# example its still possible to create alias for command ps) and two sets are never listed together.
# alias -s avi=mplayer
# alias -s bz2=tar -xjvf
# alias -s com=$BROWSER
# alias -s cpp=vim
# alias -s doc=soffice
# alias -s eps=eog
# alias -s gif=eog
# alias -s gz=tar -xzvf
# alias -s html=$BROWSER
# alias -s img=mplayer
# alias -s install=$EDITOR
# alias -s iso=mplayer
# alias -s java=$EDITOR
# alias -s jpg=eog
# alias -s mkv=mplayer
# alias -s mp3=mplayer
# alias -s mpeg=mplayer
# alias -s mpg=mplayer
# alias -s mws=maple
# alias -s net=$BROWSER
# alias -s odt=soffice
# alias -s org=$BROWSER
# alias -s pdf=evince
# alias -s php=$BROWSER
# alias -s PKGBUILD=vim
# alias -s png=eog
# alias -s ppt=soffice
# alias -s ps=gv
# alias -s se=$BROWSER
# alias -s sh=vim
# alias -s sxw=soffice
# alias -s tex=$EDITOR
# alias -s txt=$EDITOR
# alias -s wmv=mplayer
# alias -s xls=soffice



##################################################
# Shred substitution				 #
##################################################

alias shred-sda-r='sudo shred -v -z -n 1 /dev/sda'
alias shred-sda='sudo shred -v -z -n 0 /dev/sda'
alias shred-sdb-r='sudo shred -v -z -n 1 /dev/sdb'
alias shred-sdb='sudo shred -v -z -n 0 /dev/sdb'
alias shred-sdc-r='sudo shred -v -z -n 1 /dev/sdc'
alias shred-sdc='sudo shred -v -z -n 0 /dev/sdc'
alias shred-sdd-r='sudo shred -v -z -n 1 /dev/sdd'
alias shred-sdd='sudo shred -v -z -n 0 /dev/sdd'
alias shred-sde-r='sudo shred -v -z -n 1 /dev/sde'
alias shred-sde='sudo shred -v -z -n 0 /dev/sde'
alias shred-sdf-r='sudo shred -v -z -n 1 /dev/sdf'
alias shred-sdf='sudo shred -v -z -n 0 /dev/sdf'
alias shred-sdg-r='sudo shred -v -z -n 1 /dev/sdg'
alias shred-sdg='sudo shred -v -z -n 0 /dev/sdg'



##################################################
# Xterm and Aterm				 #
##################################################

alias aterm='xterm -ls -fg gray -bg black'
alias termb='xterm -bg AntiqueWhite -fg NavyBlue &'
alias termg='xterm -bg AntiqueWhite -fg OliveDrab &'
alias termr='xterm -bg AntiqueWhite -fg DarkRed &'
alias term='xterm -bg AntiqueWhite -fg Black &'
alias xsu='xterm -fn 7x14 -bg DarkOrange4 -fg white -e su &'
alias xtop='xterm -fn 6x13 -bg LightSlateGray -fg black -e top &'



##################################################
##################################################
##################################################








######################################################################################################################################################
#----- BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------
######################################################################################################################################################








fi	# end interactive check﻿








######################################################################################################################################################
################################### MY BASHRC FILE ################################### MY BASHRC FILE ################################### MY BASHRC FILE
######################################################################################################################################################
