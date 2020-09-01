# .bashrc
export PATH=$PATH:/usr/local/mysql/bin/
export PATH="$PATH:/Users/darian/Misc/Github/flutter/bin"
# Source global definitions
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
alias gprune="git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d"

alias gg="git grep -I --line-number"

# [f]eature [sw]itch [b]ranch
# Switches between recent branches.
fswb() {
   branches=($(git for-each-ref --format="%(refname:short)" --sort=-committerdate --count 9 refs/heads/))
   num_branches=${#branches[@]}
   for ((i=$num_branches; i > 0; i--)); do
      printf "%1d) %s\n" $i "${branches[$i-1]}"
   done

   read -p "Checkout which branch (1–$num_branches)? " -n1 choice
   echo

   if [[ $choice -lt 1 || $choice -gt $num_branches ]]; then
      echo "Pick a valid index! :P"
   else
      git checkout ${branches[$choice-1]}
   fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Feed the output of fd into fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 # Shell Variable Configuration
 RED="\[\033[31m\]"
 GRE="\[\033[32m\]"
 YEL="\[\033[33m\]"
 BLU="\[\033[34m\]"
 PUR="\[\033[35m\]"
 WHI="\[\033[37m\]"
 NUL="\[\033[0m\]"

 export PS1="${BLU}\u${WHI}@${PUR}\H ${GRE}\t ${PUR}\W${NUL} > "
 export PS1="${BLU}\u${WHI}@${PUR}\H ${YEL}\$(parse_git_branch \" (%s)\") ${GRE}\t ${PUR}\W${NUL} > "
 export SHELL=/bin/bash
