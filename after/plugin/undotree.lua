if not vim.g.vscode then
	vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle , {desc='Toggle Undotree'})
	vim.keymap.set('n', '<leader>uf', function()
		vim.cmd('UndotreeShow')
		vim.cmd('UndotreeFocus')
	end, {desc='Focus Undotree'})
end
