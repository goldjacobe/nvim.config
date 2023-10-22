if not vim.g.vscode then
	vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
	vim.keymap.set('n', '<leader>uf', function()
		vim.cmd('UndotreeShow')
		vim.cmd('UndotreeFocus')
	end)
end
