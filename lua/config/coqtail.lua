
vim.api.nvim_create_autocmd("FileType", {
    pattern = "coq",
    callback = function()
        vim.cmd('inoremap \\not ¬')
        vim.cmd('inoremap \\and ∧')
        vim.cmd('inoremap \\or ∨')
        vim.cmd('inoremap \\imp →')
        vim.cmd('inoremap \\iff ↔')
        vim.cmd('inoremap \\bot ⊥')
        vim.cmd('inoremap \\top ⊤')

        -- command that inputs (FVar x) in insert mode for `x`
        vim.cmd('inoremap \\x (FVar \"x\")')
        vim.cmd('inoremap \\y (FVar \"y\")')
        vim.cmd('inoremap \\z (FVar \"z\")')
    end,
})
