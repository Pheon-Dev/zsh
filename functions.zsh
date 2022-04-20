f() {
   fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

typeset -A docs 
docs=(
  tools           "Tools"
  react           "React"
  next            "NextJS"
  native          "ReactNative"
  flutter         "Flutter"
  frameworks      "Frameworks"
  rust            "Rust"
  python          "Python"
  node            "NodeJS"
  vue             "Vue"
  web             "Web-3.0"
)

dca () {
  emulate -L zsh
  if [[ -z "$docs[$1]" ]]; then
    echo "'$1' not found. Try :\n  node  next  vue  react  python  native  rust  flutter  web  tools  frameworks"
    return 1
  else
    doc="${docs[$1]}"
    cd ~/Documents/"$doc"/Apps && ll
  fi
}

dcg () {
  emulate -L zsh

  if [[ -z "$docs[$1]" ]]; then
    echo "'$1' not found. Try :\n  node  next  vue  react  python  native  rust  flutter  web  tools  frameworks"
    return 1
  else
    doc="${docs[$1]}"
    cd ~/Documents/"$doc"/Git && ll
  fi
}

dcv () {
  emulate -L zsh
  if [[ -z "$docs[$1]" ]]; then
    echo "'$1' not found. Try :\n  node  next  vue  react  python  native  rust  flutter  web  tools  frameworks"
    return 1
  else
    doc="${docs[$1]}"
    cd ~/Documents/"$doc"/Videos && la
  fi
}
