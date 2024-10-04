if not vim.g.vscode then
	require("auto-session").setup {
		close_unsupported_windows = false,

		cwd_change_handling = {
			post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
				require("lualine").refresh()  -- refresh lualine so the new session name is displayed in the status bar
			end,
		},
	}
end
