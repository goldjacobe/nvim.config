if not vim.g.vscode then
	local zm = require('zen-mode')

	zm.setup {
		window = { options = { signcolumn = "no" } },
	}

	vim.keymap.set(
		{ "n", "v" },
		"<leader>z",
		zm.toggle,
		{ desc = 'Zen mode' }
	)
end
