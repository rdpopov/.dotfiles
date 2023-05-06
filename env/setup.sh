#!/bin/bash

grep -e "rosko_env" ~/.bashrc ||
echo '[[ -e ~/.config/env/ ]] && source $HOME/.config/env/rosko_env.sh  || echo "No environment file found"' >> ~/.bashrc
