" Normal mode mappings.

" Toggle fold at current position.
"nnoremap <Tab> za

" Avoid unintentional switches to Ex mode.
nnoremap Q <nop>

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Repurpose cursor keys (accessible near homerow via "SpaceFN" layout) for one
" of my most oft-use key sequences.
"nnoremap <silent> <Up> :cprevious<CR>
"nnoremap <silent> <Down> :cnext<CR>
"nnoremap <silent> <Left> :cpfile<CR>
"nnoremap <silent> <Right> :cnfile<CR>
"
"nnoremap <silent> <S-Up> :lprevious<CR>
"nnoremap <silent> <S-Down> :lnext<CR>
"nnoremap <silent> <S-Left> :lpfile<CR>
"nnoremap <silent> <S-Right> :lnfile<CR>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

"move between buffers
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

"on map page up et down pour des déplacement de demi page
map <PageDown> <C-d>
map <PageUp> <C-u>
