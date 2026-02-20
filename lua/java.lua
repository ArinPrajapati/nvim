local jdtls = require 'jdtls'

local home = os.getenv 'HOME'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

local config = {
  cmd = { 'jdtls', '-data', workspace_dir },

  root_dir = jdtls.setup.find_root {
    '.git',
    'pom.xml',
    'build.gradle',
    'mvnw',
    'gradlew',
  },

  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

jdtls.start_or_attach(config)
