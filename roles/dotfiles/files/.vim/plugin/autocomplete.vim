set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = $HOME . '/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [
      \ $HOME . '/.vim/ultisnips',
      \ $HOME . '/.vim/ultisnips-private'
      \ ]


let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger = '<c-a>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

let python_highlight_all=1
" disable some complete on SQL file
let g:omni_sql_no_default_maps = 1

" configure tags - add additional tags here or comment out not-used ones
"set complete-=i "disable completion from included file
"set complete-=t "disable completion from tags
source ~/.vim/tags/tags.vim

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3.6'

nnoremap <silent> K :call <SID>show_documentation()<CR>
"nnoremap <buffer> <silent> jd :call LanguageClient#textDocument_definition()<CR>
nmap <leader>ld <Plug>(coc-definition)<CR>
nmap <leader>lr <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
