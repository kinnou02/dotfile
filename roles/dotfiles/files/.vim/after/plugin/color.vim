function s:RemoveBg(group)
    let l:highlight=filter(pinnacle#dump(a:group), 'v:key != "bg"')
    execute 'highlight! clear ' . a:group
    execute 'highlight! ' . a:group . ' ' . pinnacle#highlight(l:highlight)
endfunction

function s:CheckColorScheme()
  if !has('termguicolors')
    let g:base16colorspace=256
  endif
  if $TERM == 'rxvt-unicode-256color'
    let g:base16colorspace=256
  endif
  set background=dark
  color nord

  execute 'highlight Comment ' . pinnacle#italicize('Comment')

  " Sync with corresponding non-nvim 'highlight' settings in
  " ~/.vim/plugin/settings.vim:
  highlight clear NonText
  highlight link NonText Conceal

  highlight clear CursorLineNr
  execute 'highlight CursorLineNr ' . pinnacle#extract_highlight('DiffText')

  highlight clear DiffDelete
  highlight link DiffDelete Conceal
  highlight clear VertSplit
  highlight link VertSplit LineNr

  " Resolve clashes with ColorColumn.
  " Instead of linking to Normal (which has a higher priority, link to nothing).
  highlight link vimUserFunc NONE
  highlight link NERDTreeFile NONE

  " For Git commits, suppress the background of these groups:
  " for l:group in ['DiffAdded', 'DiffFile', 'DiffNewFile', 'DiffLine', 'DiffRemoved']
    " call s:RemoveBg(l:group)
  "endfor

  "" More subtle highlighting during merge conflict resolution.
  "highlight clear DiffAdd
  "highlight clear DiffChange
  "highlight clear DiffText

  let l:highlight=pinnacle#italicize('ModeMsg')
  execute 'highlight User8 ' . l:highlight

  " Allow for overrides:
  " - `statusline.vim` will re-set User1, User2 etc.
  " - `after/plugin/loupe.vim` will override Search.
  doautocmd ColorScheme
endfunction

if v:progname !=# 'vi'
  if has('autocmd')
    augroup WincentAutocolor
      autocmd!
      autocmd FocusGained * call s:CheckColorScheme()
    augroup END
  endif

  call s:CheckColorScheme()
endif
