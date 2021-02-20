#!/usr/bin/env bash

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim-old
fi

if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc-old
fi


if [ -d vim-folder ]; then
	rm -rf vim-folder
fi
mkdir vim-folder
mkdir -p vim-folder/colors

mkdir -p vim-folder/autoload vim-folder/bundle && \
	curl -LSso vim-folder/autoload/pathogen.vim https://tpo.pe/pathogen.vim


# vim plugins (pathogen)
cat pathogen_bundles.txt | tr ' ' '\n' | uniq | xargs -P 3 -I % bash -c 'git clone --depth=1 % "vim-folder/bundle/$(basename %)"'


# lol for colors
cp vim-folder/bundle/vim-colorschemes.git/colors/* vim-folder/colors



ln -s $PWD/vimrc ~/.vimrc

ln -s $PWD/vim-folder ~/.vim


echo 'setup complete. Please make sure that the location of this repo doesnt get changed. We soft-symlinked ~/.vimrc and ~/.vim to here'
