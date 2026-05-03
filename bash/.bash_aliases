# common aliases for efficient workflow

alias ll="ls -lrtha"

alias watchtty="watch -d -n 1 'ps -f --forest --tty $1'"

alias getdotfiles="git -C $DOTFILES_DIR pull --rebase"
