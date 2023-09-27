-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { 'tpope/vim-surround' }
	use { 'tpope/vim-rsi' }
	use { 'tpope/vim-fugitive' }
	use { 'tpope/vim-repeat' }
	use { 'tpope/vim-commentary' }
	use { 'mhinz/vim-signify' }
	use { 'ludovicchabant/vim-gutentags' }
	use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
	use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
	use { 'nvim-treesitter/playground' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,}

	use { 'justinmk/vim-dirvish' }
	-- use 'lewis6991/gitsigns.nvim'
	-- use 'sheerun/vim-polyglot'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{'rafamadriz/friendly-snippets'},
		}
	}

	-- use { 'mfussenegger/nvim-jdtls'}
	use { 'mhinz/vim-startify' }

	-- use { 'ggandor/lightspeed.nvim' }
	use { 'ggandor/leap.nvim' }

	-- Markdown plugins
	-- use { 'godlygeek/tabular' }
	-- use 'plasticboy/vim-markdown' -- buggy

	use {'folke/which-key.nvim', config = function()
		require("which-key").setup{ }
	end }

	-- Aesthetic
	use { 'mcchrish/zenbones.nvim', requires='rktjmp/lush.nvim' }
	use { 'EdenEast/nightfox.nvim' }
	use ({ 'romainl/flattened',
		config = function()
		vim.cmd('colorscheme flattened_light')
	end })
	use { 'ellisonleao/gruvbox.nvim' }
	use { 'projekt0n/github-nvim-theme' }
	use { 'shaunsingh/seoul256.nvim' }
	use { 'Shatur/neovim-ayu' }
	use { 'sainnhe/sonokai' }
	use { 'nyoom-engineering/oxocarbon.nvim' }
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use { 'folke/tokyonight.nvim' }
	use { 'rebelot/kanagawa.nvim' }
	use { 'eddyekofo94/gruvbox-flat.nvim' }
	-- use ({'junegunn/seoul256.vim', config = function()
	--         vim.g.seoul256_background=256
	--         vim.cmd('colorscheme seoul256')
	-- end })
	use { 'jacoborus/tender.vim' }
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		tag = 'v1.*',
		-- config = function()
		--     vim.cmd('colorscheme rose-pine-dawn')
		-- end
	})

	use ({'sainnhe/gruvbox-material',
		config = function()
		vim.cmd('colorscheme gruvbox-material')
	end })

	use { 'ryanoasis/vim-devicons' }
	use ({'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'},
	config = function()
		require('lualine').setup({
			options = {
				theme = 'solarized_light'
			}
		})
	end})
end)
