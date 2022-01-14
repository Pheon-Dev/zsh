# alias esc="setxkbmap -option caps:escape"
# ~/.zshrc
alias ls="exa --icons --color=always --group-directories-first"
alias ll="exa --icons -abghHliS --color=always --group-directories-first"
alias la="exa --icons -a --color=always --group-directories-first"
alias lt="exa --icons -T --color=always --group-directories-first"
alias l.='exa -a | egrep "^\."'
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias x="exit"
alias yta="source ~/.config/zsh/youtube-dl-audio.zsh"
alias ytv="youtube-dl"
alias play="mpv"
alias shuffle="mpv --shuffle"
alias mus="mocp"
alias msh="mocp -t shuffle"
alias mnx="mocp -t autonext"
alias mre="mocp -t repeat"
alias mob="mocp -r"
alias mon="mocp -f"
alias mop="mocp -G"
alias mov="mocp -v"
alias pmu="cd /home/pheon/Music"
alias dw="cd /home/pheon/Downloads/"
alias dwm="cd /home/pheon/Downloads/Movies/"
alias dc="cd /home/pheon/Documents/"
alias xf="exiftool"
alias gicg="git config --global"
alias gicl="git config -l"
alias gint="git init"
alias gist="git status"
alias gicl="git clone"
# git clone https://<token>@github.com/<username>/<repository>.git
alias gict="source ~/.config/zsh/clone-tkn.zsh"
alias giad="git add -A"
alias gico="git commit -m"
alias gire="git remote add origin"
# git remote set-url origin https://<token>@github.com/<username>/<repository>.git 
alias girt="source ~/.config/zsh/remote-tkn.zsh"
alias gips="git push -u origin"
alias gipf="git push -f origin"
alias gipl="git pull"
alias gibr="git branch -M"
alias nxap="npx create-next-app@latest"
alias rcap="npx create-react-app@latest"
alias viap="npm init vite@latest"
alias pcon="p10k configure"
alias tm="tmux"
alias tms="tmux new-session -s"
alias tma="tmux attach"
alias vi="nvim"
alias v="nvim"
alias vim="nvim"
alias cat="bat"
alias npd="npm run dev"
alias npw="npm run watch"
alias nps="npm run start"
alias npb="npm run build"
alias npiy="npm init -y"
alias npi="npm i"
alias npid="npm i -D"
alias npig="npm i -g"
alias npau="npm audit fix"
alias npaf="npm audit fix --force"
alias snapi="snap install"
alias disn="xrandr --output eDP-1 --off && killall conky"
alias disf="xrandr --output eDP-1 --auto" # HDMI-1
alias sus="systemctl suspend"
alias qfig="cd ~/.config/qtile && vim"
alias vfig="cd ~/.config/nvim && vim"
alias dfig="cd ~/.config/arco-dwm && vim"
alias xfig="cd ~/.config/xmobar/xmobar && vim"
alias afig="cd ~/.config/alacritty && vim"
alias zfig="cd ~/.config/zsh && vim"
alias cfig="vim ~/.conkyrc"
alias mfig="cd ~/.moc/ && vim"
alias tfig="cd ~/.tmux && vim"
alias pfig="nvim ~/.p10k.zsh"
alias psou="source ~/.p10k.zsh"
alias tsou="tmux source ~/.tmux.conf"
alias zsou="source ~/.zshrc"
alias bsou="source ~/.bashrc"
alias bls="bluetoothctl scan on"  
alias blc="bluetoothctl connect CC:98:8B:A7:BB:38"  
alias blr="bluetoothctl connect"  
alias bli="bluetoothctl info"  
alias bld="bluetoothctl disconnect"  
alias wfa="nmcli dev wifi list"
alias wfc="nmcli dev wifi connect ."
alias wfr="nmcli dev wifi connect"
alias wfe="source ~/.config/zsh/wifi-extra.zsh"
alias wfd="nmcli dev disconnect"
alias wfs="nmcli dev status"
alias wfi="nmcli --show-secrets connection show"
alias mntl="sudo fdisk -l"
alias mntd="source ~/.config/zsh/mount-dir.zsh"
alias mntm="source ~/.config/zsh/mount.zsh"
alias mntu="source ~/.config/zsh/umount.zsh"
alias pacu="sudo pacman -Syyu"
alias pacl="sudo rm /var/lib/pacman/db.lck"
alias yaya="yay -Sua --noconfirm"    # Update AUR pkgs
alias yayu="yay -Syu --noconfirm"    # Update AUR & Standard pkgs
alias paci="sudo pacman -S"
alias alis="alias | grep"
alias luamake=/home/pheon/.config/nvim/lua-language-server/3rd/luamake/luamake

# Check list of USB Devices
# $sudo fdisk -l
#
# Make a mount location
# $sudo mkdir /run/media/directory_name
#
# Mount Drive to directory
# $sudo mount /dev/sdb# /run/media/directory_name
#
# Unmount Drive
# $sudo umount /run/media/directory_name
#
# List Mounted Locations
# $cat /proc/mounts

###################### NETWORK MANAGER CLI CONNECTIONS ####################
# Check Wifi status
# $nmcli dev status
#
# Turn Wifi Driver on/off 
# $nmcli radio wifi 
# $nmcli radio wifi on/off 
#
# List WiFi Connections Available
# $nmcli dev wifi list
#
# Connect to WiFi 
# $nmcli dev wifi connect network-ssid
#
# First Time Connection with password 
# $nmcli dev wifi connect network-ssid password network-password
#
# Or to make the network visible/invisible
# $nmcli --ask dev wifi connect network-ssid
#
# Check Connection info 
# $nmcli --show-secrets connection show network-ssid
#
### Hotspot Conectivity
# First time connection 
# $nmcli dev wifi con network-ssid password network-password name network-hotspot-connection-name 
# 
# Second Time Onwards connections
# $nmcli con up id network-hotspot-connection-name 
#
# Create Hotspot connection and connect it
# $nmcli -s dev wifi hotspot con-name network-hotspot-connection-name
#
### Ethernet Connectivity
# $nmcli connection add type ethernet autoconnect no ifname eth0
#
### OpenVPN 
# $nmcli con import type openvpn file ~/Downloads/frootvpn.ovpn 
#
