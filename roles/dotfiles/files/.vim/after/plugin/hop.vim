lua << EOF
require'hop'.setup({keys = 'arstdheio', term_seq_bias = 0.5 })
vim.api.nvim_set_keymap('n', '<leader><leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>l', "<cmd>lua require'hop'.hint_lines()<cr>", {})
EOF
