local wk = require('which-key')

wk.add({
  mode = { "n" },
  { "<leader>ca", function () vim.cmd.RustLsp('codeAction') end, desc = "[C]ode [A]ction" },
  { "K", function () vim.cmd.RustLsp({ "hover", "actions" }) end, desc = "Hover Documentation" },
  { "<leader>xx", function () vim.cmd.RustLsp('run') end, desc = "E[x]ecute" },
  { "<leader>xr", function () vim.cmd.RustLsp('runnables') end, desc = "E[x]ecute [R]unnables" },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust' },
  callback = function() vim.treesitter.start() end,
})
