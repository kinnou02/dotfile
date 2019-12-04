set t_Co=256
if has('termguicolors')
    if $TERM != 'rxvt-unicode-256color'
      "urxvt does like termguicolor, everything will be the same...
      set termguicolors
    endif
  " Don't need this in xterm-256color, but do need it inside tmux.
  " (See `:h xterm-true-color`.)
  if &term =~# 'tmux-256color' || &term =~# 'screen-256color'
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
  endif
endif

if !has('nvim')
  " Make S-Up etc work inside tmux.
  " See: https://superuser.com/a/402084/322531
  if &term =~# 'tmux-256color'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
  endif
endif

"color scheme
set background=dark " Setting dark mode
