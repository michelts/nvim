local M = require('michelts.keymap')

-- [O]pen the file's current directory
M.nnoremap("<leader>o", "<cmd>Ex<CR>")

-- Alt-Backspace to clear word-by-word in command line
M.cmap('<a-bs>', '<c-w>')
