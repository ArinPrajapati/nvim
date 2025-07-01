return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- JavaScript/TypeScript/HTML/CSS/MD
        null_ls.builtins.formatting.prettierd,

        -- Python
        null_ls.builtins.formatting.black,

        -- C/C++
        null_ls.builtins.formatting.clang_format,

        -- Java
        null_ls.builtins.formatting.google_java_format.with({
          extra_args = { "--aosp" },  -- Optional
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}

