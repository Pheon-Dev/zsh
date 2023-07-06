#!/bin/zsh zsh

frg() {
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --bind 'enter:become(nvim {1} +{2})'
}

ff () {
  echo " "
  if [[ $1 == "" ]]; then
    echo "$(tput setaf 3)   [ -c, --current] from current working directory"
    echo "$(tput setaf 3)   [ -g, --grep] search for a text"
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
  if [[ $1 == "-g" || $1 == "--grep" ]]; then
    frg
  fi
}
