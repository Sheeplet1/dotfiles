require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

----------------------------------- disabled -----------------------------------

map("n", "<leader>h", "")

--------------------------------- normal mode ----------------------------------

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>d", '<cmd> "_d', { desc = "Delete without yanking" })
map("n", "<leader>p", '<cmd> "_dp', { desc = "Replace without yanking" })

map("n", "n", "nzzzv", { desc = "Search terms stay centred" })
map("n", "N", "Nzzzv", { desc = "Search terms stay centred" })

map("n", "<C-d>", "<C-d>zz", { desc = "Centre screen while half page jumping" })
map("n", "<C-u>", "<C-u>zz", { desc = "Centre screen while half page jumping" })

map("n", "S-}", "<S-}>zzzv", { desc = "Move to next paragraph and center" })
map("n", "S-{", "<S-{>zzzv", { desc = "Move to previous paragraph and center" })

map("n", "<leader>y", '"+y', { desc = "Yank into system clipboard" })

map("n", "<leader>w", ":w<CR>", { desc = "Save File" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save file and quit" })
map("n", "<leader>q", ":q!<CR>", { desc = "Quit file without saving" })

--
map("n", "Y", "y$", { desc = "Yank till the end of the line" })
map("n", "D", "d$", { desc = "Delete till the end of the line" })
map("n", "C", "c$", { desc = "Change till the end of the line" })
map("n", "H", "0", { desc = "Go to the start of the line" })
map("n", "L", "$", { desc = "Go to the end of the line" })

-- comment headers and blocks
map(
  "n",
  "<leader>cb",
  ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.",
  { desc = "Create centered comment header block " }
)
map(
  "n",
  "<leader>cl",
  ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>",
  { desc = "Create centered comment header line" }
)

-- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue<CR>", { desc = "Run or continue the debugger" })

-- telescope undo tree
map("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Open undotree" })

--------------------------------- visual mode ----------------------------------

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected lines up" })
map("v", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
map("v", "<leader>d", '<cmd "_d', { desc = "Delete without yanking" })

--------------------------------- insert mode ----------------------------------

map("i", "jk", "<Esc>", { desc = "jk to escape" })
map("i", "kj", "<Esc>", { desc = "kj to escape" })

-------------------------------- tmux navigator --------------------------------

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate left tmux pane" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate down tmux pane" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate up tmux pane" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right tmux pane" })

----------------------------------- lazy git -----------------------------------

map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

----------------------------------- zen mode -----------------------------------

map("n", "<leader>zm", "<cmd>ZenMode<CR>", { desc = "ZenMode" })

------------------------------- markdown preview -------------------------------

map("n", "<leader>md", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })

--------------------------------- todotrouble ----------------------------------

map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { desc = "TodoTrouble" })

----------------------------------- harpoon ------------------------------------

local harpoon = require "harpoon"
harpoon:setup()

map("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Menu" })

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add to Harpoon" })

map("n", "<A-h>", function()
  harpoon:list():select(1)
end, { desc = "Open first Harpoon file" })

map("n", "<A-j>", function()
  harpoon:list():select(2)
end, { desc = "Open second Harpoon file" })

map("n", "<A-k>", function()
  harpoon:list():select(3)
end, { desc = "Open third Harpoon file" })

map("n", "<A-l>", function()
  harpoon:list():select(4)
end, { desc = "Open fourth Harpoon file" })

map("n", "<leader>hn", function()
  harpoon:list():next()
end, { desc = "Go to next Harpoon file" })

map("n", "<leader>hN", function()
  harpoon:list():prev()
end, { desc = "Go to prev Harpoon file" })

----------------------------------- undotree -----------------------------------

map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })

---------------------------------- telescope -----------------------------------

-- map("n", "<C-n>", ":Telescope file_browser<CR>", { desc = "Telescope File Browser" })
-- map("n", "<leader>fb", ":Telescope file_browser<CR>", { desc = "Telescope File Browser" })

------------------------------------- oil --------------------------------------

map("n", "<C-n>", "<cmd>Oil --float<CR>", { desc = "Open Oil" })
