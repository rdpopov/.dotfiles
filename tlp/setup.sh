#!/bin/bash
[ -e "~/.config/tlp/tlp.conf" ] && mv /etc/tlp.conf /etc/tlp.conf_bak && mv ~/.config/tlp/tlp.conf /etc/tlp.conf_bak
