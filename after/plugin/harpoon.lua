if not vim.g.vscode then
	local harpoon = require("harpoon")

	vim.keymap.set("n", "<leader>a", function()
		harpoon:list():append()
	end, { desc = 'Harpoon add mark' })

	vim.keymap.set("n", "<leader>h", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = 'Harpoon list' })

	vim.keymap.set("n", "<leader>1", function()
		harpoon:list():select(1)
	end, { desc = 'Harpoon mark 1' })

	vim.keymap.set("n", "<leader>2", function()
		harpoon:list():select(2)
	end, { desc = 'Harpoon mark 2' })

	vim.keymap.set("n", "<leader>3", function()
		harpoon:list():select(3)
	end, { desc = 'Harpoon mark 3' })

	vim.keymap.set("n", "<leader>4", function()
		harpoon:list():select(4)
	end, { desc = 'Harpoon mark 4' })

	vim.keymap.set("n", "<leader>5", function()
		harpoon:list():select(5)
	end, { desc = 'Harpoon mark 5' })

	vim.keymap.set("n", "<leader>6", function()
		harpoon:list():select(6)
	end, { desc = 'Harpoon mark 6' })

	vim.keymap.set("n", "<leader>7", function()
		harpoon:list():select(7)
	end, { desc = 'Harpoon mark 7' })

	vim.keymap.set("n", "<leader>8", function()
		harpoon:list():select(8)
	end, { desc = 'Harpoon mark 8' })

	vim.keymap.set("n", "<leader>9", function()
		harpoon:list():select(9)
	end, { desc = 'Harpoon mark 9' })

	vim.keymap.set("n", "<leader>0", function()
		harpoon:list():select(10)
	end, { desc = 'Harpoon mark 10' })
end
