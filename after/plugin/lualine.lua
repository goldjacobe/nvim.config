if not vim.g.vscode then
	require('lualine').setup {
		extensions = {
			'quickfix',
			'fugitive',
			'mason',
			'trouble'
		}
	}
end
