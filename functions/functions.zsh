#!/bin/bash sh

ed() {
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim
}

lk () {
    regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
    url=$(grep -Po "$regex" | dmenu -p "Go:" -w "$WINDOWID") || exit
    $BROWSER "$url"
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
