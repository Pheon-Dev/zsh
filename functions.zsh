vf() {
   fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

### ARCHIVE EXTRACTIONS
# usage: ex <file>

ex () {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)    tar xjf $1    ;;
      *.tar.gz)     tar xzf $1    ;;
      *.bz2)        bunzip2 $1    ;;
      *.rar)        unrar x $1    ;;
      *.gz)         gunzip $1     ;;
      *.tar)        tar xf $1     ;;
      *.tbz2)       tar xjf $1    ;;
      *.tgz)        tar xzf $1    ;;
      *.zip)        unzip $1      ;;
      *.Z)          uncompress $1 ;;
      *.7z)         7z x $1       ;;
      *.deb)        ar x $1       ;;
      *.tar.xz)     tar xf $1     ;;
      *.tar.zst)    unzstd $1     ;;
      *)            echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
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

# Copy Buffer
cpb() {
  if which clipcopy &>/dev/null; then
    printf "%s" "$BUFFER" | clipcopy
  else
    zle -M "clipcopy not found. Please make sure you have Oh My Zsh installed correctly."
  fi
}

zle -N copybuffer

bindkey -M emacs "^O" copybuffer
bindkey -M viins "^O" copybuffer
bindkey -M vicmd "^O" copybuffer

# Copy directory
function cpd() {
  emulate -L zsh
  print -n $PWD | clipcopy
}

# Copy file
function cpf() {
  emulate -L zsh
  clipcopy $1
}
