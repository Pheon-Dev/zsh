ed() {
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

lk () {
    regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
    url=$(grep -Po "$regex" | dmenu -p "Go:" -w "$WINDOWID") || exit
    $BROWSER "$url"
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
      echo -e "$(tput setaf 6)       Network Manager Terminal UI"
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
  if [[ $1 == "-u" || $1 == "--nmtui"  ]]; then
    nmtui
    return 1
  fi
  clear
  search="h";
  echo " "
  echo "$(tput setaf 2)Searching for available connections ..."
  nmcli dev wifi list > /dev/null 2>&1
  until [ "$search" = "l" ]; do
    echo "$(tput setaf 2)\e[1A\e[K List of available connections ..."
    printf "\n"
    nmcli dev wifi list | awk 'BEGIN { FS = "\n" } NR==1 {next;} { print $1}'
    printf "\n"
    echo -n "$(tput setaf 6)Press [Enter] if preferred connection is not listed above or [l] to continue: "
    search=1
    read -r search
    clear
  done

  nmcli dev wifi list | awk 'BEGIN { FS = "\n" } NR==1 {next;} { print $1}' | awk 'BEGIN { FS = " " } { print ($1 =="*")? ($4 =="Infra")? $2 "    " $3 : $2 "    " $3 " " $4 : ($3 =="Infra")? $1 "    " $2: $1 "    " $2 " " $3 }' | gum filter | awk 'BEGIN { FS = " " } { print ($1 =="*")? $2: $1 }' | xargs nmcli dev wifi connect
}

zl () {
    echo " "
    if [[ $1 == "" ]]; then
        echo "$(tput setaf 1) ** Missing Layout Option ** \n"
        echo -n "$(tput setaf 2) zl"
        echo -n "$(tput setaf 3) <option> \n"
        echo " "
        echo -e "$(tput setaf 5) List of layout options :"
        echo "$(tput setaf 3)"
        layouts=$(ls "$HOME/.config/zellij/layouts" | awk 'BEGIN { FS = "\n" } { print " " echo "    " $1 }' | cut -d "." -f 1)
        echo -n "$layouts"
        echo " "
        echo " "
        return 1
    fi
    zellij -l /home/pheon/.config/zellij/layouts/$1.kdl --session $1
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

gt () {
    echo " "
    if [[ $3 == "" ]]; then
        if [[ $2 == "" ]]; then
            if [[ $1 == "" ]]; then
                echo "$(tput setaf 1) ** Missing Flag Option ** \n"
                echo -n "$(tput setaf 2) gt"
                echo -n "$(tput setaf 3) <option>"
                echo "$(tput setaf 4) <repo> \n"
                echo -e "$(tput setaf 5) List of flag options :"
                echo -n "$(tput setaf 3)     set "
                echo -n "$(tput setaf 8) →"
                echo -e "$(tput setaf 6) Set Remote URL for Origin"
                echo -n "$(tput setaf 3)     hub "
                echo -n "$(tput setaf 8) →"
                echo -e "$(tput setaf 6) Init a GitHub Repository"
                echo -n "$(tput setaf 3)     lab "
                echo -n "$(tput setaf 8) →"
                echo -e "$(tput setaf 6) Init a GitLab Repository \n "
                return 1
            fi
            echo "$(tput setaf 1) ** Missing Repo Name ** \n"
            echo -n "$(tput setaf 2) gt"
            echo -n "$(tput setaf 3) <option>"
            echo -n "$(tput setaf 4) <repo>"
            if [[ $1 == "set" ]]; then
                echo -e "$(tput setaf 7) <site>"
            fi
            echo -e "\n"
            echo -e "$(tput setaf 5) Repository name :"
            echo -n "$(tput setaf 4)     <repo-name> "
            echo -n "$(tput setaf 8) →"
            echo -e "$(tput setaf 6) Custom Repository Name \n "
            return 1
        fi
        if [[ $1 == "set" ]]; then
            echo "$(tput setaf 1) ** Missing Site Option ** \n"
            echo -n "$(tput setaf 2) gt"
            echo -n "$(tput setaf 3) <option>"
            echo -n "$(tput setaf 4) <repo>"
            echo "$(tput setaf 7) <site> \n"
            echo -e "$(tput setaf 5) List of site options :"
            echo -n "$(tput setaf 7)     hub "
            echo -n "$(tput setaf 8) →"
            echo -e "$(tput setaf 6) GitHub "
            echo -n "$(tput setaf 7)     lab "
            echo -n "$(tput setaf 8) →"
            echo -e "$(tput setaf 6) GitLab \n "
            return 1
        fi
    fi

    if [[ $1 == "set" ]]; then
        if [[ $3 == "hub" ]]; then
            echo -n "$(tput setaf 3)  GitHub"
            echo -e "$(tput setaf 6) Remote URL Successfully Set : \n"
            git remote set-url origin https://$GITHUB_TOKEN@github.com/Pheon-Dev/$2.git
        fi
        if [[ $3 == "lab" ]]; then
            echo -n "$(tput setaf 3)  GitLab"
            echo -e "$(tput setaf 6) Remote URL Successfully Set : \n"
            git remote set-url origin https://oauth2:$GITLAB_TOKEN@gitlab.com/devpheon/$2.git
        fi
    fi
    if [[ $1 == "hub" ]]; then
        echo -n "$(tput setaf 3)  GitHub"
        echo -e "$(tput setaf 6) Repository Successfully Initialised : \n"
        git init > /dev/null 2>&1 && git remote add origin https://github.com/Pheon-Dev/$2.git && git branch -M main && git remote set-url origin https://$GITHUB_TOKEN@github.com/Pheon-Dev/$2.git && touch .gitignore README.md
    fi
    if [[ $1 == "lab" ]]; then
        echo -n "$(tput setaf 3)  GitLab"
        echo -e "$(tput setaf 6) Repository Successfully Initialised : \n"
        git init > /dev/null 2>&1 && git remote add origin https://githlab.com/devpheon/$2.git && git branch -M main && git remote set-url origin https://oauth2:$GITLAB_TOKEN@gitlab.com/devpheon/$2.git && touch .gitignore README.md
    fi
    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -e "$(tput setaf 4) $2"
    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -n "$(tput setaf 5) "
    git remote -v | grep -E "fetch" | cut -d " " -f 1 | awk 'BEGIN { FS = " " } { print $2 }'
    echo ""
}

typeset -A docs
docs=(
    go              "go"
    nx              "NextJS"
    rs              "Rust"
    ts              "Typescript"
)

# dca () {
#     emulate -L zsh
#     if [[ -z "$docs[$1]" ]]; then
#         echo -l "'$1' not found. Try :\n  go  nx  ts  rs"
#         return 1
#     else
#         doc="${docs[$1]}"
#         cd ~/Documents/"$doc" && l
#     fi
# }

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
