local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- List of servers
local servers = { "lua_ls", "ts_ls", "pyright", "clangd" }

-- Setup each LSP
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            -- ✅ Auto format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr, async = false })
                    end,
                })
            end

            -- 🧠 Keymaps
            local map = function(mode, keys, func, desc)
                vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
            end

            map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "[G]o to [D]efinition")
            map("n", "gr", "<cmd>Lspsaga finder<CR>", "[G]o to [R]eferences")
            map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "[G]o to [D]eclaration")
            map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]o to [I]mplementation")
            map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")
            map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]e[N]ame Symbol")
            map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ction")
            map("n", "<leader>ds", "<cmd>Lspsaga show_line_diagnostics<CR>", "[D]iagnostics [S]how")
            map("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", "[D]iagnostics [L]ist")
            map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", "[O]utline Tree")
        end,
    })
end

-- 🧠 Diagnostics icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
