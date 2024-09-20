if not vim.g.vscode then
	require('cmp').setup {
		mapping = {
			['<Tab>'] = function(fallback) fallback() end,
			['<S-Tab>'] = function(fallback) fallback() end
		}
	}

	local lsp = require('lsp-zero')

	lsp.preset('recommended')

	lsp.ensure_installed({
		'ts_ls',
		'eslint',
	})

	lsp.set_sign_icons({
		error = '✘',
		warn  = '▲',
		hint  = '⚑',
		info  = '»',
	})

	lsp.on_attach(function(_, bufnr)
		lsp.default_keymaps({ buffer = bufnr })

		vim.keymap.set("n", "<leader>.", function()
			vim.lsp.buf.code_action({
				filter = function(a) return a.isPreferred end,
				apply = true
			})
		end, { buffer = bufnr, remap = false, desc = 'Apply first code action' })

		vim.keymap.set(
			"n",
			"<leader>,",
			vim.lsp.buf.code_action,
			{ buffer = bufnr, remap = false, desc = 'Code actions list' }
		)
	end)

	require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
	require('lspconfig').ts_ls.setup({
		init_options = {
			preferences = {
				importModuleSpecifierPreference = 'relative',
				importModuleSpecifierEnding = 'auto',
			},
		}
	})


	lsp.format_on_save({
		servers = {
			['lua_ls'] = { 'lua' },
		}
	})

	vim.keymap.set(
		'n',
		'<leader>le',
		function()
			vim.cmd('LspRestart')
		end,
		{ noremap = true, desc = 'Restart LSP' }
	)


	vim.keymap.set(
		'n',
		'<leader>ls',
		function()
			vim.cmd('LspStart')
		end,
		{ noremap = true, desc = 'Start LSP' }
	)
	vim.keymap.set(
		'n',
		'<leader>li',
		function()
			vim.cmd('LspInfo')
		end,
		{ noremap = true, desc = 'LSP info' }
	)

	vim.keymap.set('n', '<leader>lf', function()
		vim.lsp.buf.format {
			filter = function(client) return client.name ~= "ts_ls" end
		}
	end, { noremap = true, desc = 'Format buffer' })

	lsp.setup()
	local tb = require('telescope.builtin')

	vim.keymap.set(
		'n',
		'<leader>lr',
		tb.lsp_references,
		{ noremap = true, desc = 'LSP references' }
	)
	vim.keymap.set(
		'n',
		'<leader>ld',
		tb.lsp_definitions,
		{ noremap = true, desc = 'LSP definitions' }
	)
	vim.keymap.set(
		'n',
		'<leader>lt',
		tb.lsp_type_definitions,
		{ noremap = true, desc = 'LSP type definitions' }
	)
	vim.keymap.set(
		'n',
		'<leader>ln',
		tb.lsp_incoming_calls,
		{ noremap = true, desc = 'LSP incoming calls' }
	)
	vim.keymap.set(
		'n',
		'<leader>lo',
		tb.lsp_outgoing_calls,
		{ noremap = true, desc = 'LSP outgoing calls' }
	)
	vim.keymap.set(
		'n',
		'<leader>lc',
		tb.lsp_document_symbols,
		{ noremap = true, desc = 'LSP document symbols' }
	)
	vim.keymap.set(
		'n',
		'<leader>lw',
		tb.lsp_workspace_symbols,
		{ noremap = true, desc = 'LSP workspace symbols' }
	)
	vim.keymap.set(
		'n',
		'<leader>ly',
		tb.lsp_dynamic_workspace_symbols,
		{ noremap = true, desc = 'LSP dynamic workspace symbols' }
	)
	vim.keymap.set(
		'n',
		'<leader>lm',
		tb.lsp_implementations,
		{ noremap = true, desc = 'LSP implementations' }
	)
end
