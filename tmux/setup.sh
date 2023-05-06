#!/bin/bash
[ -e "$HOME/.tmux.conf" ] && mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
ln -s ~/.config/tmux/.tmux.conf $HOME/.tmux.conf
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://www.github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm #tmux package manager
