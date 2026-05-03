# common aliases for efficient workflow

alias ll="ls -lrtha --color=auto"

alias tmux-cs="sed -n '/# ===.*TMUX CHEATSHEET/,/^# ===/p' ~/.tmux.conf"

alias watchtty="watch -d -n 1 'ps -f --forest --tty $1'"

alias getdotfiles="git -C $DOTFILES_DIR pull --rebase"
