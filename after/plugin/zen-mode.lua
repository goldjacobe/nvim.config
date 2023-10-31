-- zen mode
vim.keymap.set(
	{ "n", "v" },
	"<leader>z",
	require('zen-mode').toggle
)
