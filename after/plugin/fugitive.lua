-- open or focus fugitive
vim.keymap.set(
	'n',
	'<leader>gs',
	vim.cmd.Git,
	{ desc = 'Fugitive staging area' }
)

vim.keymap.set(
	'n',
	'<leader>gS',
	function() vim.cmd('Git status') end,
	{ desc = 'Fugitive staging area' }
)

vim.keymap.set(
	'n',
	'<leader>gc',
	function()
		vim.cmd('Git commit')
	end,
	{ desc = 'Fugitive commit' }
)

vim.keymap.set(
	'n',
	'<leader>gb',
	function() vim.cmd('Git blame') end,
	{ desc = 'Fugitive blame' }
)

vim.keymap.set(
	'n',
	'<leader>gH',
	function() vim.cmd('GBrowse') end,
	{ desc = 'View on GitHub' }
)

-- close fugitive
vim.keymap.set('n', '<leader>gq', function()
	vim.cmd('Git')
	vim.api.nvim_input('gq')
end, { desc = 'Close fugitive', silent = true })
