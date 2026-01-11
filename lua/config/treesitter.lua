-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
local treesitter = require('nvim-treesitter')

local langs = { 'c', 'cpp', 'lua', 'python', 'vimdoc', 'vim', 'bash', 'markdown', 'nix', 'rust', 'typescript', 'json', 'yaml' }

treesitter.setup()
treesitter.install(langs)

vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim (I don't like folds)
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
