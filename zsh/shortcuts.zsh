# zz cmd [arguments]
# If the first argument is an existing file
# Then execute "cmd arguments"
# Else move "z arguments" and execute "cmd ."
zz() {
  cmd=$1
  shift
  if [ -e "$1" ]
  then
    # echo "no z, exec $cmd $@"
    eval "$cmd $@"
  else
    # echo "z, exec z $@ then $cmd"
    silent z $@
    eval "$cmd ."
  fi
}

alias g=git
alias v=vim
alias vi=vim
alias a='zz "atom -a ."'
alias o='zz open'