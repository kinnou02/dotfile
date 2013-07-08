#!/bin/sh


rm ~/.vimrc
rm ~/.gvimrc
rm -rfi ~/.vim


ln -s ~/dotfile/etc/vimrc ~/.vimrc
ln -s ~/dotfile/etc/gvimrc ~/.gvimrc
ln -s ~/dotfile/etc/vim/ ~/.vim

rm -rfi ~/.zsh
rm ~/.zshrc

ln -s ~/dotfile/etc/zsh ~/.zsh
ln -s ~/dotfile/etc/zshrc ~/.zshrc
ln -s ~/dotfile/etc/Xdefaults ~/.Xdefaults

ln -s ~/dotfile/bin ~/bin
