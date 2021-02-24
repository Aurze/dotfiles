#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

alias ls='ls --color=auto'
alias cp="rsync -ah --inplace --no-whole-file --info=progress2"
# PS1='[\u@\h \W]\$ '

# pywal color scheme
(cat ~/.cache/wal/sequences &)

export VISUAL="nvim"
export EDITOR="$VISUAL"

export TERM=screen-256color

export PATH=$PATH":$HOME/bin"

export QT_QPA_PLATFORMTHEME=qt5ct

alias cat=bat
