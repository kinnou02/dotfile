" Leader mappings.

" <Leader><Leader> -- Open last buffer.
nmap <C-e> :e#<CR>

"nnoremap <Leader>q :quit<CR>

nnoremap <Leader>w :update<CR>
"nnoremap <Leader>x :xit<CR>

" <Leader>zz -- Zap trailing whitespace in the current buffer.
"
"        As this one is somewhat destructive and relatively close to the
"        oft-used <leader>a mapping, make this one a double key-stroke.
"nnoremap <silent> <Leader>zz :call wincent#mappings#leader#zap()<CR>
"
" research word under cursor with rg
nnoremap <Leader>r :Rg <C-R><C-W><CR>
nnoremap <Leader>T :Tags <C-R><C-W><CR>

