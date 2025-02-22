vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format { async = false }
                    end
                })
            end
        end,
        default_settings = {
            ['rust-analyzer'] = {
                diagnistics = {
                    enable = true,
                },
                check = {
                    targets={"x86_64-unknown-linux-gnu", "thumbv6m-none-eabi"},
                },
            },
        },
    },
}
