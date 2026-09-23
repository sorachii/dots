local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered on jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste over selection without clobbering the yank register
map("x", "<leader>p", [["_dP]], { desc = "Paste (keep register)" })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- netrw: `-` opens netrw in the current file's directory (vim-vinegar style).
-- :Explore opens netrw at the dir of the current file (or cwd for an empty buf).
map("n", "-", "<cmd>Explore<CR>", { desc = "Open netrw (parent dir)" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "-", "<Plug>NetrwBrowseUpDir", {
      buffer = true,
      remap = true, -- required: NetrwBrowseUpDir is a <Plug> mapping
      desc = "netrw: up a directory",
    })
  end,
})
