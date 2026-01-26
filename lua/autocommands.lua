-- GLSL filetypes
local glsl_group = vim.api.nvim_create_augroup("glsl_files", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = glsl_group,
  pattern = { "*.vs", "*.gs", "*.fs", "*.vert", "*.frag" },
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})

-- Restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
