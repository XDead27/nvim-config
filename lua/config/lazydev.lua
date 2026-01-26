require("lazydev").setup({
  library = {
    { path = (nixCats.nixCatsPath or '') .. '/lua', words = { 'nixCats' } },
    -- plugins = {
    --   "nvim-dap-ui",
    --   "neotest",
    -- },
    -- types = true
  },
})
