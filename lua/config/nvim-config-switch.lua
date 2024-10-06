local api = require('nvim-config-switch')

vim.keymap.set("n", "<Leader>gc", api.show_current_branch, { desc = "Show config current branch" })
vim.keymap.set("n", "<Leader>gs", api.switch_branch, { desc = "Switch config branch" })
