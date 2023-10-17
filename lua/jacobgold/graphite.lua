vim.api.nvim_add_user_command(
    'Graphite log short',
	function()
		vim.api.nvim_command('!gt ls')
	end,
	{}
)
