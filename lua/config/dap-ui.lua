require('dapui').setup()

-- Keybinds
--

vim.keymap.set('n', '<leader>dui', require('dapui').toggle, { noremap = true, silent = true, buffer = 0, desc = 'Toggle [D]ebugger [UI]' })
-- vim.keymap.set('n', '<leader>dhh', require('dap.ui.variables').hover, { noremap = true, silent = true, buffer = 0, desc = 'Show [D]ebugger [H]over Information' })
-- vim.keymap.set('n', '<leader>dhv', require('dap.ui.variables').visual_hover, { noremap = true, silent = true, buffer = 0, desc = 'Show [D]ebugger [H]over Information' })
--
-- vim.keymap.set('n', '<leader>duh', require('dap.ui.widgets').hover, { noremap = true, silent = true, buffer = 0, desc = 'Show [D]ebugger [H]over Information' })
-- vim.keymap.set('n', '<leader>duf', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.scopes)
-- end, { noremap = true, silent = true, buffer = 0, desc = 'Show [D]ebugger [F]rames' })
