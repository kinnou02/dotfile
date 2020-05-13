let rline_highlighting_cache = 1
let ttimeoutlen=10

let g:lightline = {
            \ 'colorscheme': 'nord',
            \ 'component': {
            \   'lineinfo': '⭡ %3l:%-2v',
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'fugitive': 'LightlineFugitive'
            \ },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }
set noshowmode
