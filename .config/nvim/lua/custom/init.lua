vim.opt.colorcolumn = "80"
vim.wo.relativenumber = true

-- sync clipboard between OS and neovim
vim.o.clipboard = "unnamedplus"

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Set terminal gui colors to true
vim.o.termguicolors = true

-- resize nvimtree if window got resized
function NvimTree_width_ratio(percentage)
  local ratio = percentage / 100
  local width = math.floor(vim.go.columns * ratio)
  return width
end

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local width = NvimTree_width_ratio(20)
    vim.cmd("tabdo NvimTreeResize " .. width)
  end,
})

-- Highlight yanked group
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})
