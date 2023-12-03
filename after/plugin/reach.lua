if not vim.g.vscode then
	local reach = require('reach')
	reach.setup {
		notifications = true
	}

	vim.keymap.set("n", "<leader>b", function()
		reach.buffers {
			handle = 'auto',
			show_current = true,
			sort = function(a, b) return a < b end,
		}
	end, { desc = 'Reach buffers' })

	vim.keymap.set("n", "<leader>B", function()
		reach.buffers {
			handle = 'dynamic',
			show_current = true,
			sort = function(a, b) return a < b end,
		}
	end, { desc = 'Reach buffers' })

	vim.keymap.set("n", "<leader>m", function()
		vim.cmd(':ReachOpen marks')
	end, { desc = 'Reach marks' })

	vim.keymap.set("n", "<leader>cs", function()
		vim.cmd(':ReachOpen colorschemes')
	end, { desc = 'Reach colorschemes' })
end
