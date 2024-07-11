local home = os.getenv("HOME")
package.path = package.path .. ";"
    .. home .. "/.luarocks/share/lua/5.1/?.lua;"
    .. home .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.cpath = package.cpath .. ";"
    .. home .. "/.luarocks/lib/lua/5.1/?.so;"

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

