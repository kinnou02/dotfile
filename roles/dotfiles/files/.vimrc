set nocompatible
filetype off                   " required!
set encoding=utf-8

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

if has('nvim-0.6')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }
    Plug 'phaazon/hop.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
    Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
    Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}

    Plug 'dense-analysis/neural', {'branch': 'main'}
    Plug 'MunifTanjim/nui.nvim'
    Plug 'elpiloto/significant.nvim', {'branch': 'main'}

else
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-json', 'coc-rls', 'coc-snippets', 'coc-python', 'coc-yank', 'coc-tsserver']
    Plug 'Lokaltog/vim-easymotion'
endif

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
Plug 'vim-scripts/argtextobj.vim'
Plug 'kshenoy/vim-signature'
Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
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
Plug 'vimwiki/vimwiki'
Plug 'github/copilot.vim', {'branch': 'release'}

Plug 'w0rp/ale'

Plug 'arcticicestudio/nord-vim', {'branch': 'main'}
call plug#end()


let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'custom_wiki2html': 'vimwikimd2html.sh',
                      \ 'syntax': 'markdown', 
                      \ 'ext': '.mkdn'}]

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

