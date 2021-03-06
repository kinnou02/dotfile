" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')
" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

set nocompatible
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'sjl/gundo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'wincent/loupe'
Plug 'wincent/terminus'
Plug 'ajmwagar/vim-deus'
call plug#end()

filetype plugin indent on     " required!
"leader is space
let mapleader = "\<Space>"

" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

"nnoremap <F5> :GundoToggle<CR>
" where to save undo histories
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"color scheme
set background=dark

" switch entre .cpp et .h
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

set colorcolumn=113


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


"let g:Powerline_symbols = 'unicode'

nmap <C-e> :e#<CR>


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

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
"set autowrite      " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Activation de l'indentation automatique
set autoindent
set smartindent

" Redefinition des tabulations
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start  " more powerful backspacing

" Ajout de la numérotation des lignes
set number
highlight LineNr ctermbg=black ctermfg=gray

""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour l'activation de l'explorateur
""système: NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <F9> :NERDTree<CR>

set laststatus=2   " Always show the statusline

set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

let snippets_dir="$USER/.vim/snippets"

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
"source ~/.vim/tags/tags.vim
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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

"0 - don’t manage working directory.
"1 - the parent directory of the current file.
"2 - the nearest ancestor that contains one of these directories or files:
".git/ .hg/ .svn/ .bzr/ _darcs/
let g:ctrlp_working_path_mode = 2

set wildignore+=*/venv/*,*/tmp/*,*/vendor/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  'build$\|release$\|debug$\|\.git$\|^venv$\|build_package$',
  \  'file': '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])',
  \ }

let g:ctrlp_by_filename = 0
"ignore file from gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"When opening a file with <cr> or <c-t>, if the file’s already opened somewhere
"CtrlP will try to jump to it instead of opening a new instance: >
  let g:ctrlp_switch_buffer = 2
"  1 - only jump to the buffer if it’s opened in the current tab.
"  2 - jump tab as well if the buffer’s opened in another tab.
 " 0 - disable this feature.


"Use this to set your own root markers in addition to the default ones (.git/,
".hg/, .svn/, .bzr/, and _darcs/). Your markers will take precedence: >
"let g:ctrlp_root_markers = ['CMakeLists.txt']
 
"Set this to 0 if you don’t want CtrlP to scan for dotfiles and dotdirs: >
let g:ctrlp_dotfiles = 1

"Use this option to specify how the newly created file is to be opened when
"pressing <c-y>:
"  t - in a new tab
"  h - in a new horizontal split
"  v - in a new vertical split
"  r - in the current window
let g:ctrlp_open_new_file = 'r'


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
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 1
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args" 

