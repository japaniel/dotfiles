#!/bin/sh
# Shell-agnostic aliases for all environments

# Network aliases
alias fix-mtu='sudo ip link set dev gpd0 mtu 1200'

# Add more aliases below as needed


alias ll="ls -l"
alias ..="cd .."

# Frequent Files
#alias hist="history | awk \'{a[$2]++}END{for(i in a){print a[i] " " i}}\' | sort -rn | head"
alias reload="source ~/bin/dotfiles/bash/aliases"

#VIM
#alias v='vim -N'

# Git
alias gst='git status'
alias gb='git branch'
alias gba='git branch -a'
alias gca='git commit -v -a'
alias gc='git commit -v'
alias gd='git diff | vim'
alias gp='git push'
alias gpl='git pull'
alias gitk='gitk --all'

# ssh short cuts
alias server='ssh server'
alias daniel='ssh daniel'

#Load compleations for Ruby, Git, and more in zsh
#autoload compinit
#compinit

#alias virtman='virt-manager --debug -c qemu+ssh://root@lab2.lcm.mirantis.lab/system?socket=/var/run/libvirt/libvirt-sock'
virtman() {
	#sudo virt-manager --debug -c qemu+ssh://$1/system?socket=/var/run/libvirt/libvirt-sock &
	sudo virt-manager --debug &
}
