local lsp = require('config.lsp')

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  clangd = {
    cmd = { "clangd", "--compile-commands-dir=." },
  },
  bashls = {},
  texlab = {},
  ruff = {},
  pyright = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  bacon_ls = {
    init_options = {
      updateOnSave = true,
      updateOnSaveWaitMillis = 1000,
    }
  },
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

for _, server_name in ipairs(vim.tbl_keys(servers)) do
  vim.lsp.config(server_name, {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    settings = servers[server_name],
    filetypes = (servers[server_name] or {}).filetypes,
  })
end
