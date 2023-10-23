if not vim.g.vscode then
	require("telescope").setup {
		defaults = {
			layout_config = { prompt_position = 'top' },
			sorting_strategy = 'ascending'
		},
		extensions = {
			file_browser = {
--				theme = "ivy",
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
	require("telescope").load_extension('harpoon')

	local builtin = require('telescope.builtin')
	vim.keymap.set({ 'n', 'v' }, '<leader>ff', builtin.find_files, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>fg', builtin.git_files, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>fl', builtin.live_grep, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>fs', builtin.grep_string, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>fh', function()
		vim.cmd('Telescope harpoon marks')
	end)

	vim.keymap.set({ 'n', 'v' }, '<leader>fq', builtin.quickfix, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>ftb', builtin.builtin, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>fgs', builtin.git_status, {})
	vim.keymap.set({ 'n', 'v' }, '<leader>fcb', builtin.current_buffer_fuzzy_find, {})
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
