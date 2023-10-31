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
				require('auto-session.lib').current_session_name
			},
		},
		tabline = {
			lualine_a = { 'buffers' },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'tabs' }
		}
	}
end
