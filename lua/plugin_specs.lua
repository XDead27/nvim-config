
require("nixCatsUtils").setup({
  non_nix_value = true,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        enabled = require('nixCatsUtils').lazyAdd(true, false),
        config = true
      },
      {
        'williamboman/mason-lspconfig.nvim',
        enabled = require('nixCatsUtils').lazyAdd(true, false),
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        enabled = require('nixCatsUtils').lazyAdd(true, false),
      },
      {
        'j-hui/fidget.nvim',
        opts = {}
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        config = function()
          require('config.lazydev')
        end,
      },
    },
    config = function()
      require("config.lsp.mason")
    end,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
    -- Uncomment whichever supported plugin(s) you use
      "nvim-tree/nvim-tree.lua",
    -- "nvim-neo-tree/neo-tree.nvim",
    -- "simonmclean/triptych.nvim"
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        name = "luasnip",
        build = require('nixCatsUtils').lazyAdd((function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)()),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require("config.nvim-cmp")
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("config.treesitter")
    end,
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    config = function ()
      require("config.which-key")
    end
  },

  -- Show git change (change, delete, add) signs in vim sign column
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.gitsigns")
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require("config.nvim-tree")
    end
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("config.lualine")
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  { 'numToStr/Comment.nvim', name = "comment.nvim", opts = {} },

  {
    "nvim-telescope/telescope.nvim",
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = require('nixCatsUtils').lazyAdd 'make',
        cond = require('nixCatsUtils').lazyAdd(function()
          return vim.fn.executable 'make' == 1
        end),
      },
    },
    config = function()
      require("config.telescope")
    end
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function ()
      require('config.lsplines')
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio"
    },
    config = function ()
      require("config.neotest")
    end
  },

  {
    "goolord/alpha-nvim",
    config = function ()
      require('config.alpha')
    end
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("config.refactoring")
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.todo-comments")
    end,
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  {
    'echasnovski/mini.diff',
    version = false,
    config = true,
  },

  {
    'uga-rosa/ccc.nvim',
  },

  -- Markdown plugins

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
      "lukas-reineke/headlines.nvim",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = true, -- or `opts = {}`
  },

  -- LaTeX plugins
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "mupdf"
    end
  },

  {
    'natecraddock/workspaces.nvim',
    config = function ()
      require('config.workspaces')
    end
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-w>h", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-w>j", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-w>k", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-w>l", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },

  -- DAP
  {
    'mfussenegger/nvim-dap',
    config = function ()
      require('config.dap')
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function ()
      require('config.dap-ui')
    end
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    config = function ()
      require('config.dap-virtual-text')
    end
  },

  -- Language specific plugins
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function ()
      require('crates').setup()
    end
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      require('config.rustaceanvim')
      require('config.lsp.rustaceanvim')
    end
  },

  {
    'mrcjkb/haskell-tools.nvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      require('config.lsp.haskell')
    end
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function ()
      require('config.lsp.typescript')
    end
  },

  -- {
  --   "ashinkarov/nvim-agda",
  --   dependencies = {
  --     'starwing/luautf8'
  --   },
  -- },

  -- AI plugins
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function ()
      require('config.copilot')
    end
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
      require('config.codecompanion')
    end
  },

  -- -- Collaboration
  -- {
  --   "azratul/live-share.nvim",
  --   dependencies = {
  --     "jbyuki/instant.nvim",
  --   },
  --   config = function()
  --     vim.g.instant_username = "mrxdead"
  --     require("live-share").setup({
  --      -- Add your configuration here
  --     })
  --   end
  -- },

  -- Colorschemes
  'danilo-augusto/vim-afterglow',
  -- 'jpo/vim-railscasts-theme',
  -- 'daschw/leaf.nvim',
  -- 'adigitoleo/vim-mellow',
  -- 'fcpg/vim-farout',
  -- "challenger-deep-theme/vim",
  "xero/miasma.nvim",
}

local function getlockfilepath()
  if require('nixCatsUtils').isNixCats and type(nixCats.settings.unwrappedCfgPath) == 'string' then
    return nixCats.settings.unwrappedCfgPath .. '/lazy-lock.json'
  else
    return vim.fn.stdpath 'config' .. '/lazy-lock.json'
  end
end

local lazy_opts = {
  lockfile = getlockfilepath(),
  ui = {
    title = "Plugin Manager",
    title_pos = "center",
  },
}

require('nixCatsUtils.lazyCat').setup(nixCats.pawsible { 'allPlugins', 'start', 'lazy.nvim' }, plugin_specs, lazy_opts)
