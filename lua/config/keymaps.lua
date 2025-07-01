local map = vim.keymap.set
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics", noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR><cmd>NvimTreeFocus<CR>", { desc = "Toggle + Focus File Tree" })
