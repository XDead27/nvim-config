local api = require('which-key')
api.setup({})

-- new api
-- add groups
api.add({
  {"<leader>c", group = "[C]ode"},
  {"<leader>d", group = "[D]ocument"},
  {"<leader>g", group = "[G]it"},
  {"<leader>h", group = "Git [H]unk"},
  {"<leader>r", group = "[R]efactor"},
  {"<leader>s", group = "[S]earch"},
  {"<leader>w", group = "[W]orkspace"},
  {"<leader>t", group = "[T]est"},
  {"<leader>f", group = "[F]iles"},
  {"<leader>x", group = "E[x]ecute"},
})

-- visual mode 
api.add({
  {
    mode = { "v" },
    { "<leader>", group = "VISUAL <leader>" },
    { "<leader>h", desc = "Git [H]unk" },
    { "<leader>r", desc = "[R]efactor" },
  },
})

