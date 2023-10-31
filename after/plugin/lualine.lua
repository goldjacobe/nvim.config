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
			lualine_x = {
				{
					require("noice").api.status.search.get,
					cond = require("noice").api.status.search.has,
				},
			},
			lualine_y = {
				{
					require("noice").api.status.ruler.get,
					cond = require("noice").api.status.ruler.has,
				},
			},
			lualine_z = {
				{
					require("noice").api.status.command.get,
					cond = require("noice").api.status.command.has,
				},
			}
		}
	}
end
