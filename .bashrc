# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -z "$SSH_AUTH_SOCK" ] ; then
   eval "$(ssh-agent -s)"
  ssh-add
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias tmux="TERM=xterm-256color tmux"
alias cdc="cd ~/Code"
alias gs="clear; git status"
alias cs="cimpler74 status"
alias cb="cimpler74 build -b"
alias grc="git rebase --continue"
alias log="tail -f ~/Code/Logs/me.log"
alias glog="git log --oneline"
