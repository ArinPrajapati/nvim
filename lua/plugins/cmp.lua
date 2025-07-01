
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "zbirenbaum/copilot-cmp",
     "onsails/lspkind.nvim",
    },
    config = function()
      require("copilot_cmp").setup() -- must run before cmp.setup()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
            formatting = {
            format = lspkind.cmp_format({
            mode = "symbol_text", -- show symbol + text
            maxwidth = 50,
            ellipsis_char = "…",
            }),
        },

        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        experimental = {
          ghost_text = true,
        },
      })
    end,
  },
}

