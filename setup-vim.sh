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
git clone --depth 1 https://github.com/vim-airline/vim-airline vim-folder/bundle/vim-airline
git clone --depth 1 https://github.com/vim-airline/vim-airline-themes vim-folder/bundle/vim-airline-themes
git clone --depth 1 https://tpope.io/vim/fugitive.git vim-folder/bundle/vim-fugitive
git clone --depth 1 https://github.com/codota/tabnine-vim vim-folder/bundle/tabnine-vim
git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git vim-folder/bundle/vim-nerdtree-tabs
git clone --depth 1 https://github.com/preservim/nerdtree.git vim-folder/bundle/nerdtree
git clone --depth 1 https://github.com/vim-syntastic/syntastic.git vim-folder/bundle/syntastic
git clone --depth 1 add https://github.com/flazz/vim-colorschemes.git vim-folder/bundle/colorschemes
git clone --depth 1 https://github.com/sheerun/vim-polyglot vim-folder/bundle/vim-polyglot
git clone --depth 1 git@github.com:rking/ag.vim.git vim-folder/bundle/ag-vim
git clone --depth 1 https://github.com/airblade/vim-gitgutter.git vim-folder/bundle/vim-gitgutter
git clone --depth 1 https://tpope.io/vim/surround.git vim-folder/bundle/vim-surround


# lol for colors
cp vim-folder/bundle/colorschemes/colors/* vim-folder/colors



ln -s $PWD/vimrc ~/.vimrc

ln -s $PWD/vim-folder ~/.vim


echo 'setup complete. Please make sure that the location of this repo doesnt get changed. We soft-symlinked ~/.vimrc and ~/.vim to here'
