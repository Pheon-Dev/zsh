autoload -U compinit
compinit
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*' file-list all
zstyle ':completion:*:default' list-colors  $(exa --icons -a --color=always --group-directories-first)
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' squeeze-slashes false
zstyle ':completion:*' complete-options false
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#
# zle -C alias-expension complete-word _generic
# bindkey '^b' alias-expension
# zstyle ':completion:alias-expension:*' completer _expand_alias
#
# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
