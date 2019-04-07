if has('autocmd')
  function! s:WincentAutocmds()
    augroup WincentAutocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="

      " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
      autocmd VimEnter * autocmd WinEnter * let w:created=1
      autocmd VimEnter * let w:created=1

      " Disable paste mode on leaving insert mode.
      autocmd InsertLeave * set nopaste

      " Make current window more obvious by turning off/adjusting some features in non-current
      " windows.
      if exists('+winhighlight')
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * set winhighlight=
        autocmd FocusLost,WinLeave * set winhighlight=CursorLineNr:LineNr,EndOfBuffer:ColorColumn,IncSearch:ColorColumn,Normal:ColorColumn,NormalNC:ColorColumn,SignColumn:ColorColumn
        if exists('+colorcolumn')
          autocmd BufEnter,FocusGained,VimEnter,WinEnter * if wincent#autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
        endif
      elseif exists('+colorcolumn')
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * if wincent#autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
        autocmd FocusLost,WinLeave * if wincent#autocmds#should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
      endif
      autocmd InsertLeave,VimEnter,WinEnter * if wincent#autocmds#should_cursorline() | setlocal cursorline | endif
      autocmd InsertEnter,WinLeave * if wincent#autocmds#should_cursorline() | setlocal nocursorline | endif
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call wincent#autocmds#focus_window()
      autocmd FocusLost,WinLeave * call wincent#autocmds#blur_window()
    augroup END
  endfunction

  call s:WincentAutocmds()

  function! s:KinouAutocmds()
    augroup KinouAutocmds
      autocmd!

        " If doing a diff. Upon writing changes to file, automatically update the differences
        autocmd BufWritePost * if &diff == 1 | diffupdate | endif
        autocmd FocusLost * silent! wa
    augroup END
  endfunction

  call s:KinouAutocmds()

endif
