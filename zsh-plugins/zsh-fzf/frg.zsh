#!/bin/bash zsh

frg() {
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --bind 'enter:execute(nvim {1} +{2})' \
    --bind 'ctrl-l:execute(nvim {1} +{2})' \
    --bind 'ctrl-h:abort' \
    --pointer ▊ \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \

  return 0
}

frg
