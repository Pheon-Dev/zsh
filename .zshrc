if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/pheon/.oh-my-zsh"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

source "$HOME/.config/zsh/auto-suggestions.zsh"
# source "$HOME/.config/zsh/auto-notify.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/web_search.zsh"
source "$HOME/.config/zsh/copydir.zsh"
source "$HOME/.config/zsh/copybuffer.zsh"
source "$HOME/.config/zsh/archive.zsh"
source "$HOME/.config/zsh/copyfile.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

setxkbmap -option caps:escape

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm alias default node

# eval $(~/.linuxbrew/bin/brew shellenv)

# eval "$(/bin/brew shellenv)"
# eval "$(/bin/brew shellenv)"
#
source "$HOME/.config/zsh/alias.zsh"
# source "$HOME/Dotfiles/Pheon-Dev-Dotfiles/version_control.sh"
# source "$HOME/Dotfiles/Pheon-Dev-Dotfiles/zsh.sh"

# Documents Directory Navigation
source ~/.config/zsh/dca.zsh
source ~/.config/zsh/dcg.zsh
source ~/.config/zsh/dcv.zsh

source ~/.config/zsh/git.zsh
# Refresh .zshrc for git 
source ~/.config/zsh/refresh-rc.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#sysinfo

# source /home/pheon/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

 . /usr/share/z/z.sh    # cd around for a while to build up the db.

eval # ============================================================================= # # Utility functions for zoxide. # # pwd based on the value of _ZO_RESOLVE_SYMLINKS. function __zoxide_pwd() { uiltin pwd -L } # cd + custom logic based on the value of _ZO_ECHO. function __zoxide_cd() { # shellcheck disable=SC2164 uiltin cd "$@" } # ============================================================================= # # Hook configuration for zoxide. # # Hook to add new entries to the database. function __zoxide_hook() { 
