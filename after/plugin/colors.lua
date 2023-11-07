if not vim.g.vscode then
	local bamboo = require('bamboo')
	bamboo.setup {
		-- Main options --
		-- NOTE: to use the light theme, set `vim.o.background = 'light'`
		style = 'multiplex',           -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
		toggle_style_key = '<leader>ct', -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
	}
	-- bamboo.load()

	require('catppuccin').setup {
		flavour = 'latte',
		-- flavour = 'frappe',
		-- flavour = 'macchiato',
		-- flavour = 'mocha',

		dim_inactive = {
			enabled = true, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},

		integrations = {
			cmp = true,
			gitsigns = true,
			harpoon = true,
			mason = true,
			noice = true,
			notify = true,
			nvimtree = true,
			treesitter = true,
			treesitter_context = true,
			telescope = { enabled = true },
			lsp_trouble = true,
			which_key = true,
		}
	}
end
