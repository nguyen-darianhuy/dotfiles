# .bashrc
export PATH="$PATH:/Users/dariann/Misc/Github/flutter/bin"
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
alias cdg="cd ~/Misc/Github"
alias cdc="cd ~/Code"
alias gs="clear; git status"
alias cs="cimpler status"
alias cb="cimpler build -b"
alias g="git"
alias grc="git rebase --continue"
alias log="tail -f ~/Code/Logs/me.log"
alias glog="git log --oneline"

alias gg="git grep --line-number"

# [f]eature [sw]itch [b]ranch
# Provides nice indexing to pick a branch
fswb () {
  declare -a brancharray
  brancharray=($(git branch --list --sort=committerdate | sed 's|[ *]||g' | tac | head -n 20))
  for ((i=${#brancharray[@]}; i > 0; i--))
   do
      printf "%s\t%s\n" "$i)" "${brancharray[$i-1]}";
   done

   echo "Checkout which branch? (1 - ${#brancharray[@]})"

   read userinput
   echo #move to a new line
   if [[ $userinput -lt 1 || $userinput -gt ${#brancharray[@]} ]]
     then
        echo "Pick a valid index! :P"
     else
       userinput=${userinput}-1
       feature switch ${brancharray[$userinput]}
   fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Feed the output of fd into fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
