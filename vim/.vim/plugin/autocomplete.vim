"enable neocomplete
let g:neocomplete#enable_at_startup = 1

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = $HOME . '/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [
      \ $HOME . '/.vim/ultisnips',
      \ $HOME . '/.vim/ultisnips-private'
      \ ]


" some hack for YCM and ultisnips work together: https://github.com/Valloric/YouCompleteMe/issues/36
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger = '<c-a>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:SuperTabDefaultCompletionType = '<C-n>'


let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

let g:ycm_rust_src_path = '/home/kinou/workspace/others/rustc-1.8.0/src'
let g:ycm_filetype_blacklist = {'xml': 1}
let g:ycm_show_diagnostics_ui = 1

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
"

let python_highlight_all=1

" disable some complete on SQL file
let g:omni_sql_no_default_maps = 1

" configure tags - add additional tags here or comment out not-used ones
set complete-=i
source ~/.vim/tags/tags.vim
