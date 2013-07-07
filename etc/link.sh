#!/bin/sh


rm ~/.vimrc
rm ~/.gvimrc
rm -rfi ~/.vim


ln -s ~/config/etc/vimrc ~/.vimrc
ln -s ~/config/etc/gvimrc ~/.gvimrc
ln -s ~/config/etc/vim/ ~/.vim

rm -rfi ~/.zsh
rm ~/.zshrc

ln -s ~/config/etc/zsh ~/.zsh
ln -s ~/config/etc/zshrc ~/.zshrc
ln -s ~/config/etc/Xdefaults ~/.Xdefaults

ln -s ~/config/bin ~/bin
