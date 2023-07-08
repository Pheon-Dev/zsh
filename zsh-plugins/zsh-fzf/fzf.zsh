#!/bin/bash zsh
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md
# --bind 'alt-w:unbind(change,alt-w)+change-prompt(2. fzf> )+enable-search+clear-query' \

export FZF_DEFAULT_OPTS="\
  --preview '( \
    [[ -f {} ]] && \
      (bat --style=numbers --color=always {} || cat {})) || \
      ([[ -d {} ]] && \
        (exa --icons -T --color=always --group-directories-first {} || tree -C {}) \
      ) || \
      echo {} 2> /dev/null | head -200' \
  --preview-window 'up,60%,border,+{2}+3/3,~3' \
  --ansi --header ' file [c-f] |  directory [c-d] |  nvim [c-l] |  quit [c-h] :' \
  --delimiter : \
  --prompt 'Search   : ' \
  --bind 'ctrl-d:change-prompt(Directory  : )+reload(fd --type directory --hidden --follow --exclude \".git*\")' \
  --bind 'ctrl-f:change-prompt(File  : )+reload(fd --type file --hidden --follow --exclude \".git*\")'\
  --bind 'ctrl-l:execute(cd {} 2>/dev/null && nvim --listen ~/.cache/nvim/server.pipe || nvim --server ~/.cache/nvim/server.pipe --remote ~/{})' \
  --bind 'ctrl-h:abort' \
  --bind 'ctrl-n:preview-down' \
  --bind 'ctrl-p:preview-up' \
  --color=fg:#c0caf5,bg:#21222c,hl:#bd93f9,border:#44475a \
  --color=fg+:#c0caf5,bg+:#21222c,hl+:#bd93f9 \
  --color=info:#f1fa8c,prompt:#50fa7b,pointer:#ff79c6 \
  --color=marker:#ff79c6,spinner:#f1fa8c,header:#6272a4
"

export FZF_CTRL_T_OPTS="--height 60% \
--border sharp \
--layout reverse \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"

ff() {
  if [[ $1 == "-h" || $1 == "--help" || $1 == "" ]]; then
    echo " "
    echo "$(tput setaf 3)   [ -g, --grep   ] search for a text"
    echo "$(tput setaf 3)   [ -h, --help   ] help"
    echo "$(tput setaf 3)   [ -e, --edit   ] edit"
    echo "$(tput setaf 3)   [ -c, --cd     ] cd"
    echo " "
    return 0
  fi

  cd
  if [[ $1 == "-e" || $1 == "--edit" ]]; then
    source $HOME/.config/zsh/zsh-plugins/zsh-fzf/fdf.zsh
  fi
  if [[ $1 == "-g" || $1 == "--grep" ]]; then
    source $HOME/.config/zsh/zsh-plugins/zsh-fzf/frg.zsh
  fi
  if [[ $1 == "-c" || $1 == "-cd" ]]; then
    source $HOME/.config/zsh/zsh-plugins/zsh-fzf/cdf.zsh
  fi
  rm -rf ~/.cache/nvim/server.pipe
  clear
  return 0
}
