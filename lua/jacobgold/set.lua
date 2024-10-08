-- always split right
vim.o.splitright = true

-- cursorline
vim.opt.cursorline = true

-- always show tabline
vim.opt.showtabline = 2

-- line numbers on
vim.opt.nu = true
-- relative line numbers
vim.opt.relativenumber = true

-- tab (always 2 spaces)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- smart autoindenting
vim.opt.smartindent = true

-- no frickin linewrap
vim.opt.wrap = false

-- no swapfiles or backups, but yes undofile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- only highlight searches while searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- case insensistive searching
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.termguicolors = true

vim.opt.startofline = true

-- keep margin of 8 lines above/below
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 30
vim.opt.signcolumn = "yes"

-- allow @ in filenames
-- https://vi.stackexchange.com/questions/22423/in-file-names-and-gf-go-to-file
vim.opt.isfname:append("@-@")

-- plugins use this to determine how long after you stop typing to update
vim.opt.updatetime = 20

-- marker at column 80
vim.opt.colorcolumn = "80"

vim.opt.cmdwinheight = 20

vim.opt.autoread = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- auto-session told me to do this
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
