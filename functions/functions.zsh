#!/bin/bash sh

ed() {
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

lk () {
    regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
    url=$(grep -Po "$regex" | dmenu -p "Go:" -w "$WINDOWID") || exit
    $BROWSER "$url"
}

got () {
    echo " "
    if [[ $1 == "" ]]; then
        echo "$(tput setaf 1) ** Missing App Name Option ** \n"
        echo -n "$(tput setaf 2) got"
        echo -n "$(tput setaf 3) <app-name> \n"
        echo " "
        return 1
    fi
    pwd=$(pwd)
    mkdir -p /home/pheon/Documents/go/src/github.com/Pheon-Dev/$1
    cd /home/pheon/Documents/go/src/github.com/Pheon-Dev/$1
    echo " "
    echo -e "$(tput setaf 6)Initializing App ..."
    echo "$(tput setaf 2)"
    go mod init github.com/Pheon-Dev/$1
    echo " "
    echo -e "$(tput setaf 6)Initializing Cobra ..."
    echo "$(tput setaf 2)"
    cobra-cli init
    go mod tidy
    echo " "
    echo -n "$(tput setaf 6)Running your newly created"
    echo -n "$(tput setaf 4) $1 app "
    echo -e "$(tput setaf 6): "
    echo "$(tput setaf 5)"
    go run .
    echo " "
    echo -n "$(tput setaf 6)Edit the newly created"
    echo -n "$(tput setaf 4) $1 app "
    echo -n "$(tput setaf 6)using your favourite"
    echo -n "$(tput setaf 3) $EDITOR "
    echo -n "$(tput setaf 6)editor (y/n)? "
    read edit
    if [[ $edit == "y" ]]; then
        echo " "
        $EDITOR
        return 1
    fi
    echo " "
    echo -n "$(tput setaf 6)Return to previous"
    echo -n "$(tput setaf 4) $pwd "
    echo -n "$(tput setaf 6)directory (y/n)? "
    read cwd
    if [[ $cwd == "y" ]]; then
        echo " "
        wd=$(pwd)
        echo -n "$(tput setaf 6)You can always edit your"
        echo -n "$(tput setaf 4) $1 app "
        echo -e "$(tput setaf 6)from:"
        echo -e "$(tput setaf 3) → $wd \n"
        echo -e "$(tput setaf 6)Good bye and thank you!"
        echo " "
        cd $pwd
        return 1
    fi
    echo " "
    echo -e "$(tput setaf 6)Files Created :\n"
    exa -la
    echo " "
}

# DOCKER
dtag () {
    docker tag local-image:$1 new-repo:$1
}

dpsh () {
    docker push new-repo:$1
}

# PLANETSCALE
pscon () {
    pscale connect $1 $2 --port $3  # 1: db, 2: branch, 3: port
}

pscll () {
    pscale shell $1 $2  # 1: db, 2: branch
}

# YARN
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

# SOURCING FILES
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

# show profile
dep() {
    pnpm run build && firebase deploy --only hosting:"$1" && lazygit
}

alias mntl="sudo lsblk -l" # fdisk
mntd () {
    sudo lsblk -l && sudo mkdir /mnt/"$1" #blkid
}

mntm () {
    sudo mount /dev/sd"$1""$2" /mnt/"$3"
}

mntu () {
    sudo umount /mnt/"$1"
}

mt () {
  clear
  echo "$(tput setaf 6)"
  lsblk -a
  echo ""
  echo "$(tput setaf 2)  [ Enter ] to continue"
  echo "$(tput setaf 1)  [ C-c | q | Q ] to Quit \n"
  echo -n "$(tput setaf 5) ● Enter one option from the list above to continue : "
  read -r continue
  if [[ $continue == "q" || $continue == "Q" || $continue == "n" || $continue == "N" ]]; then
    echo ""
      echo "$(tput setaf 2) Good Bye! \n"
    return 1
  fi
  clear
  echo ""
  echo "$(tput setaf 2) ∆ [ Enter ] to Mount"
  echo "$(tput setaf 1) ∇ [ u | U ] to Unmount \n"
  echo -n "$(tput setaf 5) ● Enter one option from the list above to continue : "
  read -r continue
  if [[ $continue == "u" || $continue == "U" ]]; then
    if find /mnt -mindepth 1 -maxdepth 1 | read; then
        echo "$(tput setaf 1)"
        mount_loc=$(sudo ls /mnt | gum filter)
        sudo umount /mnt/$mount_loc > /dev/null 2>&1
        sudo rm -rf /mnt/$mount_loc > /dev/null 2>&1
        echo " "
        echo -n "$(tput setaf 6) Mount Point : "
        echo -e "$(tput setaf 7) $mount_loc \n"
        echo -e "$(tput setaf 2) Unounted Successfully! \n"
    else
      echo "$(tput setaf 1) No Mountpoint Found \n"
    fi
      echo "$(tput setaf 2) Good Bye! \n"
    return 1
  fi
  echo ""
  echo -n "$(tput setaf 2) ● Enter mount point name : "
  read -r mount_point
  sudo mkdir /mnt/$mount_point
  echo "$(tput setaf 1)"
  drive=$(sudo lsblk -l | awk 'BEGIN { FS = "\n" } NR==1 {next;} { print $1 }' | gum filter | awk 'BEGIN { FS = " " } { print $1 }')
  echo ""
  sudo mount /dev/$drive /mnt/$mount_point
  echo -n "$(tput setaf 6) Drive : "
  echo -e "$(tput setaf 7) $drive"
  echo -n "$(tput setaf 6) Mount Point : "
  echo -e "$(tput setaf 7) $mount_point \n"
  echo -e "$(tput setaf 2) Mounted Successfully! \n"
  echo "$(tput setaf 2) Good Bye! \n"
  return 1
}

# Copy Buffer
cpb() {
    if which clipcopy &>/dev/null; then
        printf "%s" "$BUFFER" | clipcopy
    else
        zle -M "clipcopy not found. Please make sure you have Zsh installed correctly."
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
