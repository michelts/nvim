local nnoremap = require('michelts.keymap').nnoremap

local opts = {
  noremap = true,
  silent = true
}

nnoremap('<leader>e', vim.diagnostic.open_float, opts)
nnoremap('[d', vim.diagnostic.goto_prev, opts)
nnoremap(']d', vim.diagnostic.goto_next, opts)
nnoremap('<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  nnoremap('gD', vim.lsp.buf.declaration, bufopts)
  nnoremap('gd', vim.lsp.buf.definition, bufopts)
  nnoremap('K', vim.lsp.buf.hover, bufopts)
  nnoremap('gi', vim.lsp.buf.implementation, bufopts)
  nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts)
  nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  nnoremap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  nnoremap('<leader>D', vim.lsp.buf.type_definition, bufopts)
  nnoremap('<leader>rn', vim.lsp.buf.rename, bufopts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, bufopts)
  nnoremap('gr', vim.lsp.buf.references, bufopts)
  nnoremap('<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig').pyright.setup{
  on_attach = on_attach,
}

require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
}
