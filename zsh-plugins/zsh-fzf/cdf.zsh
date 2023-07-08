#!/bin/bash zsh

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
  --pointer ▊ \
  --bind 'ctrl-d:change-prompt(Directory  : )+reload(fd --type directory --hidden --follow --exclude \".git*\")' \
  --bind 'ctrl-f:change-prompt(File  : )+reload(fd --type file --hidden --follow --exclude \".git*\")'\
  --bind 'ctrl-l:accept' \
  --bind 'ctrl-h:abort' \
  --color=fg:#c0caf5,bg:#21222c,hl:#bd93f9,border:#44475a \
  --color=fg+:#c0caf5,bg+:#21222c,hl+:#bd93f9 \
  --color=info:#f1fa8c,prompt:#50fa7b,pointer:#ff79c6 \
  --color=marker:#ff79c6,spinner:#f1fa8c,header:#6272a4
  "

fdf() {
  fd --type directory -H --strip-cwd-prefix --follow --exclude '.git*' -E '.yarn' -E '.rustup' -E 'go/pkg/mod/*' -E '.cargo/registry/*' -E '.cache' -E '/home/linuxbrew' -E 'node_modules' -E 'targets' -E 'pouch' | fzf 
}

cd $(fdf)
