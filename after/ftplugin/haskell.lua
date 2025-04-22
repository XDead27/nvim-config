-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default

local wk = require('which-key')

wk.add({
  mode = { 'n' },
  { '<leader>cl', function() vim.lsp.codelens.run() end, desc = '[C]ode[L]ens Run' },
  { '<leader>cs', function() ht.hoogle.hoogle_signature() end, desc = 'Hoogle [S]ignature' },
  { '<leader>xa', function() ht.lsp.buf_eval_all() end, desc = 'Evaluate [A]ll' },
  { '<leader>xx', function() ht.repl.toggle() end, desc = 'Repl Run' },
  { '<leader>xf', function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end, desc = 'Repl [F]ile' },
  { '<leader>xq', function() ht.repl.quit() end, desc = 'Repl [Q]uit' },
})
