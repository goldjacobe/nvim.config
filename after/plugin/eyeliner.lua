require 'eyeliner'.setup {
	highlight_on_key = true,
	dim = false,
}
local function setup_colors()
	vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true })
	vim.api.nvim_set_hl(0, 'EyelinerSecondary', { bold = true })
end
setup_colors()
vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	callback = setup_colors,
})
