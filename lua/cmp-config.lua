local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources {
    { name = 'copilot', group_index = 2 },
    { name = 'nvim_lsp', group_index = 1 },
    { name = 'luasnip', group_index = 1 },
    { name = 'buffer', group_index = 1 },
    { name = 'path', group_index = 1 },
  },
}
