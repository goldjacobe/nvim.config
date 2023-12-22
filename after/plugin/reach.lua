if not vim.g.vscode then
	local reach = require('reach')
	reach.setup {
		notifications = true
	}

	local last_active_times = {}
	local track_last_active_time = vim.api.nvim_create_augroup('track_last_active_time_for_reach', {})
	vim.api.nvim_create_autocmd('BufEnter', {
		group = track_last_active_time,
		callback = function()
			last_active_times[vim.api.nvim_get_current_buf()] = os.time()
		end
	})

	vim.keymap.set("n", "<leader>b", function()
		reach.buffers {
			handle = 'auto',
			auto_handles = {
				'a', 'r', 's', 't', 'g', 'm', 'n', 'e', 'i', 'o',
				'q', 'w', 'f', 'p', 'b', 'j', 'l', 'u', 'y',
				'z', 'x', 'c', 'd', 'v', 'k', 'h',
				'1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
				'A', 'R', 'S', 'T', 'G', 'M', 'N', 'E', 'I', 'O',
				'Q', 'W', 'F', 'P', 'B', 'J', 'L', 'U', 'Y',
				'Z', 'X', 'C', 'D', 'V', 'K', 'H',
				'!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
			},
			show_current = true,
			sort = function(a, b)
				local atime = last_active_times[a]
				local btime = last_active_times[b]
				if not atime and not btime then return a < b end
				if not atime then return false end
				if not btime then return true end
				return atime > btime
			end,
		}
	end, { desc = 'Reach buffers' })

	vim.keymap.set("n", "<leader>m", function()
		vim.cmd(':ReachOpen marks')
	end, { desc = 'Reach marks' })

	vim.keymap.set("n", "<leader>cs", function()
		vim.cmd(':ReachOpen colorschemes')
	end, { desc = 'Reach colorschemes' })
end
