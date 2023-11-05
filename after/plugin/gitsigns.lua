if not vim.g.vscode then
	require('gitsigns').setup({
		-- See `:help gitsigns.txt`
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
			delay = 50,
			ignore_whitespace = true,
			virt_text_priority = 100,
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map('n', ']h', function()
				if vim.wo.diff then return ']c' end
				vim.schedule(function() gs.next_hunk() end)
				return '<Ignore>'
			end, { expr = true, desc = 'Next hunk' })

			map('n', '[h', function()
				if vim.wo.diff then return '[c' end
				vim.schedule(function() gs.prev_hunk() end)
				return '<Ignore>'
			end, { expr = true, desc = 'Previous hunk' })

			-- HunkActions
			map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
			map('n', '<leader>ghS', gs.stage_buffer, { desc = 'Stage buffer' })
			map('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
				{ desc = 'Stage hunk' })
			map('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
				{ desc = 'Reset hunk' })
			map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
			map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
			map('n', '<leader>ghR', gs.reset_buffer, { desc = 'Reset buffer' })
			map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview hunk' })
			map('n', '<leader>ghb', function() gs.blame_line { full = true } end, { desc = 'Show full blame for line' })
			map('n', '<leader>ghd', gs.diffthis, { desc = 'Diff hunk' })
			map('n', '<leader>ghD', function() gs.diffthis('~') end, { desc = 'Diff hunk against previous commit' })
			map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle blame for current line' })
			map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted line view' })

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		end,
	})
end
