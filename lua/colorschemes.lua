-- [[ Configuration Colorschemes ]]

local utils = require("utils")

local colorscheme_conf = {
    mellow = function ()
        vim.g.mellow_user_colors = 0
        vim.cmd([[augroup italic_comments
          autocmd!
          autocmd ColorScheme mellow hi Comment gui=italic
          autocmd ColorScheme mellow hi EndOfBuffer guibg=None
        augroup END]])
        vim.cmd('colorscheme mellow')
    end
}

local filename = "nvim.properties"
local properties, err = utils.loadProperties(filename)
if not properties then
    print("Error:", err)
else
    -- Load colorscheme 
    colorscheme_conf[properties["colorscheme"]]()
end
