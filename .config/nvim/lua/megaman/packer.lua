-- This file can be loaded by calling `lua require('plugins')` from yo ur init.vim

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
		end}


                use { 'https://codeberg.org/andyg/leap.nvim' }
                use { 'justinmk/vim-dirvish' }
                -- use 'lewis6991/gitsigns.nvim'
                -- use 'sheerun/vim-polyglot'
                use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- use { 'mfussenegger/nvim-jdtls'}
	use { 'arouene/vim-ansible-vault' }
	use { 'mhinz/vim-startify' }

	-- Markdown plugins
	-- use { 'godlygeek/tabular' }
	-- use 'plasticboy/vim-markdown' -- buggy

	use {'folke/which-key.nvim', config = function()
		require("which-key").setup{ }
	end }

	-- Aesthetic
	use ({ 'mcchrish/zenbones.nvim', requires='rktjmp/lush.nvim',
                config = function()
                vim.cmd('colorscheme forestbones')
            end })
	use { 'EdenEast/nightfox.nvim' }
	use ({ 'romainl/flattened'})
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

	-- use ({'sainnhe/gruvbox-material',
	-- 	config = function()
	-- 	vim.cmd('colorscheme gruvbox-material')
	-- end })

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
