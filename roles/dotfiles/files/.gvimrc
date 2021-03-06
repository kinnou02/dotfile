if has("gui_macvim")
    set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
    set guifont=Monaco:h9
    set guioptions-=T " remove toolbar
    set stal=2 " turn on tabs by default

elseif has("gui_gtk2")
    "set guifont=Monaco\ 8
    set guifont=Source\ Code\ Pro\ Regular\ 10
    set guioptions-=T " remove toolbar
elseif has("x11")
elseif has("gui_win32")
end

"colorscheme ir_black

" General
" *********************************************************************
set anti " Antialias font
"  
"  "set transparency=0
"   
"   " Default size of window
"   set columns=179
"   set lines=50
"    
"    " Tab headings
"    set gtl=%t gtt=%F
