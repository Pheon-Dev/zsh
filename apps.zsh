dca () {
  emulate -L zsh
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

  if [[ -z "$docs[$1]" ]]; then
    echo "'$1' not found. Try :\n node next vue react python native rust flutter web tools frameworks"
    return 1
  else
    doc="${docs[$1]}"
    cd ~/Documents/"$doc"/Apps && ll
  fi
}
