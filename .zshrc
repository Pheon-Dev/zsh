if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH="/home/pheon/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init zsh)"

export EDITOR='nvim'
export VISUAL='nvim'

source "$HOME/.config/zsh/fzf-tab/fzf-tab.zsh"
source "$HOME/.config/zsh/fzf-tab-source/fzf-tab-source.plugin.zsh"
# source "$HOME/.config/zsh/fzf.zsh"

source "$HOME/.config/zsh/alias.zsh"
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/git.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/web_search.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/vim-mode.zsh"
source "$HOME/.config/zsh/autopair.zsh"
# source "$HOME/.config/zsh/auto-notify.zsh"
# source "$HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cp ~/.zshrc ~/.config/zsh/.zshrc
cp ~/.tmux.conf ~/.tmux
setxkbmap -option caps:escape

eval "$(zoxide init zsh)"
 . /usr/share/z/z.sh

export PNPM_HOME="/home/pheon/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export DENO_INSTALL="/home/pheon/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# PROMPT='%F{cyan}%m:%~ %f ❯ '
# RPROMPT='%* %?'
