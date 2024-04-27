return {
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
        "pyright",
        "debugpy",
        "mypy",
        "ruff",
        "black",
        "isort",

        "prettier",
        "prettierd",

        "lua-language-server",
        "stylua",

        "typescript-language-server",
        "tailwindcss-language-server",
        "css-lsp",
        "html-lsp",
        "eslint-lsp",
        "js-debug-adapter",

        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
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

        "html",
        "css",
        "javascript",
        "typescript",

        "json",
        "markdown",
        "markdown_inline",

        "go",
        "rust",
      },
    },
  },

  --------------------------------- my plugins ---------------------------------
  -- expand on comment functionality
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- enhanced lsp experience
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "configs.lspsaga"
    end,
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
    build = "cd app && yarn install",
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

  -- shows function hints while typing
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup {}
    end,
  },

  -- pretty ui for code-actions mainly
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  -- undo tree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
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
}
