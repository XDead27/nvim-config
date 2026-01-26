local lsp = require('config.lsp')

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

if require('nixCatsUtils').isNixCats then
  servers.nixd = {}
else
  servers.rnix = {}
  servers.nil_ls = {}
end



if require('nixCatsUtils').isNixCats then
  -- set up the servers to be loaded on the appropriate filetypes!
  for server_name, cfg in pairs(servers) do
    vim.lsp.config(server_name, cfg)
    vim.lsp.enable(server_name)
  end
else
  -- NOTE: nixCats: and if no nix, use mason

  -- Ensure the servers and tools above are installed
  --  To check the current status of installed tools and/or manually install
  --  other tools, you can run
  --    :Mason
  --
  --  You can press `g?` for help in this menu.
  require('mason').setup()

  -- You can add other tools here that you want Mason to install
  -- for you, so that they are available from within Neovim.
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    'stylua', -- Used to format Lua code
  })
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        vim.lsp.config(server_name, {
          settings = servers[server_name] or {}
        })
        vim.lsp.enable(server_name)
      end,
    },
  }
end

-- TODO: See if this works, improve with example from kickstart.nvim
vim.lsp.config('*', {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- for _, server_name in ipairs(vim.tbl_keys(servers)) do
--   vim.lsp.config(server_name, {
--     capabilities = lsp.capabilities,
--     on_attach = lsp.on_attach,
--     settings = servers[server_name],
--     filetypes = (servers[server_name] or {}).filetypes,
--   })
-- end
