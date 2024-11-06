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
		prettierd = {
			require_cwd = true,
		},
		prettier = {
			require_cwd = true,
		},
	},
	formatters_by_ft = {
		markdown = function(bufnr)
			return { first(bufnr, "prettierd", "prettier"), "injected" }
		end,
		typescript = {
			'prettierd',
			'prettier',
			stop_after_first = true,
		},
		typescriptreact = {
			'prettierd',
			'prettier',
			stop_after_first = true,
		},
		javascript = {
			'prettierd',
			'prettier',
			stop_after_first = true,
		},
		javascriptreact = {
			'prettierd',
			'prettier',
			stop_after_first = true,
		},
		graphql = {
			'prettierd',
			'prettier',
			stop_after_first = true,
		},
		css = {
			'prettierd',
			'prettier',
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
