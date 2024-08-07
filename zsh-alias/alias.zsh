#!/bin/bash zsh

# eza
alias ls="eza --icons --color=always --group-directories-first"
alias la="eza --icons -abghHliS --color=always --group-directories-first"
alias l="eza --icons -la --color=always --group-directories-first"
alias ll="eza --icons -a --color=always --group-directories-first"
alias lt="eza --icons -T --color=always --group-directories-first"
alias l.='eza -a | egrep "^\."'

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias x="exit"
alias js="joshuto"
# alias ytl="youtube-dl"
alias msh="mpv --shuffle"
alias mnv="mpv --no-video"
alias mdt="mpv ."

# # MOCP
# alias mus="mocp"
# alias msh="mocp -t shuffle"
# alias mnx="mocp -t autonext"
# alias mre="mocp -t repeat"
# alias mob="mocp -r && mocp -i | grep File"
# alias mon="mocp -f && mocp -i | grep File"
# alias mop="mocp -G"
# alias mov="mocp -v"
# alias moi="mocp -i"
# alias mos='mocp -i | grep -E "File" | cut -d "/" -f 6'
# alias vol="pulsemixer"

alias dow="cd $HOME/Downloads/"
alias doc="cd $HOME/Documents/"

alias xf="exiftool"

alias nvg="wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash"
alias nvl="nvm install node" #latest
alias nvi="nvm install" #nvi 10.18.1

alias apnx="pnpx create-next-app"
alias apre="pnpx create-react-app"
alias apvi="pnpm create vite || npm create vite"
alias apsv="pnpx degit sveltejs/template"

alias pcon="p10k configure"

# TMUX
alias t="tmux"
alias tn="tmux new-session -s"
alias ta="tmux attach"
alias tl="tmux ls"
alias tx="tmux kill-server"
alias tk="tmux kill-session -t"
alias ts="tmux source $HOME/.tmux.conf"

# EDITOR
alias vl="$EDITOR --listen ~/.cache/nvim/server.pipe"
alias vs="$EDITOR --server ~/.cache/nvim/server.pipe --remote"
alias v="$EDITOR"
alias nvim="$EDITOR"
alias nv="$EDITOR"
alias vim="$EDITOR"

alias j="just"

alias cat="bat"
alias man="tldr"

# NPNPM
alias pnu='sudo pnpm add -g pnpm'
alias pnb='pnpm run build'
alias pnt='pnpm create tauri-app'
alias pnd="pnpm run dev"
alias pnw="pnpm run watch"
alias pns="pnpm run start"
alias pni='pnpm install'
alias pnid='pnpm add -D'
alias pnig='pnpm add -g'
alias pnau="pnpm audit fix"
alias pnaf="pnpm audit fix --force"

# alias pnb="npm run build"
# alias pniy="npm init -y"
# alias npi="npm i"
# alias npid="npm i -D"
# alias npig="npm i --location=global"
# alias npau="npm audit fix"
# alias npaf="npm audit fix --force"

alias snapi="snap install"

# XANDR
# alias disn="xrandr --output eDP-1 --off && killall conky"
# alias disf="xrandr --output eDP-1 --auto" # HDMI-1
alias dish="xrandr --output eDP-1 --off --output HDMI-1 --auto; nitrogen --restore"
alias dise="xrandr --output HDMI-1 --off --output eDP-1 --auto; nitrogen --restore"
alias disa='xrandr --output eDP-1 --primary --auto --left-of HDMI-1 --auto; nitrogen --restore'

alias u='systemctl suspend'
alias e='archlinux-logout'

# CONFIG
alias afg="cd $HOME/.config/alacritty && $EDITOR"
alias dfg="cd $HOME/.config/dwm && $EDITOR"
alias kfg="cd $HOME/.config/kitty && $EDITOR"
alias lfg="cd $HOME/.config/lazygit && $EDITOR"
alias mfg="cd $HOME/.config/dmenu && $EDITOR"
alias rfg="cd $HOME/.config/ranger && $EDITOR"
alias tfg="cd $HOME/.tmux && $EDITOR"
alias sfg="cd $HOME/.config/st && $EDITOR"
alias nfg="cd $HOME/.config/nvim && $EDITOR"
alias vfg="cd $HOME/.vim && vim"
alias zfg="cd $HOME/.config/zsh && $EDITOR"
alias jfg="cd $HOME/.config/zellij && $EDITOR"
alias bfg="cd $HOME/.config/dwmbar && $EDITOR"
alias wfg="cd $HOME/.config/wezterm && $EDITOR"

# zinit self-update
# zinit update
# zinit update --parallel
# zinit update --parallel 40

# YAY
alias yaya="yay -Sua --noconfirm"
alias yayu="yay -Syyu"
alias yays="yay -Syu --noconfirm"

# PACMAN
alias pacu="sudo pacman -Syyu"
alias pacl="sudo rm /var/lib/pacman/db.lck"
alias paci="sudo pacman -S"
alias pacu="sudo pacman -Syyu"
alias pacs="sudo pacman -Syu --noconfirm"

alias sx="startx"
alias alis="alias | grep"
alias icat="kitty +kitten icat --align=left"
alias lis="live-server" # cargo install live-server
alias winfo='xprop'
alias c='clear'
alias rn='ranger'
alias ari='aria2c --file-allocation=none -c -x 10 -d . -Z'
alias tp='toipe -w top10000'

alias npu='sudo npm update --location=global'

alias lg='lazygit'

alias deni='deno run -A -r https://fresh.deno.dev'
alias dens='deno task start'

# YARN
alias y="yarn"
alias ya="yarn add"
alias yr="yarn remove"
alias yb="yarn build"
alias yt="yarn turbo run build"
alias yg="yarn global add"
alias yv="yarn add --dev"
alias yd="yarn dev"
alias ys="yarn start"
alias yi="yarn init"
alias yx="yarn create next-app --typescript" # alt [ynx app-name]
alias ye="yarn add --ignore-engines"

# alias f="fuck"
alias fsg="flameshot gui -p ~/Downloads/Picture"

alias vercel="$HOME/.yarn/bin/vercel"
alias firebase="$HOME/.yarn/bin/firebase"

# PRISMA
alias prisma="$HOME/.yarn/bin/prisma"
alias pft="prisma format"
alias psh="prisma db push"
alias pll="prisma pull"
alias pnt="prisma init"
alias pgn="prisma generate"
alias pst="prisma studio"

alias smk="sudo make clean install"

alias rb="reboot"
alias fsh="shfmt -l -w ."
alias sls="slides"
alias sl="slock"

alias fl="flamingo && clear"
alias pk="peek"

alias h="helix"

alias rf='rm -rf'
alias gw='glow'
alias gpt='npx terminalgpt chat'

alias notes="cd $HOME/.nb/home && nvim"

alias lout="sudo systemctl restart ly.service"
alias nitro="nitrogen --restore > /dev/null 2>&1"

alias cp="rsync -avh --inplace --no-whole-file --info=progress2"

alias anime="$HOME/.local/bin/anime dl"
alias radio="radion"
alias tgc='clear && ~/.yarn/bin/tgc'
