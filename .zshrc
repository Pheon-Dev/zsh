if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/pheon/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

source "$HOME/.config/zsh/autosuggestions.zsh"
source "$HOME/.config/zsh/auto-notify.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/web_search.zsh"
source "$HOME/.config/zsh/copydir.zsh"
source "$HOME/.config/zsh/copybuffer.zsh"
source "$HOME/.config/zsh/archive.zsh"
source "$HOME/.config/zsh/copyfile.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

setxkbmap -option caps:escape

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(~/.linuxbrew/bin/brew shellenv)

# eval "$(/bin/brew shellenv)"
# eval "$(/bin/brew shellenv)"
#
source "$HOME/.config/zsh/alias.zsh"

# Documents Directory Navigation
source ~/.config/zsh/apps.zsh
source ~/.config/zsh/git.zsh
source ~/.config/zsh/videos.zsh

# Refresh .zshrc for git 
source ~/.config/zsh/refresh-rc.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#sysinfo

# source /home/pheon/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
