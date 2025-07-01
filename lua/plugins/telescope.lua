return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    -- Find files in current dir
    { "<leader>sf", function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.expand("%:p:h")
      })
    end, desc = "Find files in current dir" },

    -- Live grep (search word/char)
    { "<leader>sw", function()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.getcwd() -- root of project or current dir
      })
    end, desc = "Search word in dir" },
  },
  config = function()
    require("telescope").setup()
  end,
}

