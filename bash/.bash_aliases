# common aliases for efficient workflow

alias ll="ls -lrtha --color=auto"

alias tmux-cs="sed -n '/TMUX CHEATSHEET/,/# split panes/p' \$DOTFILES_DIR/tmux/.tmux.conf | sed '\$d'"

alias watchtty="watch -d -n 1 'ps -f --forest --tty $1'"

alias getdotfiles="git -C $DOTFILES_DIR pull --rebase"
