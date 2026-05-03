# common aliases for efficient workflow

alias ll="ls -lrtha --color=auto"

alias tmux-cs="awk '/TMUX CHEATSHEET/{found=1; next} found{if(/^# =/) exit; print}' ~/.tmux.conf"

alias watchtty="watch -d -n 1 'ps -f --forest --tty $1'"

alias getdotfiles="git -C $DOTFILES_DIR pull --rebase"
