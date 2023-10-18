if not vim.g.vscode then
	vim.g['prettier#autoformat_config_present'] = '1'
	vim.g['prettier#config#config_precedence'] = 'prefer-file'
end
