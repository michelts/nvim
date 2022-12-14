vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.wrap = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.cmdheight = 1 -- Give more space for displaying messages.

vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Autocomplete on tab by first listing the folders and then itering the options
vim.opt.wildmode = "list:longest,list:full"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50


-- Use the CTRL-C clipboard, instead of the middle-mouse clipboard
vim.opt.clipboard = 'unnamedplus'

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.opt.statusline:append("L%-3l C%-2c %f")

vim.api.nvim_create_autocmd(
    {"BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.rst" }, command = "setlocal spell" }
)
vim.api.nvim_create_autocmd(
    {"BufRead", "BufNewFile" },
    { pattern = { "*.py" }, command = "setlocal shiftwidth=4 softtabstop=4" }
)
