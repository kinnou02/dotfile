set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
if exists('g:nyaovim_version')
    set mouse=a
endif
