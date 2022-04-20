if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/pheon/.oh-my-zsh"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

export EDITOR='nvim'
# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#00f0e0'
fi

# source "$HOME/.config/zsh/auto-notify.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/web_search.zsh"
source "$HOME/.config/zsh/copydir.zsh"
source "$HOME/.config/zsh/copybuffer.zsh"
source "$HOME/.config/zsh/archive.zsh"
source "$HOME/.config/zsh/copyfile.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# source "$HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

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
#
source ~/.config/zsh/functions.zsh

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

export FZF_DEFAULT_OPTS='--height 64% --layout=reverse --border --color=fg:#d0d0d0,bg:#121212,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#648ce3 --color=info:#6d7d85,prompt:#b53c10,pointer:#5895db --color=marker:#87ff00,spinner:#2b751c,header:#87afaf'
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# bindkey "^f" fzf-cd-widget
export FZF_COMPLETION_OPTS='--border --info=inline'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# try out using `exa -T (exa's tree)` with fzf preview on cd **<tab>
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'exa -aT -L=1 {}' ;;
    *)            fzf "$@" ;;
  esac
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
