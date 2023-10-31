if not vim.g.vscode then
	require('lualine').setup {
		extensions = {
			'quickfix',
			'fugitive',
			'mason',
			'trouble'
		},
		sections = {
			lualine_a = { 'branch' },
			lualine_b = { 'diff' },
			lualine_c = { 'diagnostics' },
			lualine_x = { 'encoding' },
			lualine_y = { 'fileformat' },
			lualine_z = { 'filetype' },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		winbar = {
			lualine_a = { 'mode' },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { 'progress' },
			lualine_z = { 'location' }
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'progress' },
			lualine_y = { 'location' },
			lualine_z = {}
		},
		tabline = {
			lualine_a = {'buffers'},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {
			},
			lualine_y = {
				{
					require("noice").api.statusline.mode.get,
					cond = require("noice").api.statusline.mode.has,
				},
				{
					require("noice").api.status.search.get,
					cond = require("noice").api.status.search.has,
				},
			},
			lualine_z = {
				{
					require('auto-session.lib').current_session_name
				},
			}
		}
	}
end
