if not vim.g.vscode then
	require('cmp').setup {
		mapping = {
			['<Tab>'] = function(fallback) fallback() end,
			['<S-Tab>'] = function(fallback) fallback() end
		}
	}

	local lspconfig_defaults = require('lspconfig').util.default_config
	lspconfig_defaults.capabilities = vim.tbl_deep_extend(
		'force',
		lspconfig_defaults.capabilities,
		require('cmp_nvim_lsp').default_capabilities()
	)

	local buffer_autoformat = function(bufnr)
		local group = 'lsp_autoformat'
		vim.api.nvim_create_augroup(group, { clear = false })
		vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = bufnr,
			group = group,
			desc = 'LSP format on save',
			callback = function()
				vim.lsp.buf.format({
					async = false,
					timeout_ms = 10000,
					filter = function(client) return client.name ~= "ts_ls" end
				})
			end,
		})
	end

	local create_lsp_keymaps = function(bufnr)
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Hover',
		})
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Go to definition',
		})
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Go to declaration',
		})
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Go to implementation',
		})
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Go to type definition',
		})
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Go to references',
		})
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Signature help',
		})
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', {
			buffer = bufnr,
			remap = false,
			desc = 'Rename',
		})

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
			{
				buffer = bufnr,
				remap = false,
				desc = 'Code actions list',
			}
		)

		vim.keymap.set('n', '<leader>lf', function()
			vim.lsp.buf.format {
				filter = function(client) return client.name ~= "ts_ls" end
			}
		end, { noremap = true, desc = 'Format buffer' })
	end

	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'LSP actions',
		callback = function(event)
			create_lsp_keymaps(event.buf)

			local id = vim.tbl_get(event, 'data', 'client_id')
			local client = id and vim.lsp.get_client_by_id(id)
			if client == nil then
				return
			end


			if client.name == 'lua_ls' or client.name == 'biome' then
				buffer_autoformat(event.buf)
			end
		end,
	})

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = '✘',
				[vim.diagnostic.severity.WARN] = '▲',
				[vim.diagnostic.severity.HINT] = '⚑',
				[vim.diagnostic.severity.INFO] = '»',
			},
		},
	})

	require('mason').setup({})
	require('mason-lspconfig').setup({
		-- Replace the language servers listed here
		-- with the ones you want to install
		ensure_installed = { 'lua_ls', 'ts_ls', 'biome' },
		handlers = {
			function(server_name)
				require('lspconfig')[server_name].setup({})
			end,

			ts_ls = function()
				require('lspconfig').ts_ls.setup({
					init_options = {
						preferences = {
							importModuleSpecifierPreference = 'relative',
							importModuleSpecifierEnding = 'auto',
						},
					}
				})
			end,
		},
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
