
" TSInstall ruby go toml lua json javascript dockerfile bash

if has('nvim-0.6')
    lua <<EOF

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "toml",
    "json",
    "yaml",
    "ruby",
    "go",
    "lua",
    "javascript",
    "dockerfile",
    "bash"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
endif

