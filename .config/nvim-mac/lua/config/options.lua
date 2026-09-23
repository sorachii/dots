local opt = vim.opt

-- UI
opt.number = true
-- opt.relativenumber = true
opt.signcolumn = "yes"       -- avoid text shift when diagnostics appear
opt.cursorline = true
opt.termguicolors = true     -- 24-bit color (needed by modern colorschemes)
opt.scrolloff = 8
opt.wrap = false
opt.splitright = true
opt.splitbelow = true

-- Indentation (2-space soft tabs; adjust per-language via ftplugin if needed)
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true          -- case-sensitive when query has uppercase
opt.hlsearch = true
opt.incsearch = true

-- Files / undo
opt.swapfile = false
opt.backup = false
opt.undofile = true           -- persistent undo across sessions
opt.updatetime = 250          -- faster CursorHold / diagnostics
opt.timeoutlen = 400

-- Editing
-- opt.clipboard = "unnamedplus" -- system clipboard
-- opt.mouse = "a"
opt.completeopt = "menu,menuone,noselect"

-- Whitespace visibility
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
