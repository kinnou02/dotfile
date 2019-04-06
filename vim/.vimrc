set nocompatible
filetype off                   " required!
set encoding=utf-8

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/taglist.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --go-completer --rust-completer' }
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoInstallBinaries' }
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ajmwagar/vim-deus'
Plug 'vim-scripts/argtextobj.vim'
Plug 'kshenoy/vim-signature'
"Plug 'ambv/black'
Plug 'https://github.com/Shougo/neocomplete.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-grammarous'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'

call plug#end()
let g:neocomplete#enable_at_startup = 1

"leader is space
let mapleader = "\<Space>"

"some shorcut
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

filetype plugin indent on     " required!

" remap ; to : useful for us layout
map ; :
noremap ;; ;


" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

"gundo and undo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap <F5> :GundoToggle<CR>
" where to save undo histories
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
nnoremap <F5> :GundoToggle<CR>

"color scheme
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
let g:AirlineTheme='deus'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let rline_highlighting_cache = 1
let ttimeoutlen=10
"let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ["fugitiveline", "ycm", "branch"]

" switch entre .cpp et .h
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

set colorcolumn=113

" disable folding
let g:vim_markdown_folding_disabled = 1
set foldmethod=indent


"on map page up et down pour des déplacement de demi page
map <PageDown> <C-d>
map <PageUp> <C-u>

"Open new split panes to right and bottom, which feels more natural than Vim’s
"default
set splitbelow
set splitright
"We can use different key mappings for easy navigation between splits to save
"a keystroke. So instead of ctrl-w then j, it’s just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"match ErrorMsg '\%>120v.\+'

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
let python_highlight_all=1
if has("syntax")
  syntax on
endif

set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time


let g:Powerline_symbols = 'unicode'

nmap <C-e> :e#<CR>


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)
"autosave
set autowrite
set autoread
au FocusLost * silent! wa


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Activation de l'indentation automatique
set autoindent
set smartindent
set smarttab
set scrolloff=5

" Redefinition des tabulations
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start  " more powerful backspacing
set switchbuf=useopen,split

" Ajout de la numérotation des lignes
set number
set relativenumber
highlight LineNr ctermbg=black ctermfg=gray

""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour l'activation de l'explorateur
""système: NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :NERDTreeToggle<CR>

set laststatus=2   " Always show the statusline

" Move Backup Files to ~/.vim/sessions
" set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Turn off annoying swapfiles
set noswapfile


" Ajout d'une ligne colorée pour surligner la ligne en cours
set cursorline
highlight CursorLine term=reverse cterm=reverse

" Amélioration de la lisibilité des noms des onglets
highlight TabLine term=none cterm=none
highlight TabLineSel ctermbg=darkblue

"completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml set omnifunc=xmlcomplete#CompletePHP


" configure tags - add additional tags here or comment out not-used ones
set complete-=i
source ~/.vim/tags/tags.vim
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :!ctags -R .<CR>


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_SelectFirstItem = 1
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping et configuration pour la liste des tags
"  """"""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1       " vim se ferme si il reste uniquement la fenêtre des tags
let Tlist_Process_File_Always = 1   " activation permanente du plugin pour la barre de statut
let Tlist_Use_Right_Window = 1      " affiche les tags sur le côté droit de l'écran

" caractére a afficher pour les caractére invisible
" s'active avec set list
"set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶,trail:·
set listchars=tab:▸\ ,trail:·
set list

" ouvre un tag da   ns un nouvel onglet 
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"
" " Suffixes that get lower priority when doing tab completion for filenames.
" " These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png

" supppression des mapping foireux dans les fichier sql
let g:omni_sql_no_default_maps = 1

set wildmenu
set wildignore+=.git,.hg,.svn
set wildignore+=*/venv/*,*/tmp/*,*/vendor/*,*/third_party/*
set wildignore+=*.pdf,*.png,*.jpg,*.jpeg,*.o,*.so,*.a,
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.zip,*tar.gz,*.tar.bz2,*.tar.xz,*rar

" some hack for YCM and ultisnips work together: https://github.com/Valloric/YouCompleteMe/issues/36
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger = '<c-a>'

let g:ycm_rust_src_path = '/home/kinou/workspace/others/rustc-1.8.0/src'
let g:ycm_filetype_blacklist = {'xml': 1}
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" .pas is delphi file
au BufNewFile,BufRead *.pas,*.PAS set ft=delphi
" .md is markdown file
au BufNewFile,BufRead *.md set ft=markdown

"syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 1
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args" 

let g:syntastic_rust_checkers = ['rustc'] "disable cargo as it cause freeze in vim

"FZF


noremap <leader>f :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>t :Tags<CR>
noremap <leader>l :BTags<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"ALE
let g:ale_python_pylint_options = '--disable C'

let g:projectionist_heuristics = {
\   '*': {
\      '*.cpp': {
\           'alternate': '{}.h',
\           'type': 'source'
\       },
\      'tests/*_test.cpp': {
\           'alternate': ['{}.cpp', '{}.h'],
\           'type': 'test'
\       },
\      '*.c': {
\           'alternate': '{}.h',
\           'type': 'source'
\       },
\       '*.h': {
\           'alternate': ['{}.cpp', '{}.c'],
\           'type': 'header'
\       }
\   }
\}

runtime! macros/matchit.vim
