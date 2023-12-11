vim.api.nvim_create_user_command(
	'Graphite',
	function(table)
		local output = vim.fn.system { 'gt', 'ls', '--no-interactive' }
		local width = 200;
		local height = 50;

		local bufnr = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_var(bufnr, 'modifiable', false)
		local win_id = vim.api.nvim_open_win(bufnr, true, {
			relative = "editor",
			title = "Graphite",
			row = math.floor(((vim.o.lines - height) / 2) - 1),
			col = math.floor((vim.o.columns - width) / 2),
			width = width,
			height = height,
			style = "minimal",
			border = "single",
		})
		local branches = {}
		for i, line in ipairs(vim.fn.split(output, '\n')) do
			local lineSplit = vim.fn.split(line, ' ')
			local branch = lineSplit[#lineSplit] == 'restack)' and lineSplit[#lineSplit - 2] or lineSplit[#lineSplit]
			if branch[-1] == 'restack)' then
				branch = vim.fn.split(line, ' ')[-2]
			end
			branches[i] = branch
			vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { line })
		end

		vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, { 'Press enter on a line to checkout that branch' })
		vim.keymap.set('n', '<CR>', function()
			if (vim.fn.line('.') == 1) then
				return
			end
			local coOutput = vim.fn.system {
				'gt',
				'checkout',
				branches[vim.fn.line('.') - 1],
			}
			vim.api.nvim_win_close(win_id, true)
			print(coOutput)
		end, { noremap = true, silent = true, buffer = bufnr })
	end,
	{}
)

vim.api.nvim_set_keymap('n', '<leader>gr', ':Graphite<CR>', { noremap = true, silent = true })
