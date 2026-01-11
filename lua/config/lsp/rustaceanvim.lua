local lsp = require("config.lsp")

-- Tell Rustaceanvim to reuse your LSP on_attach and capabilities
vim.g.rustaceanvim = {
  server = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
  },
}
