
vim.loader.enable()

local lua_conf_files = {
  "globals.lua",
  "options.lua",
  "autocommands.lua",
  "mappings.lua",
  "plugin_specs.lua",
  "colorschemes.lua",
}

for _, file_name in ipairs(lua_conf_files) do
  local module_name, _ = string.gsub(file_name, "%.lua", "")
  package.loaded[module_name] = nil
  require(module_name)
end

-- vim: ts=2 sts=2 sw=2 et
