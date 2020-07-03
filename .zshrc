# Paths
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin/
export ZSH="/Users/dariann/.oh-my-zsh"

# oh-my-zsh config
ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh plugins
plugins=(branch git-prune)

source $ZSH/oh-my-zsh.sh

# User config

# Stop pipin to less every command
unset LESS;

# Disable showing user name on local
prompt_context() {}

# Source global definitions
if [ -z "$SSH_AUTH_SOCK" ] ; then
   eval "$(ssh-agent -s)"
   ssh-add
fi

# Aliases
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
alias vim="nvim"

alias gg="git grep -I --line-number"

# [f]eature [sw]itch [b]ranch
# Switches between recent branches.
fswb() {
   branches=($(git for-each-ref --format="%(refname:short)" --sort=-committerdate --count 9 refs/heads/))
   num_branches=${#branches[@]}
   for ((i=$num_branches; i > 0; i--)); do
      printf "%1d) %s\n" $i "${branches[$i-1]}"
   done

   read -k 1 choice
   echo

   if [[ $choice -lt 1 || $choice -gt $num_branches ]]; then
      echo "Pick a valid index! :P"
   else
      git checkout ${branches[$choice-1]}
   fi
}

## Feed the output of fd into fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
