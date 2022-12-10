ed() {
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

lk () {
    regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
    url=$(grep -Po "$regex" | dmenu -p "Go:" -w "$WINDOWID") || exit
    $BROWSER "$url"
}

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


gt () {
    if [[ $2 == "" ]]; then
        echo ""
        if [[ $1 == "" ]]; then
            echo "$(tput setaf 1) ** Missing Flag Option and Repo Name ** \n"
        else
            echo "$(tput setaf 1) ** Missing Repo Name ** \n"
        fi
        echo -n "$(tput setaf 2) gt"
        echo -n "$(tput setaf 3) <option> "
        echo "$(tput setaf 4) <repo> \n"
        echo -e "$(tput setaf 5) List of options :"
        echo -n "$(tput setaf 6)     hub "
        echo -n "$(tput setaf 8) →"
        echo -e "$(tput setaf 7) Init a GitHub Repository"
        echo -n "$(tput setaf 6)     lab "
        echo -n "$(tput setaf 8) →"
        echo -e "$(tput setaf 7) Init a GitLab Repository \n "
        return 1
    fi
    echo ""
    echo -e "$(tput setaf 7) Git Repository Initialised Successfully :"
    echo -n "$(tput setaf 2)      "
    echo -n "$(tput setaf 8) →"
    echo -e "$(tput setaf 4) $2"
    if [[ $1 == "hub" ]]; then
        git init > /dev/null 2>$1 && git remote add origin https://github.com/Pheon-Dev/$2.git && git branch -M main && git remote set-url origin https://$GITHUB_TOKEN@github.com/Pheon-Dev/$2.git
        echo -n "$(tput setaf 2)      "
        echo -n "$(tput setaf 8) →"
        echo -n "$(tput setaf 3) github \n"
    fi
    if [[ $1 == "lab" ]]; then
        git init > /dev/null 2>$1 && git remote add origin https://githlab.com/devpheon/$2.git && git branch -M main && git remote set-url origin https://oauth2:$GITLAB_TOKEN@gitlab.com/devpheon/$2.git
        echo -n "$(tput setaf 2)      "
        echo -n "$(tput setaf 8) →"
        echo -n "$(tput setaf 3) gitlab \n"
    fi
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

dca () {
    emulate -L zsh
    if [[ -z "$docs[$1]" ]]; then
        echo -l "'$1' not found. Try :\n  go  nx  ts  rs"
        return 1
    else
        doc="${docs[$1]}"
        cd ~/Documents/"$doc" && l
    fi
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
wn () {
    nmcli connection show "$1"
}

wu () {
    nmcli connection up "$1"
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
