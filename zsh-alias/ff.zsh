#!/bin/zsh zsh

ff () {
  echo " "
  if [[ $1 == "" ]]; then
    echo "$(tput setaf 3)   [ -c, --current] from current working directory"
    echo "$(tput setaf 3)   [ -h, --home   ] from $HOME"
    echo " "
    return 0
  fi
  if [[ $1 == "-c" || $1 == "--current" ]]; then
    cd $(fd --type directory -H --strip-cwd-prefix --follow --exclude '.git*' | fzf)
    clear
    return 0
  fi
  if [[ $1 == "-h" || $1 == "--home" ]]; then
    cd ~ && cd $(fd --type directory -H --strip-cwd-prefix --follow --exclude '.git*' | fzf)
    clear
    return 0
  fi
}
