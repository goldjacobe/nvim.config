if not vim.g.vscode then
	require("notify").setup({
		background_colour = "#000000",
		fps = 1
	})

	require("noice").setup({
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false,     -- use a classic bottom cmdline for search
			command_palette = true,    -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false,        -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false,    -- add a border to hover docs and signature help
		},
	})


	vim.keymap.set("n", "<leader>nd", function()
		require("noice").cmd("dismiss")
	end, { desc = 'Dismiss' })

	vim.keymap.set("n", "<leader>nl", function()
		require("noice").cmd("last")
	end, { desc = 'Show last message' })

	vim.keymap.set("n", "<leader>nh", function()
		require("noice").cmd("history")
	end, { desc = 'Message history' })

	vim.keymap.set("n", "<leader>fn", function()
		require("noice").cmd("telescope")
	end, { desc = 'Noice' })
end
