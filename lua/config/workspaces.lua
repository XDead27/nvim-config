local workspaces = require('workspaces')
local telescope = require('telescope')

workspaces.setup({
    auto_open = true,
    hooks = {
        open = { "NvimTreeOpen", "Telescope find_files" },
    }
})

telescope.load_extension("workspaces")

vim.keymap.set("n", "<leader>sw", function()
    telescope.extensions.workspaces.workspaces()
end, { desc = "[S]earch [W]orkspace" })
