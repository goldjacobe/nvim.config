local yank_hl = vim.api.nvim_create_augroup('yank_hl', {})
vim.api.nvim_create_autocmd('TextYankPost', {
	group = yank_hl,
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end
})

local cursor_hold_checktime = vim.api.nvim_create_augroup('cursor_hold_checktime', {})
vim.api.nvim_create_autocmd('CursorHold', {
	group = cursor_hold_checktime,
	pattern = '*',
	-- https://neovim.discourse.group/t/au-cursorhold-checktime-breaks-the-command-line-window/967/3
	command = "if expand(\"%f\") != \"[Command Line]\" | checktime | endif"
})
