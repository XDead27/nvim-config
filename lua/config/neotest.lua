-- [[ Configure Neotest ]]

require("neotest").setup({
  adapters = {
  },
  vim.cmd("command Testt lua require('neotest').summary.toggle()"),
  vim.cmd("command Testrf lua require('neotest').run.run(vim.fn.expand('%'))"),
})

-- Configure Neotest keybinds
vim.keymap.set('n', '<leader>ts', require('neotest').summary.toggle, { desc = 'Toggle [T]est [S]ummary Window' })
vim.keymap.set('n', '<leader>to', function ()
  require('neotest').output.open({ enter = true })
end, { desc = 'Open [T]est [O]utput Window' })
vim.keymap.set('n', '<leader>tf', function ()
  require('neotest').run.run(vim.fn.expand('%'))
end, { desc = 'Run All [T]ests in [F]ile' })
vim.keymap.set('n', '<leader>tc', require('neotest').run.run, { desc = '[T]est Next to [C]ursor' })
vim.keymap.set('n', '<leader>tw', function ()
  require('neotest').watch.toggle(vim.fn.expand('%'))
end, { desc = '[W]atch Current File [T]ests' })


