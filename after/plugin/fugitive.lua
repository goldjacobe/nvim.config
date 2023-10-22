-- open or focus fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git);

-- close fugitive
vim.keymap.set('n', '<leader>gq', function()
	vim.cmd('Git')
	vim.api.nvim_input('gq')
end, { silent = true })

-- (re-)open fugitive in a vertical split
vim.keymap.set('n', '<leader>gv', function()
	vim.cmd('Git')
	vim.api.nvim_input('gq')
	vim.cmd("vertical Git")
end, { silent = true })

-- (re-)open fugitive in a horizontal split
vim.keymap.set('n', '<leader>gh', function()
	vim.cmd('Git')
	vim.api.nvim_input('gq')
	vim.cmd("Git")
end, { silent = true })
