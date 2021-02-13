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

mkdir -p vim-folder/autoload vim-folder/bundle && \
	curl -LSso vim-folder/autoload/pathogen.vim https://tpo.pe/pathogen.vim


git clone --depth 1 https://github.com/vim-airline/vim-airline vim-folder/bundle/vim-airline
git clone --depth 1 https://tpope.io/vim/fugitive.git vim-folder/bundle/vim-fugitive
git clone --depth 1 https://github.com/codota/tabnine-vim vim-folder/bundle/tabnine-vim
git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git vim-folder/bundle/vim-nerdtree-tabs
git clone --depth 1 https://github.com/preservim/nerdtree.git vim-folder/bundle/nerdtree


ln -s $PWD/vimrc ~/.vimrc

ln -s $PWD/vim-folder ~/.vim


echo 'setup complete. Please make sure that the location of this repo doesnt get changed. We soft-symlinked ~/.vimrc and ~/.vim to here'
