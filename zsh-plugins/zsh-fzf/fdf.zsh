#!/bin/bash zsh

fdf() {
  fd --type directory -H --strip-cwd-prefix --follow --exclude '.git*' -E '.yarn' -E '.rustup' -E 'go/pkg/mod/*' -E '.cargo/registry/*' -E '.cache' -E '/home/linuxbrew' -E 'node_modules' -E 'targets' -E 'pouch' | fzf 
}

fdf
