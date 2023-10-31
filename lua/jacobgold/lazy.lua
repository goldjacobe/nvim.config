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
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
	{
		'rmagatti/auto-session',
	},
	{
		"folke/zen-mode.nvim",
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
		'prettier/vim-prettier',
		cond = not vim.g.vscode
	},
	{
		'sainnhe/gruvbox-material',
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
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, { expr = true })

				map('n', '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, { expr = true })

				-- HunkActions
				map('n', '<leader>hs', gs.stage_hunk)
				map('n', '<leader>hr', gs.reset_hunk)
				map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('n', '<leader>hS', gs.stage_buffer)
				map('n', '<leader>hu', gs.undo_stage_hunk)
				map('n', '<leader>hR', gs.reset_buffer)
				map('n', '<leader>hp', gs.preview_hunk)
				map('n', '<leader>hb', function() gs.blame_line { full = true } end)
				map('n', '<leader>tb', gs.toggle_current_line_blame)
				map('n', '<leader>hd', gs.diffthis)
				map('n', '<leader>hD', function() gs.diffthis('~') end)
				map('n', '<leader>td', gs.toggle_deleted)

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
			end,
		},
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
		'zbirenbaum/copilot.lua',
		cond = not vim.g.vscode
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	}
})
