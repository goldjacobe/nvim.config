if not vim.g.vscode then
	require('lualine').setup {
		extensions = {
			'quickfix',
			'fugitive',
			'mason',
			'trouble'
		},
		sections = {
			lualine_c = {
				'buffers',
				separator = nil
			},
		}
	}
end
