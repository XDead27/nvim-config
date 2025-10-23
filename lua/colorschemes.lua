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
    end,

    challenger_deep = function ()
        vim.cmd('colorscheme challenger_deep')
    end,

    afterglow = function ()
        vim.g.afterglow_italic_comments = 1
        vim.g.afterglow_inherit_background = 0
        vim.cmd('colorscheme afterglow')
    end,

    leaf = function ()
        vim.cmd('colorscheme leaf')
    end,

    miasma = function ()
        vim.cmd('colorscheme miasma')
    end,
}

local filename = "nvim.properties"
local properties, err = utils.loadProperties(filename)
if not properties then
    print("Using default colorscheme.")
else
    -- Load colorscheme 
    colorscheme_conf[properties["colorscheme"]]()
    if properties["transparent"] == "true" then
        vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    end
end
