vim.g.mapleader = " "

-- save with control s
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = 'Save file' })
-- save all with leader control s
vim.keymap.set("n", "<leader><C-s>", ":wa<CR>", { desc = 'Save all' })

-- transparent background with leader ct
vim.keymap.set("n", "<leader>ct", function()
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
end, { desc = 'Transparent background' })

-- float diagnostics with leader K
vim.keymap.set(
	"n",
	"<leader>K",
	function()
		vim.diagnostic.open_float()
	end,
	{ desc = 'Show line diagnostics' }
)

-- copy filepath
vim.keymap.set("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end,
	{ desc = 'Copy absolute path of buffer to clipboard', }
)
vim.keymap.set("n", "<leader>cr", function() vim.fn.setreg("+", vim.fn.expand("%")) end,
	{ desc = 'Copy relative path of buffer to clipboard', }
)

-- toggle wrap
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", { desc = 'Toggle wrap' })

-- add new lines in normal mode (works for multiple!!!)
vim.keymap.set("n", "<leader>o", "o<ESC>", { desc = 'New line below' })
vim.keymap.set("n", "<leader>O", "O<ESC>", { desc = 'New line above' })

vim.keymap.set("n", "D", function()
	if vim.fn.getline(vim.fn.line('.')) == "" then
		vim.cmd("normal! dd")
	else
		vim.cmd("normal! D")
	end
end, { desc = 'Delete to end of line' })

-- delete a file and go to last buffer
vim.keymap.set({ "n", "v" }, "<leader>rm", function()
	local buf = vim.api.nvim_get_current_buf()
	local path = vim.api.nvim_buf_get_name(buf)
	os.remove(path)
	local removed_buffer_num = vim.api.nvim_buf_get_number(buf)
	vim.cmd.bprevious()
	vim.cmd('bdelete!' .. removed_buffer_num)
	print('Deleted ' .. path)
end, { desc = 'Delete the current file and its buffer' })

-- splits
vim.keymap.set({ "n", "v" }, "<leader>\\", vim.cmd.vsplit, { desc = 'Vertical split' })
vim.keymap.set({ "n", "v" }, "<leader>/", vim.cmd.split, { desc = 'Horizontal split' })

-- buffer stuff
vim.keymap.set({ "n", "v" }, "[b", vim.cmd.bprev, { desc = 'Previous buffer' })
vim.keymap.set({ "n", "v" }, "]b", vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set("n", "<leader>cb", function() vim.cmd("%bd|e#|bd#") end, { desc = 'Clear buffers' })
vim.keymap.set("n", "<leader>cB", function() vim.cmd("%bd!|e#|bd#") end, { desc = 'Clear buffers (even if modified)' })

-- don't copy to register when deleting characters
vim.keymap.set("n", "x", '"_x')

-- ThePrimeagen
-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the same place when you append next line to current
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "gJ", "mzgJ`z")

-- keep cursor in the middle of the screen as you scroll up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- keep cursor in the middle when you search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- something for primeagen??? idk
--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

-- greatest remap ever
-- paste over selection without overwriting buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and don't yank" })

-- next greatest remap ever : asbjornHaland
-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Copy to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Copy line to clipboard' })

-- delete without writing to buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- quickfix navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = 'Next quickfix item' })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = 'Previous quickfix item' })
vim.keymap.set("n", "<leader>q", "<cmd>cclose<CR>", { desc = 'Close quickfix window' })
-- TODO figure out how to make these the same as above when loc window open
-- vim.keymap.set("n", "<leader>lj", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>lk", "<cmd>lnext<CR>zz")

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = 'Replace current word' }
)

vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { desc = 'Make current file executable' })
vim.keymap.set("n", "<leader>-x", "<cmd>!chmod -x %<CR>", { desc = 'Make current file non-executable' })

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = 'Source current buffer' })
