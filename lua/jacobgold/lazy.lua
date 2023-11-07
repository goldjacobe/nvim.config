local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"chrisgrieser/nvim-origami",
		event = "BufReadPost", -- later or on keypress would prevent saving folds
		opts = true,        -- needed even when using default config
	},
	{
		'goldjacobe/globalcolor',
		cond = not vim.g.vscode
	},
	{
		'gorbit99/codewindow.nvim',
		cond = not vim.g.vscode
	},
	{
		'toppair/reach.nvim',
		cond = not vim.g.vscode
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		cond = not vim.g.vscode
	},
	{
		'rmagatti/auto-session',
		cond = not vim.g.vscode
	},
	{
		"folke/twilight.nvim",
	},
	{
		"folke/zen-mode.nvim",
		cond = not vim.g.vscode
	},
	{
		'numToStr/Comment.nvim',
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cond = not vim.g.vscode
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cond = not vim.g.vscode
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		cond = not vim.g.vscode,
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
		cond = not vim.g.vscode
	},
	{
		'catgoose/telescope-helpgrep.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		cond = not vim.g.vscode
	},
	{
		'prettier/vim-prettier',
		cond = not vim.g.vscode
	},
	{
		'rose-pine/neovim',
		cond = not vim.g.vscode
	},
	{
		"catppuccin/nvim",
		cond = not vim.g.vscode
	},
	{
		"ribru17/bamboo.nvim",
		cond = not vim.g.vscode
	},
	{
		"lewpoly/sherbet.nvim",
		cond = not vim.g.vscode
	},
	{
		'sainnhe/gruvbox-material',
		cond = not vim.g.vscode
	},
	{
		'Wansmer/treesj',
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cond = not vim.g.vscode
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cond = not vim.g.vscode
	},
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cond = not vim.g.vscode
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cond = not vim.g.vscode
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		cond = not vim.g.vscode
	},
	{
		'nvim-treesitter/playground',
		cond = not vim.g.vscode
	},
	{
		'alexghergh/nvim-tmux-navigation',
		cond = not vim.g.vscode
	},
	{
		'ThePrimeagen/harpoon',
		cond = not vim.g.vscode
	},
	{
		'ThePrimeagen/vim-be-good',
		cond = not vim.g.vscode
	},
	{
		'mbbill/undotree',
		cond = not vim.g.vscode
	},
	{
		'tpope/vim-fugitive',
		cond = not vim.g.vscode
	},
	{
		'tpope/vim-rhubarb',
		cond = not vim.g.vscode
	},
	'tpope/vim-surround',
	'andrewradev/undoquit.vim',
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		cond = not vim.g.vscode
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	},

	{
		'github/copilot.vim',
		cond = not vim.g.vscode
	}
})
