return {
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
}
