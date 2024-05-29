return {
  ------------------------------------ dap --------------------------------------
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
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
      require "configs.nvim-dap"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },

  ------------------------------ default plugins -------------------------------
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "debugpy",
        "mypy",
        "ruff",
        "black",
        "isort",

        -- Formatters
        "prettier",
        "prettierd",

        -- Lua
        "lua-language-server",
        "stylua",

        -- Frontend
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
        "go-debug-adapter",
        "gomodifytags",
        "gotests",

        -- Bash
        "shfmt",
        "bash-language-server",

        -- C++
        "clangd",
        "clang-format",
        "codelldb",
      },
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "regex",

        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

        "json",
        "markdown",
        "markdown_inline",

        "go",
        "rust",
        "cpp",
      },
    },
  },

  --------------------------------- my plugins ---------------------------------
  -- expand on comment functionality
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- surround text object functionality
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
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
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- sync vim keybinds with tmux panels
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },

  -- distraction-free coding
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "configs.zen-mode"
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
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
  },

  -- quick file switching w/ marks
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- pretty ui for code-actions mainly
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  -- edit file system in a buffer
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    cmd = "Oil",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- undo tree
  {
    "debugloop/telescope-undo.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "undo"
    end,
  },

  -- noice ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "neovim/nvim-lspconfig", "rcarriga/nvim-notify" },
    config = function()
      require "configs.noice"
    end,
    init = function()
      vim.g.lsp_handlers_enabled = false
    end,
  },

  ----------------------------------- rust -----------------------------------
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    config = function()
      require "configs.rustaceanvim"
    end,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    tag = "stable",
    config = function()
      require("crates").setup()
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
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  ---------------------------------- frontend ----------------------------------
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
