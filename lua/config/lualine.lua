local ll = require("lualine")

ll.setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = {left = '>>', right = '<<'},
  },
}
