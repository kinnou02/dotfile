set nocompatible
filetype off                   " required!
set encoding=utf-8

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
"Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoInstallBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'kshenoy/vim-signature'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-grammarous'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'wincent/loupe'
Plug 'wincent/terminus'
Plug 'farmergreg/vim-lastplace'
"Plug 'chriskempson/base16-vim' " not updated using a fork
Plug 'danielwe/base16-vim'
Plug 'wincent/pinnacle'
Plug 'Shougo/echodoc.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-startify'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-python
call plug#end()

"leader is space
let mapleader = "\<Space>"
let maplocalleader = "\\"

filetype plugin indent on     " required!

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour l'activation de l'explorateur
""système: NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :NERDTreeToggle<CR>


" .md is markdown file
"au BufNewFile,BufRead *.md set ft=markdown

