if !has('nvim-0.6')
    noremap <leader>f :Files<CR>
    noremap <leader>b :Buffers<CR>
    noremap <leader>t :Tags<CR>
    noremap <leader>l :BTags<CR>
    noremap <leader>s :Snippets<CR>

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'

    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
                \ { 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }

    " in nvim use floating window for fzf
    if has('nvim-0.4')
        let $FZF_DEFAULT_OPTS='--layout=reverse'
        let g:fzf_layout = { 'window': 'call FloatingFZF()' }

        function! FloatingFZF()
            let buf = nvim_create_buf(v:false, v:true)
            call setbufvar(buf, '&signcolumn', 'no')

            let height = &lines - 3
            let width = float2nr(&columns - (&columns * 2 / 10))
            let col = float2nr((&columns - width) / 2)

            let opts = {
                        \ 'relative': 'editor',
                        \ 'row': 1,
                        \ 'col': col,
                        \ 'width': width,
                        \ 'height': height
                        \ }

            call nvim_open_win(buf, v:true, opts)
        endfunction
        autocmd! FileType fzf
        autocmd  FileType fzf set nonumber norelativenumber
    endif
endif
