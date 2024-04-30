require "nvchad.options"

vim.opt.colorcolumn = "80"

-- relative numbers
vim.opt.relativenumber = true

-- sync clipboard between OS and neovim
vim.o.clipboard = "unnamedplus"

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- set terminal gui colors to true
vim.o.termguicolors = true

-- minimum number of screen lines to keep above and below the cursor
vim.o.scrolloff = 5

vim.o.tabstop = 2 -- TAB looks like 2 spaces
vim.o.expandtab = true -- use spaces instead of TABs
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB
vim.o.shiftwidth = 2 -- Number of spaces when indenting

------------------------------ Resizing NvimTree -------------------------------
function NvimTree_width_ratio(percentage)
  local ratio = percentage / 100
  local width = math.floor(vim.go.columns * ratio)
  return width
end

-- Resizes neotree dynamically
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local width = NvimTree_width_ratio(20)
    vim.cmd("tabdo NvimTreeResize " .. width)
  end,
})

---------------------------- Highlight yanked group ----------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})
