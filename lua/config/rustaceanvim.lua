vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    enable = false,
                },
                diagnostics = {
                    enable = false,
                },
                check = {
                    targets={"x86_64-unknown-linux-gnu", "thumbv6m-none-eabi"},
                    workspace = true,
                },
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            "server",
                        },
                    },
                },
                cachePriming = {
                    enable = false,
                },
                cargo = {
                    targetDir = true,
                },
            },
        },
    },
}
