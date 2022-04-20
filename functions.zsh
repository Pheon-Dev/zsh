f() {
   fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}
