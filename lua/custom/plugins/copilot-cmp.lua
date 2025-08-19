return {
  'zbirenbaum/copilot-cmp',
  dependencies = 'copilot.lua',
  opts = {},
  config = function(_, opts)
    local copilot_cmp = require 'copilot_cmp'
    copilot_cmp.setup(opts)
    -- attach cmp source whenever copilot attaches
    -- fixes lazy-loading issues with the copilot cmp source
    local on_attach = function()
      copilot_cmp._on_insert_enter {}
    end

    if package.loaded['copilot'] then
      on_attach()
    else
      vim.api.nvim_create_autocmd('User', {
        pattern = 'CopilotAttached',
        callback = on_attach,
      })
    end
  end,
}

