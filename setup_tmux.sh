#!/usr/bin/env bash

if [ -e ~/.tmux.conf ]; then
	mv ~/.tmux.conf ~/.tmux.conf-old
fi


ln -s $PWD/tmux.conf ~/.tmux.conf
