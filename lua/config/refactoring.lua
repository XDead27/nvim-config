local refactoring = require("refactoring")

refactoring.setup({})

vim.keymap.set("x", "<leader>re", function() refactoring.refactor('Extract Function') end, {desc = "[E]xtract Function"})
vim.keymap.set("x", "<leader>rf", function() refactoring.refactor('Extract Function To File') end, { desc = "Extract Function from [F]ile" })
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function() refactoring.refactor('Extract Variable') end, { desc = "Extract [V]ariable" })
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function() refactoring.refactor('Inline Function') end, { desc = "[I]nline Function" })
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function() refactoring.refactor('Inline Variable') end, { desc = "Inl[i]ne Variable" })
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function() refactoring.refactor('Extract Block') end, { desc = "Extract [B]lock" })
vim.keymap.set("n", "<leader>rbf", function() refactoring.refactor('Extract Block To File') end, { desc = "Extract [B]lock to [F]ile" })
-- Extract block supports only normal mode

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set(
	"n",
	"<leader>rp",
	function() require('refactoring').debug.printf({below = false}) end,
    { desc = "Debug [P]rintf" }
)

-- Print var

vim.keymap.set({"x", "n"}, "<leader>rv", function() require('refactoring').debug.print_var() end, { desc = "Debug Pring [V]ariable" })
-- Supports both visual and normal mode

vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end, { desc = "Debug [C]leanup" })
-- Supports only normal mode

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

vim.keymap.set(
	{"n", "x"},
	"<leader>rr",
	function() require('telescope').extensions.refactoring.refactors() end,
    { desc = "Choose [R]efactor" }
)
