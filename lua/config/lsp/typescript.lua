local lsp = require("config.lsp")

require("typescript-tools").setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,

  settings = {
    expose_as_code_action = "all",
    tsserver_max_memory = 4096,

    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayFunctionLikeReturnTypeHints = true,
    },

    jsx_close_tag = {
      enable = true,
    },
  },
})
