if not vim.g.vscode then
	require 'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			"javascript",
			"typescript",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"regex",
			"markdown_inline",
			"astro",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,


		highlight = {
			enable = true,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		refactor = {
			highlight_definitions = {
				enable = true,
				-- set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
			-- I don't really like this, TSContext is better
			-- highlight_current_scope = { enable = true },
			smart_rename = {
				enable = true,
				-- assign keymaps to false to disable them, e.g. `smart_rename = false`.
				keymaps = {
					smart_rename = "<leader>rr",
				},
			},
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["aa"] = { query = "@parameter.outer", desc = 'a parameter' },
					["ia"] = { query = "@parameter.inner", desc = 'inner parameter' },
					["ac"] = { query = "@class.outer", desc = 'a class' },
					["ic"] = { query = "@class.inner", desc = 'inner class' },
					["af"] = { query = "@function.outer", desc = 'a function' },
					["if"] = { query = "@function.inner", desc = 'inner function' },
					["ai"] = { query = "@call.outer", desc = 'a call' },
					["ii"] = { query = "@call.inner", desc = 'inner call' },
					["ak"] = { query = "@block.outer", desc = 'a block' },
					["ik"] = { query = "@block.inner", desc = 'inner block' },
					["al"] = { query = "@loop.outer", desc = 'a loop' },
					["il"] = { query = "@loop.inner", desc = 'inner loop' },
					["ar"] = { query = "@regex.outer", desc = 'a regex' },
					["ir"] = { query = "@regex.inner", desc = 'inner regex' },
					["gc"] = { query = "@comment.outer", desc = 'comment' },
				},
			},

			swap = {
				enable = true,
				swap_previous = {
					["<leader>S["] = "@parameter.inner",
				},
				swap_next = {
					["<leader>S]"] = "@parameter.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]a"] = "@parameter.inner",
					["]c"] = "@class.outer",
					["]f"] = "@function.outer",
					["]i"] = "@call.outer",
					["]k"] = "@block.outer",
					["]l"] = "@loop.outer",
					["]r"] = "@regex.outer",
				},
				goto_next_end = {
					["]A"] = "@parameter.inner",
					["]C"] = "@class.outer",
					["]F"] = "@function.outer",
					["]I"] = "@call.outer",
					["]K"] = "@block.outer",
					["]L"] = "@loop.outer",
					["]R"] = "@regex.outer",
				},
				goto_previous_start = {
					["[a"] = "@parameter.inner",
					["[c"] = "@class.outer",
					["[f"] = "@function.outer",
					["[i"] = "@call.outer",
					["[k"] = "@block.outer",
					["[l"] = "@loop.outer",
					["[r"] = "@regex.outer",
				},
				goto_previous_end = {
					["[A"] = "@parameter.inner",
					["[C"] = "@class.outer",
					["[F"] = "@function.outer",
					["[I"] = "@call.outer",
					["[K"] = "@block.outer",
					["[L"] = "@loop.outer",
					["[R"] = "@regex.outer",
				},
			},

			lsp_interop = {
				enable = true,
				peek_definition_code = {
					["<leader>kf"] = "@function.outer",
					["<leader>kc"] = "@class.outer",
				},
			},
		},
	}

	vim.keymap.set({ "n", "v" }, "<leader>co", function()
		vim.cmd('TSContextToggle')
	end, { desc = 'Toggle treesitter context' })

	vim.keymap.set(
		{ "n", "v" },
		"gC",
		require('treesitter-context').go_to_context,
		{ desc = 'Go to treesitter context' }
	)

	-- folding
	vim.opt.foldmethod = 'expr'
	vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
	vim.opt.foldcolumn = '1'
	vim.opt.fillchars = 'foldopen:,foldclose:,foldsep: ,eob: ,fold: '
	vim.opt.foldenable = false
	vim.opt.foldlevel = 99
	vim.opt.foldlevelstart = 99

	if true then
		if true then
			print('hello')
		end
		if false then
			if true then
				print('hello')
			end
			if true then
				print('hello')
			end
		end
	end
	-- split/join
	local tsj = require('treesj')
	tsj.setup({
		use_default_keymaps = false,
	})

	-- map leader j to treesj toggle
	vim.keymap.set(
		'n',
		'<leader>j',
		tsj.toggle,
		{ noremap = true, silent = true }
	)
end
