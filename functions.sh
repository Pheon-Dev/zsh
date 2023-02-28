ed() {
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

lk () {
    regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
    url=$(grep -Po "$regex" | dmenu -p "Go:" -w "$WINDOWID") || exit
    $BROWSER "$url"
}

# ZELLIJ
alias zj="zellij"
alias za="zellij attach"
alias zs="zellij list-sessions"
alias zn="zellij --session"
# alias zz="zl general"
alias zf="zellij edit --floating --"
alias zr='zellij run --floating --'

zz () {
  clear
  echo ""
  echo "$(tput setaf 3)  [ Enter ] start a new session"
  echo "$(tput setaf 3)  [ a ]     attach to a session"
  echo "$(tput setaf 3)  [ l ]     list available layouts"
  echo "$(tput setaf 3)  [ h ]     help"
  echo "$(tput setaf 1)  [ C-c | q | Q ] to Quit \n"
  echo -n "$(tput setaf 2) Enter one of the above command options to continue : "
  read -r option
  if [[ $option == "q" || $option == "Q" ]]; then
    echo ""
    echo -n "$(tput setaf 3) Good Bye! \n"
    echo ""
    return 1
  fi
  if [[ $1 == "-h" || $1 == "--help" || $option == "h" ]]; then
    clear
    echo "$(tput setaf 1) ** Missing Layout Option ** \n"
    echo -n "$(tput setaf 2) zz"
    echo -n "$(tput setaf 3) <option> \n"
    echo " "
    echo -e "$(tput setaf 5) List of layout options : \n"
    echo -n "$(tput setaf 3)    -l, --layout \n"
    echo -n "$(tput setaf 3)    -a, --attach \n"
    echo -n "$(tput setaf 3)    -h, --help \n"
    return 1
  fi
  if [[ $1 == "-a" || $1 == "--attach" || $option == "a" ]]; then
    clear
    sessions=$(zellij list-sessions)
    echo -e "$(tput setaf 5) List of running sessions ... \n"
    echo -e "$(tput setaf 2) - $sessions"
    attach_session=$(echo "$sessions" | gum filter)
    if [[ -z $attach_session ]]; then echo "no sessions available"; fi
    clear
    zellij attach $attach_session
    echo " "
    return 1
  fi
  if [[ $1 == "-l" || $1 == "--layout" || $option == "l" ]]; then
    clear
    layouts=$(ls "$HOME/.config/zellij/layouts" | awk 'BEGIN { FS = "\n" } { print " " echo "    " $1 }' | cut -d "." -f 1)
    echo -e "$(tput setaf 5) List of available layouts \n"
    echo -n "$(tput setaf 6)$layouts"
    echo " "
    echo " "
    return 1
  fi
  clear
  layout=$(ls "$HOME/.config/zellij/layouts" | awk 'BEGIN { FS = "\n" } { print $1 }' | cut -d "." -f 1)
  new_session=$(echo $layout | awk 'BEGIN { FS = " " } { print $2 }' | gum filter)
  zellij -l /home/pheon/.config/zellij/layouts/$new_session.kdl --session $new_session
}

ex () {
    if [ -f "$1" ]; then
        case $1 in
            *.tar.bz2)    tar xjf "$1"    ;;
            *.tar.gz)     tar xzf "$1"    ;;
            *.bz2)        bunzip2 "$1"    ;;
            *.rar)        unrar x "$1"    ;;
            *.gz)         gunzip "$1"     ;;
            *.tar)        tar xf "$1"     ;;
            *.tbz2)       tar xjf "$1"    ;;
            *.tgz)        tar xzf "$1"    ;;
            *.zip)        unzip "$1"      ;;
            *.Z)          uncompress "$1" ;;
            *.7z)         7z x "$1"       ;;
            *.deb)        ar x "$1"       ;;
            *.tar.xz)     tar xf "$1"     ;;
            *.tar.zst)    unzstd "$1"     ;;
            *)            echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# BLUETOOTH
alias blf='systemctl stop bluetooth'
alias bln='systemctl start bluetooth'
alias bls="bluetoothctl scan on"
alias blc="bluetoothctl connect CC:98:8B:A7:BB:38"
alias blr="bluetoothctl connect"
alias bli="bluetoothctl info"
alias bld="bluetoothctl disconnect CC:98:8B:A7:BB:38"
alias blp="bluetoothctl pair CC:98:8B:A7:BB:38"
# alias bl="systemctl start bluetooth && bluetoothctl connect CC:98:8B:A7:BB:38"
alias bl="bluetoothctl connect CC:98:8B:A7:BB:38"

blhgdfh () {
  help () {
      echo "$(tput setaf 1) ** Missing Connection Option ** \n"
      echo -n "$(tput setaf 2) bl"
      echo -n "$(tput setaf 3) <option> \n"
      echo " "
      echo -e "$(tput setaf 5) List of flag options :"
      echo -n "$(tput setaf 3)     -d, --disconnect "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)  Disconnect Bluetooth connection"
      echo -n "$(tput setaf 3)     -s, --status "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)      Show Bluetooth status"
      echo -n "$(tput setaf 3)     -n, --on "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)    Turn Bluetooth on"
      echo -n "$(tput setaf 3)     -f, --off "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)   Turn Bluetooth off"
      echo -n "$(tput setaf 3)     -i, --info "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)        Show more WiFi info"
      echo -n "$(tput setaf 3)     -h, --help "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)        Show this help info \n"
      return 1
  }
  if [[ $1 == "-t" || $1 == "--toggle" ]]; then
    wifi toggle
    return 1
  fi
  if [[ $1 == "-d"  || $1 == "--disconnect" ]]; then
    nmcli dev disconnect $2
    return 1
  fi
  if [[ $1 == "-s" || $1 == "--status"  ]]; then
    nmcli dev status
    return 1
  fi
  if [[ $1 == "-n" || $1 == "--radio-on"  ]]; then
    nmcli dev radio on
    return 1
  fi
  if [[ $1 == "-" || $1 == "--radio-off"  ]]; then
    nmcli dev radio off
    return 1
  fi
  if [[ $1 == "-i" || $1 == "--info"  ]]; then
    nmcli --show-secrets connection show
    return 1
  fi
  if [[ $1 == "-e" || $1 == "--ethernet"  ]]; then
    if [[ $2 == "-s" || $2 == "--show"  ]]; then
        nmcli connection show "$3"
    fi

    if [[ $2 == "-c" || $2 == "--connect"  ]]; then
        nmcli connection up "$3"
    fi
    return 1
  fi
  if [[ $1 == "-h" || $1 == "--help"  ]]; then
    help
    return 1
  fi
  if [[ $1 == "-g" || $1 == "--gui"  ]]; then
    nm-connection-editor
    return 1
  fi
  if [[ $1 == "-u" || $1 == "--nmtui"  ]]; then
    nmtui
    return 1
  fi
  clear
  search="h";
  echo " "
  echo "$(tput setaf 2)Searching for available connections ..."
  nmcli dev wifi list > /dev/null 2>&1
  until [ "$search" = "" ]; do
    echo "$(tput setaf 2)\e[1A\e[K List of available connections ..."
    printf "\n"
    bluetoothctl scan on
    printf "\n"
    echo -n "$(tput setaf 6)Press [Enter] if preferred connection is listed above or [any character] + [Enter] to reload: "
    search=1
    read -r search
    clear
  done

  nmcli dev wifi list | awk 'BEGIN { FS = "\n" } NR==1 {next;} { print $1}' | awk 'BEGIN { FS = " " } { print ($1 =="*")? ($4 =="Infra")? $2 "    " $3 : $2 "    " $3 " " $4 : ($3 =="Infra")? $1 "    " $2: $1 "    " $2 " " $3 }' | gum filter | awk 'BEGIN { FS = " " } { print ($1 =="*")? $2: $1 }' | xargs nmcli dev wifi connect
}

ww () {
  help () {
      echo "$(tput setaf 1) ** Missing Connection Option ** \n"
      echo -n "$(tput setaf 2) ww"
      echo -n "$(tput setaf 3) <option> \n"
      echo " "
      echo -e "$(tput setaf 5) List of flag options :"
      echo -n "$(tput setaf 3)     -t, --toggle "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)      Toggle WiFi ON|OFF"
      echo -n "$(tput setaf 3)     -d, --disconnect "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)  Disconnect WiFi connection"
      echo -n "$(tput setaf 3)     -s, --status "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)      Show WiFi status"
      echo -n "$(tput setaf 3)     -n, --radio-on "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)    Turn WiFi radio on"
      echo -n "$(tput setaf 3)     -f, --radio-off "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)   Turn WiFi radio off"
      echo -n "$(tput setaf 3)     -i, --info "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)        Show more WiFi info"
      echo -n "$(tput setaf 3)     -u, --nmtui "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)       TUI Network Manager"
      echo -n "$(tput setaf 3)     -g, --gui "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)        GUI connection editor"
      echo -n "$(tput setaf 3)     -e, --ethernet "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)    Ethernet connection"
      echo -n "$(tput setaf 3)     -h, --help "
      echo -n "$(tput setaf 8) →"
      echo -e "$(tput setaf 6)        Show this help info \n"
      return 1
  }
  if [[ $1 == "-t" || $1 == "--toggle" ]]; then
    wifi toggle
    return 1
  fi
  if [[ $1 == "-d"  || $1 == "--disconnect" ]]; then
    nmcli dev disconnect $2
    return 1
  fi
  if [[ $1 == "-s" || $1 == "--status"  ]]; then
    nmcli dev status
    return 1
  fi
  if [[ $1 == "-n" || $1 == "--radio-on"  ]]; then
    nmcli dev radio on
    return 1
  fi
  if [[ $1 == "-" || $1 == "--radio-off"  ]]; then
    nmcli dev radio off
    return 1
  fi
  if [[ $1 == "-i" || $1 == "--info"  ]]; then
    nmcli --show-secrets connection show
    return 1
  fi
  if [[ $1 == "-e" || $1 == "--ethernet"  ]]; then
    if [[ $2 == "-s" || $2 == "--show"  ]]; then
        nmcli connection show "$3"
    fi

    if [[ $2 == "-c" || $2 == "--connect"  ]]; then
        nmcli connection up "$3"
    fi
    return 1
  fi
  if [[ $1 == "-h" || $1 == "--help"  ]]; then
    help
    return 1
  fi
  if [[ $1 == "-g" || $1 == "--gui"  ]]; then
    nm-connection-editor
    return 1
  fi
  if [[ $1 == "-u" || $1 == "--nmtui"  ]]; then
    nmtui
    return 1
  fi
  clear
  search="h";
  echo " "
  echo "$(tput setaf 2)Searching for available connections ..."
  nmcli dev wifi list > /dev/null 2>&1
  until [ "$search" = "" ]; do
    echo "$(tput setaf 2)\e[1A\e[K List of available connections ..."
    printf "\n"
    nmcli dev wifi list | awk 'BEGIN { FS = "\n" } NR==1 {next;} { print $1}'
    printf "\n"
    echo -n "$(tput setaf 6)Press [Enter] if preferred connection is listed above or [any character] + [Enter] to reload: "
    search=1
    read -r search
    clear
  done

  nmcli dev wifi list | awk 'BEGIN { FS = "\n" } NR==1 {next;} { print $1}' | awk 'BEGIN { FS = " " } { print ($1 =="*")? ($4 =="Infra")? $2 "    " $3 : $2 "    " $3 " " $4 : ($3 =="Infra")? $1 "    " $2: $1 "    " $2 " " $3 }' | gum filter | awk 'BEGIN { FS = " " } { print ($1 =="*")? $2: $1 }' | xargs nmcli dev wifi connect
}

we () {
 nmcli connection add con-name new-enp1s0 ifname enp1s0 type ethernet ip4 192.168.7.31/24 gw4 192.168.7.1                                       12:30:13
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

_gt_help () {
  echo "$(tput setaf 1) ** Missing Flag Option ** \n"
  echo -n "$(tput setaf 2) gt"
  echo "$(tput setaf 3) <option> \n"
  echo -e "$(tput setaf 5) List of flag options :"
  echo -n "$(tput setaf 3)     --set, -s  "
  echo -n "$(tput setaf 8) →"
  echo -e "$(tput setaf 6) Set Remote URL for Origin"
  echo -n "$(tput setaf 3)     --init, -i "
  echo -n "$(tput setaf 8) →"
  echo -e "$(tput setaf 6) Initialize New Repo \n"

}

_gt_repo () {
  echo "$(tput setaf 1) ** Missing Repo Name ** \n"
  echo -n "$(tput setaf 2) gt"
  echo -n "$(tput setaf 3) <option>"
  echo -n "$(tput setaf 4) <repo> \n\n"
  echo -e "$(tput setaf 5) Repository name :"
  echo -n "$(tput setaf 4)     <repo-name> "
  echo -n "$(tput setaf 8) →"
  echo -e "$(tput setaf 6) Custom Repository Name \n "

}

glb () {
    echo " "
    if [[ $1 == "" ]]; then
      _gt_help
        return 1
    fi

    repo_name=""
    if [[ $1 == "--set" || $1 == "-s" ]]; then
      repo_name=$(git remote -v | grep -E "fetch" | cut -d " " -f 1 | awk 'BEGIN { FS = " " } { print $2 }' | awk 'BEGIN { FS = "/" } { print $5 }' | awk 'BEGIN { FS = "." } { print $1 }')
      echo -n "$(tput setaf 3)  GitLab"
      echo -e "$(tput setaf 6) Remote URL Successfully Set : \n"
      git remote set-url origin https://oauth2:$GITLAB_TOKEN@gitlab.com/devpheon/$2.git
    fi

    if [[ $1 == "--init" || $1 == "-i" ]]; then
      if [[ $2 == "" ]]; then
        _gt_repo
          return 1
      fi

      repo_name=$2
      echo -n "$(tput setaf 3)  GitLab"
      echo -e "$(tput setaf 6) Repository Successfully Initialised : \n"
      git init > /dev/null 2>&1 && git remote add origin https://githlab.com/devpheon/$repo_name.git && git branch -M main && git remote set-url origin https://oauth2:$GITLAB_TOKEN@gitlab.com/devpheon/$repo_name.git && touch .gitignore README.md
    fi

    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -e "$(tput setaf 4) $repo_name"
    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -n "$(tput setaf 5) "
    git remote -v | grep -E "fetch" | cut -d " " -f 1 | awk 'BEGIN { FS = " " } { print $2 }'
    echo ""
}

gt () {
    echo " "
    if [[ $1 == "" ]]; then
      _gt_help
        return 1
    fi

    repo_name=""
    if [[ $1 == "--set" || $1 == "-s" ]]; then
      repo_name=$(git remote -v | grep -E "fetch" | cut -d " " -f 1 | awk 'BEGIN { FS = " " } { print $2 }' | awk 'BEGIN { FS = "/" } { print $5 }' | awk 'BEGIN { FS = "." } { print $1 }')
      echo -n "$(tput setaf 3)  GitHub"
      echo -e "$(tput setaf 6) Remote URL Successfully Set : \n"
      git remote set-url origin https://$GITHUB_TOKEN@github.com/Pheon-Dev/$repo_name.git
    fi

    if [[ $1 == "--init" || $1 == "-i" ]]; then
      if [[ $2 == "" ]]; then
        _gt_repo
          return 1
      fi

      repo_name=$2
      echo -n "$(tput setaf 3)  GitHub"
      echo -e "$(tput setaf 6) Repository Successfully Initialised : \n"
      git init > /dev/null 2>&1 && git remote add origin https://github.com/Pheon-Dev/$repo_name.git && git branch -M main && git remote set-url origin https://$GITHUB_TOKEN@github.com/Pheon-Dev/$repo_name.git && touch .gitignore README.md
    fi

    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -e "$(tput setaf 4) $repo_name"
    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -n "$(tput setaf 5) "
    git remote -v | grep -E "fetch" | cut -d " " -f 1 | awk 'BEGIN { FS = " " } { print $2 }'
    echo ""
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
