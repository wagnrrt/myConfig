# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SDL_VIDEODRIVER=wayland

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1=' \W › '
