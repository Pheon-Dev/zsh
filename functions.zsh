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

yta () {
  youtube-dl --extract-audio --audio-format mp3 "$1" --playlist-start "$2"
}

psou () {
  source ~/.p10k.zsh
}

tsou () {
  tmux source ~/.tmux.conf
}

zsou () {
  source ~/.zshrc
}

bsou () {
  source ~/.bashrc
}

mntd () {
  sudo fdisk -l && sudo mkdir /run/media/"$1"
}

wfe () {
  nmcli dev wifi connect wifi"$1"
}

mntm () {
  sudo mount /dev/sd"$1""$2" /run/media/"$3"
}

mntu () {
  sudo umount /run/media/"$1"
}
