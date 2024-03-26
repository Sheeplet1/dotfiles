local plugins = {
  --------------------------------- nvim-dap ---------------------------------
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
      require("custom.configs.dap")
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },

  ----------------------------- default plugins ------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python --
        "pyright",
        "debugpy",
        "mypy",
        "ruff",
        "black",
        "isort",

        -- Formatting --
        "prettier",
        "prettierd",

        -- Lua Formatting --
        "lua-language-server",
        "stylua",

        -- WebDev --
        "typescript-language-server",
        "tailwindcss-language-server",
        "css-lsp",
        "html-lsp",
        "eslint-lsp",
        "js-debug-adapter",

        -- Go
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
      },
    },

    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      require("custom.configs.mason-lspconfig")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "html",
        "javascript",
        "css",
        "vim",
        "tsx",
        "typescript",
        "vue",
        "json",
        "lua",
        "rust",
        "markdown",
        "markdown_inline",
        "go",
      },
    },
    dependencies = {
      { "windwp/nvim-ts-autotag", opts = {} },
    },
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = "VeryLazy",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  ------------------------------ custom plugins ------------------------------

  -- lsp configuration
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    opts = function()
      return require("custom.configs.none-ls")
    end,
  },

  -- enhanced lsp experience
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          virtual_text = false,
        },
      })
    end,
  },

  -- expand comment functionality
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- open markdown in browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- sync vim keybinds with tmux panels
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- distraction-free coding
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("custom.configs.zen-mode")
    end,
  },

  -- ui for git commands
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("custom.configs.copilot")
    end,
  },

  -- quick file switching w/ marks
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
  },

  -- shows function hints while typing
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup({})
    end,
  },

  -- pretty ui for code-actions mainly
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  -- smooth scroll
  -- {
  --   "karb94/neoscroll.nvim",
  --   lazy = false,
  --   keys = { "<C-d>", "<C-u>" },
  --   config = function()
  --     require("custom.configs.neoscroll")
  --   end,
  -- },

  ----------------------------------- rust -----------------------------------
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    config = function()
      require("custom.configs.rustaceanvim")
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      require("cmp").setup.buffer({
        sources = { { name = "crates" } },
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  ------------------------------------ go ------------------------------------
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
  },
}

return plugins
