return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp") end
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "pyright", "clangd" },
                automatic_installation = true
            })
        end
    },
    {
        "nvim-lspconfig",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvimdev/lspsaga.nvim", -- 🧠 UI ENHANCEMENT
        }
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end
    }
}
