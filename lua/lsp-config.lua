local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP servers with capabilities
for _, lsp in ipairs { 'clangd', 'pyright', 'ts_ls', 'tailwindcss' } do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
