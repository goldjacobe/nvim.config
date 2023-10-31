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
		}
	},
	{
		'rmagatti/auto-session',
	},
	{
		"folke/twilight.nvim",
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
				end, { expr = true, desc = 'Next hunk' })

				map('n', '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, { expr = true, desc = 'Previous hunk' })

				-- HunkActions
				map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
				map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
				map('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = 'Stage hunk' })
				map('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = 'Reset hunk' })
				map('n', '<leader>ghS', gs.stage_buffer, { desc = 'Stage buffer' })
				map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
				map('n', '<leader>ghR', gs.reset_buffer, { desc = 'Reset buffer' })
				map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview hunk' })
				map('n', '<leader>ghb', function() gs.blame_line { full = true } end, { desc = 'Show full blame for line' })
				map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle blame for current line' })
				map('n', '<leader>ghd', gs.diffthis, { desc = 'Diff hunk' })
				map('n', '<leader>ghD', function() gs.diffthis('~') end, { desc = 'Diff hunk against previous commit' })
				map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted line view' })

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
