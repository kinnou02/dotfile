"enable neocomplete
let g:deoplete#enable_at_startup = 1


set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

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
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_SelectFirstItem = 1
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
"

let python_highlight_all=1

" disable some complete on SQL file
let g:omni_sql_no_default_maps = 1

" configure tags - add additional tags here or comment out not-used ones
set complete-=i "disable completion from included file
set complete-=t "disable completion from tags
source ~/.vim/tags/tags.vim

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3.6'

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'cpp': ['nice', 'clangd'],
    \ 'go': ['gopls'],
    \ }

" disable completion from tags
call deoplete#custom#source('tag', 'filetypes', [])
"disable complete from omnicomplete
call deoplete#custom#source('omni', 'filetypes', [])
"reduce rank of tag complete
call deoplete#custom#source('tag', 'rank', 9999)


function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        "nnoremap <buffer> <silent> jd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
        nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
        nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
        nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
    endif
endfunction

autocmd FileType * call LC_maps()
