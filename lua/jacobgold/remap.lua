vim.g.mapleader = " "

-- splits
vim.keymap.set({"n", "v"}, "<leader>\\", vim.cmd.vsplit)
vim.keymap.set({"n", "v"}, "<leader>/", vim.cmd.split)

-- tab stuff
vim.keymap.set({"n", "v"}, "<leader>te", vim.cmd.tabedit)
vim.keymap.set({"n", "v"}, "<leader>tc", vim.cmd.tabclose)
vim.keymap.set({"n", "v"}, "<leader>tn", vim.cmd.tabnext)
vim.keymap.set({"n", "v"}, "<leader>tp", vim.cmd.tabprev)

-- buffer stuff
vim.keymap.set({"n", "v"}, "<leader>bn", vim.cmd.bnext)
vim.keymap.set({"n", "v"}, "<leader>bp", vim.cmd.bprev)
vim.keymap.set({"n", "v"}, "<leader>bd", vim.cmd.bd)

-- don't copy to register when deleting characters
vim.keymap.set("n", "x", '"_x')

-- ThePrimeagen
-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the same place when you append next line to current
vim.keymap.set("n", "J", "mzJ`z")

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
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without writing to buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- capital Q is the worst thing ever apparently
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>")
-- TODO figure out how to make these the same as above when loc window open
-- vim.keymap.set("n", "<leader>lj", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>lk", "<cmd>lnext<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>" )
vim.keymap.set("n", "<leader>-x", "<cmd>!chmod -x %<CR>" )

-- run yarn prettier on save yay
vim.keymap.set("n", "<leader>w", function()
	vim.cmd('w')
	vim.cmd('!yarn prettier -w ' .. vim.fn.expand('%:p'))
	vim.api.nvim_input('<ENTER>')
end, { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
