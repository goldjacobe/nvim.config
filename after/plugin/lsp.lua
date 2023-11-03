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

	lsp.on_attach(function(name, bufnr)
		lsp.default_keymaps({ buffer = bufnr })

		vim.keymap.set("n", "<leader>.", function()
			vim.lsp.buf.code_action({
				filter = function(a) return a.isPreferred end,
				apply = true
			})
		end, { buffer = bufnr, remap = false, desc = 'Apply first code action' })
	end)

	require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


	lsp.format_on_save({
		servers = {
			['lua_ls'] = { 'lua' },
		}
	})

	lsp.setup()
end
