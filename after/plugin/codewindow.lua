if not vim.g.vscode then
	local cw = require('codewindow')

	cw.setup()

	vim.keymap.set(
		'n',
		'<leader>cw',
		cw.toggle_minimap,
		{ desc = 'Toggle minimap' }
	)
end
