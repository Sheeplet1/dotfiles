return {
  ensure_installed = {
    'vim',
    'vimdoc',
    'lua',
    'regex',

    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',

    'json',
    'markdown',
    'markdown_inline',

    'go',
    'rust',
    'cpp',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { 'html', 'xml' },
  },
}
