local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Change alpha banner based on window size
local width = vim.api.nvim_win_get_width(0)
if width < 100 then
    dashboard.section.header.val = {
      [[ _______             ____   ____.__         ]],
      [[ \      \   ____  ___\   \ /   /|__| _____  ]],
      [[ /   |   \_/ __ \/  _ \   Y   / |  |/     \ ]],
      [[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
      [[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
      [[        \/     \/                        \/ ]],
    }

    -- Set the vertical spacing between menu entries to 0
    dashboard.section.buttons.opts.spacing = 0

elseif width < 150 then
    dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
    }
else
    dashboard.section.header.val = {
        "                                                  ",
        "                                                  ",
        "                                   ░▒░            ",
        "                      ░░  ░░  ░  ▒▒▒░             ",
        "                  ░▒░ ▒▒▓▒▒ ░▒ ▒▒▒▒               ",
        "                 ░▓░▒▒   ▒░▒░░▒▒▒░                ",
        "                ░▓▒▓▓░    ▒▒▓▓▒▒ ░                ",
        "                ▓▓▓  ▓▒░▒▒▓▓▓▓▓▒▒░ ░              ",
        "               ▓▓▓▓▓▓▓ ░▓▓▓▓▓▓▓▓▓ ▒▒░▒            ",
        "         ▒     ▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ ▒          ",
        "       ░▓      ███████▓▓▓▓▓▓▓▓▓▓▓▓▒░░░▒▒ ▒        ",
        "       ▓▓      ███████▓▒▓▓▓▓▓▓▓▓▓▓▒░  ░▒▒░        ",
        "    ▓██▓░      ▓█████  ▓██▓▓▓▓▓▓▓▓▓     ▒▒░       ",
        " ░▓▒           ▒█████▓▓▓███▓▓▓▓▓▒ ▒░     ▒        ",
        "▒░              ▓██▓▒████████▓▓▓▓▒░ ▒▓▓ ░▓█       ",
        "                ░███▒░▓███████▓▓▓▓▓▓▒▒▓▒  █    ░  ",
        "                 ▓████████████▓▓▓▓▓▓▓▓▒ ▒███▓░░   ",
        "  ░▓███▓░         ▒███████████▓▓▓▓▓▓▓░░   █░   ░  ",
        "▒████████            ░▒▓█████▓▓▓▓▓▓░          ▒░  ",
        "▒░   ░▒▓█▒      ░              ░▒▒     ░░▒▒▒▒▒▒▒  ",
        "                 ▓██░░▒▓▓▓▓▓▓▓▓▓▒   ▒▓▓▓▓▓▓▓▒▒▒▒  ",
        "                  ▒▓▓██▓▓▓▓▒▓▓▒  ░▓▓▓▓▓▓▓▓▓▓▒▒▒▒  ",
        "                    ▒▓▓▓██▓▒   ▒▒▒▒▓▓▓▓▓▓▓▓▓▒▒▒   ",
        "                       ▒░ ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒    ",
    }
    -- Set time of day and number of plugins in the footer
    dashboard.section.footer.val = {
        "█ " .. os.date("%H:%M - %D") .. " █",
        "█    " .. #vim.fn.stdpath("data") .. " plugins    █"
    }
end


-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", " > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", " > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", " > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "w", " > Workspaces", ":Telescope workspaces<CR>"),
    dashboard.button( "s", " > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", " > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
