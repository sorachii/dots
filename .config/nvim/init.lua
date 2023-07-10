--o
vim.cmd("set background=light")

-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true, commit='494fd59' }
  use { 'tpope/vim-surround', commit='bf3480d' }
  use { 'tpope/vim-rsi', commit='4c673fb' }
  use { 'tpope/vim-fugitive', commit='9a13fc8' }
  use { 'tpope/vim-repeat', commit='24afe92' }
  use { 'tpope/vim-commentary', commit='3654775' }
  use { 'mhinz/vim-signify', commit='69498f6' }
  use { 'ludovicchabant/vim-gutentags', commit='b77b8fa' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf', commit='8b62211' }
  use { 'nvim-telescope/telescope.nvim', commit='bb8db6e', requires = {{'nvim-lua/popup.nvim', commit='b7404d3'}, {'nvim-lua/plenary.nvim', commit='986ad71'}} }
  use { 'nvim-treesitter/playground', commit='ce7e4b7' }
  use { 'nvim-treesitter/nvim-treesitter', commit='47cfda2', branch = '0.5-compat', run = ':TSUpdate'}
  use { 'justinmk/vim-dirvish', commit='81b4087' }
  -- use 'lewis6991/gitsigns.nvim'
  -- use 'sheerun/vim-polyglot'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', commit='6a33ece' }

  use { 'neovim/nvim-lspconfig', commit='3479473' }

  -- for some reason coq keeps crashing nvim when I edit git commits and start the commit message with 'j'
  use { 'ms-jpq/coq_nvim', branch = 'coq', commit = '04d2da49'}
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts', commit = '9363cb4'}
  use { 'ms-jpq/coq.thirdparty', branch = '3p', commit = 'b8c984c' }

  use { 'mfussenegger/nvim-jdtls', commit='f35efb6'}
  use { 'nathom/filetype.nvim', commit='b522628' }
  use { 'mhinz/vim-startify', commit='81e36c3' }
  use { 'ggandor/lightspeed.nvim', commit='a4b4277' }

  -- Markdown plugins
  use { 'godlygeek/tabular', commit='339091a' }
  -- use 'plasticboy/vim-markdown' -- buggy

  use {'folke/which-key.nvim', commit='bd4411a', config = function()
    require("which-key").setup{ }
  end }

  use { 'lewis6991/impatient.nvim', commit='2aa872d', config = function()
    require('impatient')
  end }

  -- Aesthetic
  use { 'mcchrish/zenbones.nvim', commit='74d4440', requires='rktjmp/lush.nvim' }
  use { 'EdenEast/nightfox.nvim', commit='77aa745' }
  use ({ 'romainl/flattened', commit='0f3e0e4',
  	config = function()
  		vim.cmd('colorscheme flattened_light')
  	end })
  use { 'ellisonleao/gruvbox.nvim', commit='df149bc' }
  use { 'projekt0n/github-nvim-theme', commit='037f265' }
  use { 'shaunsingh/seoul256.nvim', commit='726f88a' }
  use { 'Shatur/neovim-ayu', commit='762ff24' }
  use { 'sainnhe/sonokai', commit='a9b2a3e' }
  use { 'nyoom-engineering/oxocarbon.nvim', commit='ee9182c' }
  use { 'catppuccin/nvim', as = 'catppuccin', commit='1d3eda1' }
  use { 'folke/tokyonight.nvim', commit='90b711c' }
  use { 'rebelot/kanagawa.nvim', commit='14a7524' }
  use { 'eddyekofo94/gruvbox-flat.nvim', commit='756dbdd' }
  -- use ({'junegunn/seoul256.vim', commit='8f3dd7d', config = function()
  --         vim.g.seoul256_background=256
  --         vim.cmd('colorscheme seoul256')
  -- end })
  use { 'jacoborus/tender.vim', commit='7746453' }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*',
    -- config = function()
    --     vim.cmd('colorscheme rose-pine-dawn')
    -- end
    })

  -- use ({'sainnhe/gruvbox-material',
	  -- config = function()
		-- vim.cmd('colorscheme gruvbox-material')
	  -- end
  -- })

  use { 'ryanoasis/vim-devicons', commit='a225865' }
  use ({'nvim-lualine/lualine.nvim', commit='8d956c1', requires = { 'kyazdani42/nvim-web-devicons', commit='2d02a56'},
	config = function()
		require('lualine').setup({
			options = {
				theme = 'solarized_light'
			}
		})
	end})
end)

-- Tab expansion
vim.bo.expandtab = true
vim.bo.tabstop = 4
-- vim.bo.softtabstop = 4

vim.o.mouse = nil
vim.o.scrolloff = 5
vim.o.wrap = false

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable break indent
vim.o.breakindent = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})

----Remap escape to leave terminal mode
--vim.api.nvim_exec([[
--  augroup Terminal
--    autocmd!
--    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
--    au TermOpen * set nonu
--  augroup end
--]], false)

--Add map to change background between light and dark
vim.cmd[[nnoremap <expr><F3> &background == 'light' ? ':set bg=dark<cr>' : ':set bg=light<cr>']]

----Map blankline
----TODO: remove or make it so the indentation is by changed background-color,
--     -- because when copying via tmux/mouse, those fuckin' lines interfere
--vim.g.indent_blankline_char = "┊"
--vim.g.indent_blankline_filetype_exclude = { 'help' }
--vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile', 'packer'}
--vim.g.indent_blankline_char_highlight = 'LineNr'

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<F5>', [[<cmd>lua require('telescope.builtin').highlights()<cr>]], { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files{ cwd = "~"}<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})

--Better quickfix naviggation remap 
vim.api.nvim_set_keymap('n', '<c-j>', [[<cmd>cnext<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', [[<cmd>cprev<cr>]], { noremap = true, silent = true})--interferes with lsp's signature_help binding otherwise nice
vim.api.nvim_set_keymap('n', '<c-q>', [[<cmd>copen<cr>]], { noremap = true, silent = true})--should check if quickfix list is open, if so, ':q'

--Vim-zoom like tmux <prefix>z
vim.api.nvim_set_keymap('n', '<c-w>o', [[<cmd>tab split<cr>]], { noremap = true, silent = true})

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300 })
  augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})
--
-- LSP settings
local nvim_lsp = require('lspconfig')
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Nvim LSP and COQ initialisation
local servers = { 'ansiblels', 'pyright', 'tsserver', 'bashls', 'gdscript' }
local coq = require "coq"
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach,
    }))
end

-- Start COQ completion
vim.cmd [[COQnow]]

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

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"
