local api = require('java')
api.setup()
require('lspconfig').jdtls.setup({})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    -- Build workspace 
    vim.keymap.set("n", "<leader>xb", function()
      api.runner.build_workspace({})
    end, { desc = "[B]uild Workspace" })

    -- Running and stopping an application
    vim.keymap.set("n", "<leader>xx", function()
      api.runner.built_in.run_app({})
    end, { desc = "Run Main App" })

    vim.keymap.set("n", "<leader>xs", function()
      api.runner.built_in.stop_app({})
    end, { desc = "Stop Main App" })

    -- Toggle logs window 
    vim.keymap.set("n", "<leader>xl", function()
      api.runner.built_in.toggle_logs({})
    end, { desc = "Toggle Logs" })

    -- Change Java runtime 
    vim.keymap.set("n", "<leader>xj", function()
      api.settings.change_runtime({})
    end, { desc = "Change Java Runtime" })

    -- Debugging the current class
    vim.keymap.set("n", "<leader>td", function()
      api.test.debug_current_class({})
    end, { desc = "[D]ebug Current Class" })

    -- Test current class 
    vim.keymap.set("n", "<leader>tc", function()
      api.test.run_current_class({})
    end, { desc = "[T]est Current [C]lass" })

    -- View current test report 
    vim.keymap.set("n", "<leader>tr", function()
      api.test.view_last_report({})
    end, { desc = "[T]est [R]eport" })

    -- Refactor: Extract variable 
    vim.keymap.set({"n", "v"}, "<leader>rv", function()
      api.refactor.extract_variable({})
    end, { desc = "Extract [V]ariable" })

    -- Refactor: Extract variable for all occurances 
    vim.keymap.set({"n", "v"}, "<leader>ra", function()
      api.refactor.extract_variable_all_occurance({})
    end, { desc = "Extract Variable for [A]ll Occurances" })

    -- Refactor: Extract method 
    vim.keymap.set({"n", "v"}, "<leader>rm", function()
      api.refactor.extract_method({})
    end, { desc = "Extract [M]ethod" })

    -- Refactor: Extract constant 
    vim.keymap.set({"n", "v"}, "<leader>rc", function()
      api.refactor.extract_constant({})
    end, { desc = "Extract [C]onstant" })

    -- Refactor: Extract field 
    vim.keymap.set({"n", "v"}, "<leader>rf", function()
      api.refactor.extract_field({})
    end, { desc = "Extract [F]ield" })
  end,
})
