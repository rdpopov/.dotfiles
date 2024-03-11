#!/bin/bash

find -iname dotfiles_setup.sh|xargs -n 1 sh
find -iname setup.sh|xargs -n 1 sh
$(cd $HOME/.config/nvim && git pull origin master)
$(cd $HOME/.config/quoty && git pull origin master)
find -iname DEPS |xargs cat |sort|uniq|sed 's/\\n//g' | sudo xargs apt install -y
