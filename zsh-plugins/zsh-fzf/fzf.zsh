#!/bin/bash zsh
# 282a36 https://github.com/junegunn/fzf/blob/master/ADVANCED.md

export FZF_DEFAULT_OPTS="\
  --preview '( \
    [[ -f {} ]] && \
      (bat --style=numbers --color=always {} || cat {})) || \
      ([[ -d {} ]] && \
        (exa --icons -T --color=always --group-directories-first {} || tree -C {}) \
      ) || \
      echo {} 2> /dev/null | head -200' \
  --preview-window 'up,60%,border,+{2}+3/3,~3' \
  --ansi \
  --header 'CTRL-H: Directories / CTRL-L: Files' \
  --delimiter : \
  --prompt '  ' \
  --bind 'ctrl-h:change-prompt(Directories> )+reload(fd --type directory --hidden --follow --exclude \".git*\")' \
  --bind 'ctrl-l:change-prompt(Files> )+reload(fd --type file --hidden --follow --exclude \".git*\")'\
  --bind 'alt-i:execute(cd {} && nvim || nvim {})' \
  --color=fg:#c0caf5,bg:#21222c,hl:#bd93f9,border:#44475a \
  --color=fg+:#c0caf5,bg+:#21222c,hl+:#bd93f9 \
  --color=info:#f1fa8c,prompt:#50fa7b,pointer:#ff79c6 \
  --color=marker:#ff79c6,spinner:#f1fa8c,header:#6272a4
  "

ff () {
  if [[ $1 == "-c" || $1 == "--current" ]]; then
    cd $(fd --type directory -H --strip-cwd-prefix --follow --exclude '.git*' | fzf)
    clear
    return 1
  fi
  cd ~ && cd $(fd --type directory -H --strip-cwd-prefix --follow --exclude '.git*' | fzf)
  clear
  return 1
}

# UB_PID_FILE="/tmp/.$(uuidgen)"
# ueberzugpp layer --no-stdin --silent --use-escape-codes --pid-file $UB_PID_FILE
# UB_PID=$(cat $UB_PID_FILE)
#
# export SOCKET=/tmp/ueberzugpp-$UB_PID.socket
# export X=$(($(tput cols) / 2 + 1))
#
# # run fzf with preview
# fzf --preview='ueberzugpp cmd -s $SOCKET -i fzfpreview -a add -x $X -y 1 --max-width $FZF_PREVIEW_COLUMNS --max-height $FZF_PREVIEW_LINES -f {}' --reverse "$@"
#
# ueberzugpp cmd -s $SOCKET -a exit
