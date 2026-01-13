local lsp = require("config.lsp")

vim.g.haskell_tools = {
  hls = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
  },
}
