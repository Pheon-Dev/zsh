export ZSH="$HOME/.config/zsh/zsh"
source $ZSH/zsh.sh

export STARSHIP_CACHE=~/.starship/cache
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

export EDITOR='nvim'
export VISUAL='nvim'

source "$HOME/.config/zsh/fzf-tab/fzf-tab.zsh"
source "$HOME/.config/zsh/fzf-tab-source/fzf-tab-source.plugin.zsh"
# source "$HOME/.config/zsh/fzf.zsh"

source "$HOME/.config/zsh/env.zsh"
source "$HOME/.config/zsh/functions/got.zsh"
source "$HOME/.config/zsh/functions/gt.zsh"
source "$HOME/.config/zsh/functions/mt.zsh"
source "$HOME/.config/zsh/functions/ww.zsh"
source "$HOME/.config/zsh/functions/fl.zsh"
source "$HOME/.config/zsh/functions/bl.zsh"
source "$HOME/.config/zsh/functions/zz.zsh"
source "$HOME/.config/zsh/functions/rust.zsh"
source "$HOME/.config/zsh/functions/web_search.zsh"
source "$HOME/.config/zsh/functions/functions.zsh"
source "$HOME/.config/zsh/alias.zsh"
source "$HOME/.config/zsh/git.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/vim-mode.zsh"
source "$HOME/.config/zsh/zsh-autopair/autopair.zsh"
# source "$HOME/.config/zsh/auto-notify.zsh"
# source "$HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cp $HOME/.zshrc $HOME/.config/zsh/.zshrc
cp $HOME/.tmux.conf $HOME/.tmux
setxkbmap -option caps:escape

eval "$(zoxide init zsh)"
. /usr/share/z/z.sh

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export GOROOT="/usr/lib/go"
export PATH="$PATH:$GOROOT/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$GOPATH:$HOME/Documents/go"
export PATH="$GOPATH/bin:$PATH"
