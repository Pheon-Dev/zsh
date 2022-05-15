# alias esc="setxkbmap -option caps:escape"
# ~/.zshrc
alias ls="exa --icons --color=always --group-directories-first"
alias ll="exa --icons -abghHliS --color=always --group-directories-first"
alias la="exa --icons -a --color=always --group-directories-first"
alias lt="exa --icons -T --color=always --group-directories-first"
alias l.='exa -a | egrep "^\."'
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias x="exit"
alias ytv="youtube-dl"
alias shuffle="mpv --shuffle"
alias mus="mocp"
alias msh="mocp -t shuffle"
alias mnx="mocp -t autonext"
alias mre="mocp -t repeat"
alias mob="mocp -r"
alias mon="mocp -f"
alias mop="mocp -G"
alias mov="mocp -v"
alias moi="mocp -i | grep File"
alias vol="pulsemixer"
alias pmu="cd /home/pheon/Music"
alias dw="cd /home/pheon/Downloads/"
alias play="cd /home/pheon/Documents/Play-Ground/"
alias dwm="cd /home/pheon/Downloads/Movies/"
alias dc="cd /home/pheon/Documents/"
alias xf="exiftool"
alias nodv="pnpx node@$version -v" #@10  v10.18.1
alias apnx="pnpx create-next-app"
alias apre="pnpx create-react-app"
alias apvi="pnpm init vite"
alias apsv="pnpx degit sveltejs/template"
alias pcon="p10k configure"
alias tm="tmux"
alias tms="tmux new-session -s"
alias tma="tmux attach"
alias vi="/home/pheon/.local/bin/lvim"
alias lv="/home/pheon/.local/bin/lvim"
alias v="nvim"
alias vim="nvim"
alias cat="bat"
alias npd="pnpm run dev"
alias npw="pnpm run watch"
alias nps="pnpm run start"
alias npb="npm run build"
alias npiy="npm init -y"
alias pni='pnpm i'
alias pnid='pnpm i -D'
alias pnig='pnpm i -g'
alias npi="npm i"
alias npid="npm i -D"
alias npig="npm i -g"
alias npau="npm audit fix"
alias pnau="pnpm audit fix"
alias npaf="npm audit fix --force"
alias pnaf="pnpm audit fix --force"
alias snapi="snap install"
# alias disn="xrandr --output eDP-1 --off && killall conky"
# alias disf="xrandr --output eDP-1 --auto" # HDMI-1
alias dish="xrandr --output eDP-1 --off --output HDMI-1 --auto; nitrogen --restore"
alias dise="xrandr --output HDMI-1 --off --output eDP-1 --auto; nitrogen --restore"
alias disa='xrandr --output eDP-1 --primary --auto --right-of HDMI-1 --auto; nitrogen --restore'
alias sus="systemctl suspend"
alias rfig='cd ~/.config/ranger && vim'
alias efig="cd ~/.config/doom && vim"
alias qfig="cd ~/.config/qtile && vim"
alias vfig="cd ~/.config/nvim && vim"
alias lfig="cd ~/.local/share/lunarvim/lvim/ && vi"
alias dfig="cd ~/.config/arco-dwm && vim"
alias xfig="cd ~/.config/xmobar/xmobar && vim"
alias afig="cd ~/.config/alacritty && vim"
alias ifig="cd ~/.config/i3 && vim"
alias zfig="cd ~/.config/zsh && vim"
alias kfig="cd ~/.config/kitty && vim"
alias cfig="cd ~/Dotfiles/Pheon-Dev-Dotfiles && lv"
alias mfig="cd ~/.moc/ && vim"
alias tfig="cd ~/.tmux/plugins && vim"
alias pfig="nvim ~/.p10k.zsh"
alias blf='bluetooth off'
alias bln='bluetooth on'
alias bls="bluetoothctl scan on"  
alias blc="bluetoothctl connect CC:98:8B:A7:BB:38"  
alias blr="bluetoothctl connect"  
alias bli="bluetoothctl info"  
alias bld="bluetoothctl disconnect CC:98:8B:A7:BB:38"  
alias blp="bluetoothctl pair CC:98:8B:A7:BB:38"
alias wfa="nmcli dev wifi list"
alias wft="wifi toggle"
alias wfc="nmcli dev wifi connect ."
alias wfr="nmcli dev wifi connect"
alias wfd="nmcli dev disconnect"
alias wfs="nmcli dev status"
alias wfo="nmcli radio wifi on"
alias wfi="nmcli --show-secrets connection show"
alias mntl="sudo fdisk -l"
alias pacu="sudo pacman -Syyu"
alias pacl="sudo rm /var/lib/pacman/db.lck"
alias yaya="yay -Sua --noconfirm"    # Update AUR pkgs
alias yayu="yay -Syu --noconfirm"    # Update AUR & Standard pkgs
alias yays="yay -S --noconfirm"    # Update AUR & Standard pkgs
alias paci="sudo pacman -S"
alias pacs="sudo pacman -Syu --noconfirm"
alias alis="alias | grep"
alias luamake="/home/pheon/.config/nvim/lua-language-server/3rd/luamake/luamake"
alias icat="kitty +kitten icat --align=left"
alias lis="live-server"
alias winfo='xprop'
alias c='clear'
alias rn='ranger'
alias ari='aria2c --file-allocation=none -c -x 10 -d . -Z'
