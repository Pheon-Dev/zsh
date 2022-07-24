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

source "$HOME/.config/zsh/auto-notify.zsh"
source "$HOME/.config/zsh/use.zsh"
source "$HOME/.config/zsh/web_search.zsh"
source "$HOME/.config/zsh/dirhistory.zsh"
source "$HOME/.config/zsh/fzf-tab/fzf-tab.plugin.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/vim-mode.zsh"
# source "$HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

setxkbmap -option caps:escape
# nitrogen --restore

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
cp ~/.zshrc ~/.config/zsh/.zshrc

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

# # FZF
# export FZF_DEFAULT_COMMAND="fd --type f --color=never"
# export FZF_DEFAULT_OPTS='--height 64% --layout=reverse --border --color=fg:#d0d0d0,bg:#121212,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#648ce3 --color=info:#6d7d85,prompt:#b53c10,pointer:#5895db --color=marker:#87ff00,spinner:#2b751c,header:#87afaf'
# # export FZF_DEFAULT_OPTS="--extended"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
#
# export FZF_ALT_C_COMMAND="fd --type d . --color=never"
# # export FZF_ALT_C_OPTS="--preview 'tree -C {}' | head -50"
# export FZF_ALT_C_OPTS="--preview 'exa --icons -T --color=always --group-directories-first {}' | head -50"
#
# # bindkey "^f" fzf-cd-widget
# export FZF_COMPLETION_OPTS='--border --info=inline'
# # Use fd (https://github.com/sharkdp/fd) instead of the default find
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }
#
# # Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }
#
# # try out using `exa -T (exa's tree)` with fzf preview on cd **<tab>
# _fzf_comprun() {
#   local command=$1
#   shift
#
#   case "$command" in
#     cd)           fzf "$@" --preview 'exa -aT -L=1 {}' ;;
#     *)            fzf "$@" ;;
#   esac
# }
# bindkey '^S' fzf_completion
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/pheon/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
export PATH=/home/pheon/.local/share/pnpm:/home/pheon/.cargo/bin:/home/pheon/.emacs.d/bin:/home/pheon/.rvm/gems/ruby-2.3.8/bin:/home/pheon/.rvm/gems/ruby-2.3.8@global/bin:/home/pheon/.rvm/rubies/ruby-2.3.8/bin:/home/pheon/.local/share/pnpm:/home/pheon/.cargo/bin:/home/pheon/.emacs.d/bin:/home/pheon/.rvm/gems/ruby-2.3.8/bin:/home/pheon/.rvm/gems/ruby-2.3.8@global/bin:/home/pheon/.rvm/rubies/ruby-2.3.8/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/pheon/.rvm/bin:/var/lib/snapd/snap/bin:/usr/lib/jvm/default/bin:/usr/local/go/bin
export DENO_INSTALL="/home/pheon/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
