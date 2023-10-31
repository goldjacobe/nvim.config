if not vim.g.vscode then
	local lsp = require('lsp-zero')

	lsp.preset('recommended')

	lsp.ensure_installed({
		'tsserver',
		'eslint',
	})

	local cmp = require('cmp')
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local cmp_mappings = lsp.defaults.cmp_mappings({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	})

	lsp.set_preferences({
		sign_icons = {
			error = 'E',
			warn = 'W',
			hint = 'H',
			info = 'I'
		}

	})

	lsp.on_attach(function(client, bufnr)
		vim.keymap.set(
			"n",
			"gd",
			function() vim.lsp.buf.definition() end,
			{ buffer = bufnr, remap = false, desc='Go to definition'}
		)
		vim.keymap.set(
			"n",
			"gr",
			function() vim.lsp.buf.references() end,
			{ buffer = bufnr, remap = false , desc = 'Go to references'}
		)
		vim.keymap.set(
			"n",
			"K",
			function() vim.lsp.buf.hover() end,
			{ buffer = bufnr, remap = false , desc = 'Hover'}
		)
		vim.keymap.set(
			"n",
			"<leader>lw",
			function() vim.lsp.buf.workspace_symbol() end,
			{ buffer = bufnr, remap = false , desc = 'Workspace symbol list'}
		)
		vim.keymap.set("n", "<leader>.", function()
			vim.lsp.buf.code_action({
				filter = function(a) return a.isPreferred end,
				apply = true
			})
		end, { buffer = bufnr, remap = false , desc = 'Apply first code action'})
		vim.keymap.set(
			"n",
			"<leader>vd",
			function() vim.diagnostic.open_float() end,
			{ buffer = bufnr, remap = false , desc = 'Floating diagnostic'}
		)
		vim.keymap.set(
			"n",
			"[d",
			function() vim.diagnostic.goto_next() end,
			{ buffer = bufnr, remap = false , desc = 'Next diagnostic'}
		)
		vim.keymap.set(
			"n",
			"]d",
			function() vim.diagnostic.goto_prev() end,
			{ buffer = bufnr, remap = false , desc = 'Previous diagnostic'}
		)
		vim.keymap.set(
			"n",
			"<leader>lc",
			function() vim.lsp.buf.code_action() end,
			{ buffer = bufnr, remap = false , desc = 'Open code action list'}
		)
		vim.keymap.set(
			"n",
			"<leader>lr",
			function() vim.lsp.buf.rename() end,
			{ buffer = bufnr, remap = false , desc = 'Rename symbol'}
		)
	end)

	require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

	lsp.setup()
end
