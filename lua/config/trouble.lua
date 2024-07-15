local trouble = require("trouble")

trouble.setup({
    modes = {
    }
})

vim.keymap.set('n', '<leader>xx', function()
    trouble.toggle("diagnostics")
end, { desc = "[x] Toggle Diagnostics" })

vim.keymap.set('n', '<leader>xX', function()
    trouble.toggle({
        mode = "diagnostics",
        filter = { buf = 0, ft = 'lua' }
    })
end, { desc = "[X] Toggle Buffer Diagnostics" })

vim.keymap.set('n', '<leader>xs', function()
    trouble.toggle("symbols")
end, { desc = "Toggle Document [S]ymbols" })

vim.keymap.set('n', '<leader>xl', function()
    trouble.toggle({
        mode = "lsp",
        win = { type = "split", position = "right" },
    })
end, { desc = "Toggle [L]SP" })
