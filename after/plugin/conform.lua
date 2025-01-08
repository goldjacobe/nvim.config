local conform = require("conform")

---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

conform.setup {
	formatters = {
		biome = {
			require_cwd = true,
			args = {
				'--colors force'
			},
		},
	},
	formatters_by_ft = {
		markdown = function(bufnr)
			return { first(bufnr, "biome"), "injected" }
		end,
		typescript = {
			'biome',
			stop_after_first = true,
		},
		typescriptreact = {
			'biome',
			stop_after_first = true,
		},
		javascript = {
			'biome',
			stop_after_first = true,
		},
		javascriptreact = {
			'biome',
			stop_after_first = true,
		},
		graphql = {
			'biome',
			stop_after_first = true,
		},
		css = {
			'biome',
			stop_after_first = true,
			filetypes = {
				"css",
				"scss",
				"less",
				"sass",
				"stylus",
			},
		},
	},
	-- Set default options
	default_format_opts = {
		lsp_format = "fallback",
	},
	-- Set up format-on-save
	format_on_save = { timeout_ms = 500 },
	-- Customize formatters
}
