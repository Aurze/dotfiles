#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cp="rsync -ah --inplace --no-whole-file --info=progress2"
PS1='[\u@\h \W]\$ '

# pywal color scheme
. "~/.cache/wal/colors.sh"

export VISUAL="nvim"
export EDITOR="$VISUAL"

export TERM=screen-256color

export PATH=$PATH":$HOME/bin"
