if not vim.g.vscode then
	local mark = require('harpoon.mark')
	local ui = require('harpoon.ui')

	vim.keymap.set({ "n", "v" }, "<leader>a", mark.add_file, { desc = 'Harpoon add mark' })
	vim.keymap.set({ "n", "v" }, "<leader>h", ui.toggle_quick_menu, { desc = 'Harpoon list' })

	vim.keymap.set({ "n", "v" }, "<leader>1", function() ui.nav_file(1) end, { desc = 'Harpoon mark 1' })
	vim.keymap.set({ "n", "v" }, "<leader>2", function() ui.nav_file(2) end, { desc = 'Harpoon mark 2' })
	vim.keymap.set({ "n", "v" }, "<leader>3", function() ui.nav_file(3) end, { desc = 'Harpoon mark 3' })
	vim.keymap.set({ "n", "v" }, "<leader>4", function() ui.nav_file(4) end, { desc = 'Harpoon mark 4' })
end
