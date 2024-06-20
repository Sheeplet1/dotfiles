local cmp = require 'cmp'
local lspkind = require 'lspkind'
local tailwindcss_colorizer_cmp = require 'tailwindcss-colorizer-cmp'

local cmp_ui = {
  icons = true,
  lspkind_text = true,
  style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
}
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { 'kind', 'abbr', 'menu' },
  atom_colored = { 'kind', 'abbr', 'menu' },
}

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { 'abbr', 'kind', 'menu' },
  --
  -- format = function(_, item)
  --   local icons = lspkind.presets.default -- or your custom icon set
  --   local icon = (cmp_ui.icons and icons[item.kind]) or ''
  --
  --   if cmp_style == 'atom' or cmp_style == 'atom_colored' then
  --     icon = ' ' .. icon .. ' '
  --     item.menu = cmp_ui.lspkind_text and '   (' .. item.kind .. ')' or ''
  --     item.kind = icon
  --   else
  --     icon = cmp_ui.lspkind_text and (' ' .. icon .. ' ') or icon
  --     item.kind = string.format('%s %s', icon, cmp_ui.lspkind_text and item.kind or '')
  --   end
  --
  --   return item
  -- end,

  format = function(entry, vim_item)
    local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
    local strings = vim.split(kind.kind, '%s', { trimempty = true })
    kind.kind = ' ' .. (strings[1] or '') .. ' '
    kind.menu = '    (' .. (strings[2] or '') .. ')'

    kind = tailwindcss_colorizer_cmp.formatter(entry, kind)

    return kind
  end,
}

local function border(hl_name)
  return {
    { '╭', hl_name },
    { '─', hl_name },
    { '╮', hl_name },
    { '│', hl_name },
    { '╯', hl_name },
    { '─', hl_name },
    { '╰', hl_name },
    { '│', hl_name },
  }
end

local options = {
  completion = {
    completeopt = 'menu,menuone',
  },

  window = {
    completion = {
      side_padding = (cmp_style ~= 'atom' and cmp_style ~= 'atom_colored') and 1 or 0,
      winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
      scrollbar = false,
    },
    documentation = {
      border = border 'CmpDocBorder',
      winhighlight = 'Normal:CmpDoc',
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,
  -- formatting = {
  --   format = lspkind.cmp_format {
  --     mode = 'symbol', -- show only symbol annotations
  --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  --     -- can also be a function to dynamically calculate max width such as
  --     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
  --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
  --     show_labelDetails = true, -- show labelDetails in menu. Disabled by default
  --
  --     -- The function below will be called before any actual modifications from lspkind
  --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
  --     before = function(entry, vim_item)
  --       return vim_item
  --     end,
  --   },
  -- },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'crates' },
  },
}

if cmp_style ~= 'atom' and cmp_style ~= 'atom_colored' then
  options.window.completion.border = border 'CmpBorder'
end

return options
