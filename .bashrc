# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias tmux="TERM=screen-256color tmux"
alias cdg="cd ~/Misc/Github"
alias cdc="cd ~/Code"


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
