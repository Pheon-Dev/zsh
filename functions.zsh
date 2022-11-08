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
  native          "Native"
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
    cd ~/Documents/"$doc"/Apps || cd ~/Documents/"$doc"/App && l
  fi
}

dcg () {
  emulate -L zsh

  if [[ -z "$docs[$1]" ]]; then
    echo "'$1' not found. Try :\n  node  next  vue  react  python  native  rust  flutter  web  tools  frameworks"
    return 1
  else
    doc="${docs[$1]}"
    cd ~/Documents/"$doc"/Git && l
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

ynx () {
  yarn create next-app "$2" --typescript
}

yae () {
  yarn workspace "$1" add --ignore-engines "$2"
}

yag () {
  yarn workspace "$1" global add "$2"
}

yad () {
  yarn workspace "$1" add "$2" --dev
}

yat () {
  yarn workspace "$1" add "$2"
}

yar () {
  yarn workspace "$1" remove "$2"
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

we () {
  nmcli dev wifi connect wifi"$1"
}

dep() {
 pnpm run build && firebase deploy --only hosting:"$1" && lazygit
}

mntd () {
  sudo lsblk -l && sudo mkdir /mnt/"$1" #blkid
}

mntm () {
  sudo mount /dev/sd"$1""$2" /mnt/"$3"
}

mntu () {
  sudo umount /mnt/"$1"
}

# Copy Buffer
cpb() {
  if which clipcopy &>/dev/null; then
    printf "%s" "$BUFFER" | clipcopy
  else
    zle -M "clipcopy not found. Please make sure you have Oh My Zsh installed correctly."
  fi
}

zle -N cpb

bindkey -M emacs "^O" cpb
bindkey -M viins "^O" cpb
bindkey -M vicmd "^O" cpb

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

# set ft=zsh

progress-bar() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

zap() {
  source "./progress.zsh"

function run_scripts {
    CURRENT_PERCENTAGE=$1

    DUMMY_CUMPUTING_DELAY=$(( ( RANDOM % 20 ) / 10 ))  # Replace by zero

      git clone https://github.com/zap-zsh/zap.git > /dev/null 2>&1
        sleep $DUMMY_CUMPUTING_DELAY

    sleep $PROGRESS_DELAY
}

echo
progress 0; progress 100
echo
echo ""
echo " Zapped"
}

