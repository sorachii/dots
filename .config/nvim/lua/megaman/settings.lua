vim.cmd("set background=light")

-- Tab expansion
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.mouse = nil
vim.o.scrolloff = 5
vim.o.wrap = false

--Make line numbers default
vim.wo.number = true

--Enable break indent
vim.o.breakindent = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 50

-- Pretty colors
vim.o.termguicolors = true

--Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Change preview window location
vim.g.splitbelow = true

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})

--Add map to change background between light and dark
vim.cmd[[nnoremap <expr><F3> &background == 'light' ? ':set bg=dark<cr>' : ':set bg=light<cr>']]

--Better quickfix naviggation remap
vim.api.nvim_set_keymap('n', '<c-j>', [[<cmd>cnext<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', [[<cmd>cprev<cr>]], { noremap = true, silent = true})--interferes with lsp's signature_help binding otherwise nice
vim.api.nvim_set_keymap('n', '<c-q>', [[<cmd>copen<cr>]], { noremap = true, silent = true})--should check if quickfix list is open, if so, ':q'

--Vim-zoom like tmux <prefix>z
vim.api.nvim_set_keymap('n', '<c-w>o', [[<cmd>tab split<cr>]], { noremap = true, silent = true})

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

vim.api.nvim_exec([[
  augroup jdtls_lsp
  autocmd!
  autocmd FileType java lua require'jdtls_setup'.setup()
augroup end
]], false)

-- Set buffer switching keymaps
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>bn<cr>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>bp<cr>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>TSHighlightCapturesUnderCursor<cr>', { noremap = true, silent = true})

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- -- Highlight on yank
-- vim.api.nvim_exec([[
--   augroup YankHighlight
--     autocmd!
--     autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300 })
--   augroup end
-- ]], false)
