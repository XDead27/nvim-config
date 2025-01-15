local dap = require('dap')

-- Languages Configuration
--
-- Python
dap.adapters.python = function (cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- C / C++ / Rust
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c


-- Keybindings
--

vim.keymap.set({ 'n' }, '<leader>db', dap.toggle_breakpoint, { noremap = true, silent = true, buffer = 0, desc = '[T]oggle [B]reakpoint' })

vim.keymap.set({ 'n' }, '<leader>dc', dap.continue, { noremap = true, silent = true, buffer = 0, desc = '[C]ontinue' })
vim.keymap.set({ 'n' }, '<leader>ds', dap.step_over, { noremap = true, silent = true, buffer = 0, desc = '[S]tep Over' })
vim.keymap.set({ 'n' }, '<leader>dsi', dap.step_into, { noremap = true, silent = true, buffer = 0, desc = '[S]tep [I]nto' })
vim.keymap.set({ 'n' }, '<leader>dso', dap.step_out, { noremap = true, silent = true, buffer = 0, desc = '[S]tep [O]ut' })

vim.keymap.set({ 'n' }, '<leader>drl', dap.run_last, { noremap = true, silent = true, buffer = 0, desc = '[R]un [L]ast' })
vim.keymap.set({ 'n' }, '<leader>dro', dap.repl.open, { noremap = true, silent = true, buffer = 0, desc = '[R]epl [O]pen' })
