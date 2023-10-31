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
	vim.keymap.set({ 'n', 'v' }, '<leader>ff', builtin.find_files, { desc = 'Files' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fg', builtin.git_files, { desc = 'Git files' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fo', builtin.buffers, { desc = 'Buffers' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fl', builtin.live_grep, { desc = 'Live grep' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fs', builtin.grep_string, { desc = 'Grep string' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fh', function()
		vim.cmd('Telescope harpoon marks')
	end, { desc = '' })

	vim.keymap.set({ 'n', 'v' }, '<leader>fq', builtin.quickfix, { desc = 'Quickfix' })
	vim.keymap.set({ 'n', 'v' }, '<leader>ft', builtin.builtin, { desc = 'Telescopes' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fG', builtin.git_status, { desc = 'Git status' })
	vim.keymap.set({ 'n', 'v' }, '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Current buffer' })
	require("telescope").load_extension "file_browser"

	-- open file_browser with the path of the current buffer
	vim.api.nvim_set_keymap(
		"n",
		"<leader>fb",
		":Telescope file_browser path=%:p:h select_buffer=true<CR>",
		{ noremap = true, desc = "File browser" }
	)
end
