if not vim.g.vscode then
	-- local bamboo = require('bamboo')
	-- bamboo.setup {
	-- 	-- Main options --
	-- 	-- NOTE: to use the light theme, set `vim.o.background = 'light'`
	-- 	style = 'multiplex',           -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
	-- 	toggle_style_key = '<leader>ct', -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
	-- }
	-- bamboo.load()
	vim.cmd('colorscheme catppuccin-frappe')
end
