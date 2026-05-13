# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

bind 'set show-mode-in-prompt on'
bind -m vi-insert '"jk": "\e"'

bind 'set vi-cmd-mode-string \1\e[6 q\2'
bind 'set vi-ins-mode-string \1\e[4 q\2'

export SDL_VIDEODRIVER=wayland

alias ls='ls --color=auto'
alias grep='grep --color=auto'

echo -e "\e[96m
  ▄▄▄       ██▀███   ▄████▄   ██░ ██ 
  ▒████▄    ▓██ ▒ ██▒▒██▀ ▀█  ▓██░ ██▒
  ▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄ ▒██▀▀██░
  ░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒░▓█ ░██ 
   ▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░░▓█▒░██▓
   ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒ ░░▒░▒
    ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒    ▒ ░▒░ ░
    ░   ▒     ░░   ░ ░         ░  ░░ ░
        ░  ░   ░     ░ ░       ░  ░  ░
                     ░                
\e[0m"

PS1=' \W › '

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

