if not vim.g.vscode then
	require('reach').setup({
		notifications = true
	})

	vim.keymap.set("n", "<leader>b", function()
		vim.cmd(':ReachOpen buffers')
	end, { desc = 'Reach buffers' })
	vim.keymap.set("n", "<leader>m", function()
		vim.cmd(':ReachOpen marks')
	end, { desc = 'Reach marks' })
end
