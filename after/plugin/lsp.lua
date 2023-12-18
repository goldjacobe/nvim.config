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
		'tsserver',
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
	require('lspconfig').tsserver.setup({
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
		'<leader>lr',
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
			filter = function(client) return client.name ~= "tsserver" end
		}
	end, { noremap = true, desc = 'Format buffer' })

	lsp.setup()
end
