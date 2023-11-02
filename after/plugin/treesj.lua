if not vim.g.vscode then
	local tsj = require('treesj')
	tsj.setup({
		use_default_keymaps = false,
	})
	-- map leader J to treesj toggle
	vim.keymap.set(
		'n',
		'<leader>J',
		tsj.toggle,
		{ noremap = true, silent = true }
	)
end
