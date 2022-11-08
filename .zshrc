# source "$HOME/.config/zsh/zsh-fortune/fortune.plugin.zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH="/home/pheon/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ZSH_THEME="af-magic"
# ZSH_THEME="robbyrussell"

export EDITOR='nvim'

plugins=(git)

# nvm alias default node

export PATH="$HOME/.cargo/bin:$PATH"

source "$HOME/.config/zsh/alias.zsh"
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/git.zsh"
source "$HOME/.config/zsh/auto-notify.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/web_search.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/vim-mode.zsh"
source "$HOME/.config/zsh/fzf-tab/fzf-tab.plugin.zsh"
source "$HOME/.config/zsh/fzf.zsh"
# source "$HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Refresh .zshrc for git 
cp ~/.zshrc ~/.config/zsh/.zshrc
cp ~/.tmux.conf ~/.tmux
setxkbmap -option caps:escape
# nitrogen --restore

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#sysinfo

# PROFIT!!
# 
# Optionally:
#        Set $_Z_CMD to change the command name (default z).
#        Set $_Z_DATA to change the datafile (default $HOME/.z).
#        Set $_Z_NO_RESOLVE_SYMLINKS to prevent symlink resolution.
#        Set $_Z_NO_PROMPT_COMMAND to handle PROMPT_COMMAND/precmd yourself.
#        Set $_Z_EXCLUDE_DIRS to an array of directory trees to exclude.
#        Set $_Z_OWNER to allow usage when in 'sudo -s' mode.
#        (These settings should go in .bashrc/.zshrc before the line added above.)
#        Install the provided man page z.1 somewhere in your MANPATH, like /usr/local/man/man1.

eval "$(zoxide init zsh)"
 . /usr/share/z/z.sh

eval # ============================================================================= # # Utility functions for zoxide. # # pwd based on the value of _ZO_RESOLVE_SYMLINKS. function __zoxide_pwd() { uiltin pwd -L } # cd + custom logic based on the value of _ZO_ECHO. function __zoxide_cd() { # shellcheck disable=SC2164 uiltin cd "$@" } # ============================================================================= # # Hook configuration for zoxide. # # Hook to add new entries to the database. function __zoxide_hook() { 

# pnpm
export PNPM_HOME="/home/pheon/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
export PATH=/home/pheon/.local/share/pnpm:/home/pheon/.cargo/bin:/home/pheon/.emacs.d/bin:/home/pheon/.rvm/gems/ruby-2.3.8/bin:/home/pheon/.rvm/gems/ruby-2.3.8@global/bin:/home/pheon/.rvm/rubies/ruby-2.3.8/bin:/home/pheon/.local/share/pnpm:/home/pheon/.cargo/bin:/home/pheon/.emacs.d/bin:/home/pheon/.rvm/gems/ruby-2.3.8/bin:/home/pheon/.rvm/gems/ruby-2.3.8@global/bin:/home/pheon/.rvm/rubies/ruby-2.3.8/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/pheon/.rvm/bin:/var/lib/snapd/snap/bin:/usr/lib/jvm/default/bin:/usr/local/go/bin
export DENO_INSTALL="/home/pheon/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# [ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
#
# # Example install plugins
# zapplug "zsh-users/zsh-autosuggestions"
# zapplug "zsh-users/zsh-syntax-highlighting"
# zapplug "hlissner/zsh-autopair"
# zapplug "zap-zsh/vim"
#
# # Example theme
# zapplug "zap-zsh/zap-prompt"
# # zapplug "Pheon-Dev/utils"
#
# # Example install completion
# # zapcmp "esc/conda-zsh-completion" false
