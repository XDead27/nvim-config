-- [[ Configure nvim-tree ]]

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = on_attach,
})

vim.keymap.set('n', '<leader>ff', require("nvim-tree.api").tree.toggle, { desc = "Toggle [F]ile Explorer" })
vim.keymap.set('n', '<leader>fc', require("nvim-tree.api").tree.close, { desc = "[C]pen [F]ile Explorer" })
vim.keymap.set('n', '<leader>fo', require("nvim-tree.api").tree.open, { desc = "[O]pen [F]ile Explorer" })
