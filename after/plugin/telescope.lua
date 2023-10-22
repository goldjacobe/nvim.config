if not vim.g.vscode then

	require("telescope").setup {
		extensions = {
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	}

	require("telescope").load_extension('fzf')

	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
	vim.keymap.set('n', '<leader>fs', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") });
	end)

	require("telescope").load_extension "file_browser"

	vim.api.nvim_set_keymap(
		"n",
		"<leader>fb",
		":Telescope file_browser<CR>",
		{ noremap = true }
	)

	-- open file_browser with the path of the current buffer
	vim.api.nvim_set_keymap(
		"n",
		"<leader>fb",
		":Telescope file_browser path=%:p:h select_buffer=true<CR>",
		{ noremap = true }
	)
end
