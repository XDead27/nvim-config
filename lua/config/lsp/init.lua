local M = {}

local wk = require("which-key")

M.on_attach = function(client, bufnr)
  wk.add({
    mode = { "n" },
    buffer = bufnr,
    -- Groups
    { "<leader>c", group = "Code" },
    { "<leader>w", group = "Workspace" },

    -- Rename / actions
    { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },

    -- Navigation
    { "gd", require("telescope.builtin").lsp_definitions, desc = "Goto Definition" },
    { "gr", require("telescope.builtin").lsp_references, desc = "Goto References" },
    { "gI", require("telescope.builtin").lsp_implementations, desc = "Goto Implementation" },
    { "<leader>D", require("telescope.builtin").lsp_type_definitions, desc = "Type Definition" },

    -- Symbols
    { "<leader>cd", require("telescope.builtin").lsp_document_symbols, desc = "Document Symbols" },
    { "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "Workspace Symbols" },

    -- Docs
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature Help" },

    -- Workspace
    { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "Add Folder" },
    { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder" },
    {
      "<leader>wl",
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      desc = "List Folders",
    },

    -- Declaration
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  })
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

return M
