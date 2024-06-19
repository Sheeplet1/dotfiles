return {
  ensure_installed = {
    -- Go
    'gofumpt',
    'goimports',
    'golines',
    'gopls',

    'lua-language-server',
    'stylua',

    -- Python
    'pyright',
    'debugpy',
    'mypy',
    'ruff',
    'black',
    'isort',

    -- Formatters
    'prettier',
    'prettierd',

    -- Frontend
    'typescript-language-server',
    'tailwindcss-language-server',
    'css-lsp',
    'html-lsp',
    'eslint-lsp',

    -- Bash
    'shfmt',
    'bash-language-server',

    -- C++
    'clangd',
    'clang-format',
    'codelldb',
  },
  ui = {
    border = 'rounded',
  },
}
