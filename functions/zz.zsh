#!/bin/bash

# ZELLIJ
alias zj="zellij"
alias za="zellij attach"
alias zs="zellij list-sessions"
alias zn="zellij --session"
# alias zz="zl general"
alias zf="zellij edit --floating --"
alias zr='zellij run --floating --'

zz () {
  clear
  echo ""
  echo "$(tput setaf 3)  [ Enter ] start a new session"
  echo "$(tput setaf 3)  [ a ]     attach to a session"
  echo "$(tput setaf 3)  [ l ]     list available layouts"
  echo "$(tput setaf 3)  [ h ]     help"
  echo "$(tput setaf 1)  [ C-c | q | Q ] to Quit \n"
  echo -n "$(tput setaf 2) Enter one of the above command options to continue : "
  read -r option
  if [[ $option == "q" || $option == "Q" ]]; then
    echo ""
    echo -n "$(tput setaf 3) Good Bye! \n"
    echo ""
    return 1
  fi
  if [[ $1 == "-h" || $1 == "--help" || $option == "h" ]]; then
    clear
    echo "$(tput setaf 1) ** Missing Layout Option ** \n"
    echo -n "$(tput setaf 2) zz"
    echo -n "$(tput setaf 3) <option> \n"
    echo " "
    echo -e "$(tput setaf 5) List of layout options : \n"
    echo -n "$(tput setaf 3)    -l, --layout \n"
    echo -n "$(tput setaf 3)    -a, --attach \n"
    echo -n "$(tput setaf 3)    -h, --help \n"
    return 1
  fi
  if [[ $1 == "-a" || $1 == "--attach" || $option == "a" ]]; then
    clear
    sessions=$(zellij list-sessions)
    echo -e "$(tput setaf 5) List of running sessions ... \n"
    echo -e "$(tput setaf 2) - $sessions"
    attach_session=$(echo "$sessions" | gum filter)
    if [[ -z $attach_session ]]; then echo "no sessions available"; fi
    clear
    zellij attach $attach_session
    echo " "
    return 1
  fi
  if [[ $1 == "-l" || $1 == "--layout" || $option == "l" ]]; then
    clear
    layouts=$(ls "$HOME/.config/zellij/layouts" | awk 'BEGIN { FS = "\n" } { print " " echo "    " $1 }' | cut -d "." -f 1)
    echo -e "$(tput setaf 5) List of available layouts \n"
    echo -n "$(tput setaf 6)$layouts"
    echo " "
    echo " "
    return 1
  fi
  clear
  layout=$(ls "$HOME/.config/zellij/layouts" | awk 'BEGIN { FS = "\n" } { print $1 }' | cut -d "." -f 1)
  new_session=$(echo $layout | awk 'BEGIN { FS = " " } { print $2 }' | gum filter)
  zellij -l /home/pheon/.config/zellij/layouts/$new_session.kdl --session $new_session
  clear
}

