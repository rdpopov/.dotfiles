#!/bin/bash

find -iname dotfiles_setup.sh|xargs -n 1 sh
find -iname setup.sh|xargs -n 1 sh
echo $(find -iname DEPS |xargs cat |sort|uniq|sed 's/\\n//g')
