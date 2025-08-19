-- Require cmp first
local cmp = require 'cmp'

cmp.setup {
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'buffer' }, -- 🔥 buffer words
    { name = 'path' }, -- 🔥 filesystem paths
    { name = 'nvim_lua' }, -- for Lua Neovim API completions
    { name = 'luasnip' },
  },
}
