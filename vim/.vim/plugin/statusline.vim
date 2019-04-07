let g:AirlineTheme='base16_default'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let rline_highlighting_cache = 1
let ttimeoutlen=10
"let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ["fugitiveline", "ycm", "branch"]
let g:Powerline_symbols = 'unicode'
set statusline+=%#warningmsg#
set statusline+=%*
