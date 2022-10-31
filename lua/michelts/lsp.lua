local root_pattern = require("lspconfig.util").root_pattern
local nnoremap = require('michelts.keymap').nnoremap
local lsp_format = require('lsp-format')

local opts = {
  silent = true
}

lsp_format.setup({
  order = {
    "tsserver",
    "eslint",
  }
})

nnoremap('<leader>e', vim.diagnostic.open_float, opts)
nnoremap('[d', vim.diagnostic.goto_prev, opts)
nnoremap(']d', vim.diagnostic.goto_next, opts)
nnoremap('<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Debounce by 300ms by default
  client.config.flags.debounce_text_changes = 300

  -- This will set up formatting for the attached LSPs
  client.server_capabilities.documentFormattingProvider = true
  lsp_format.on_attach(client)

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent=true, buffer=bufnr }
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
  nnoremap('<leader>r', vim.lsp.buf.rename, bufopts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, bufopts)
  nnoremap('gr', vim.lsp.buf.references, bufopts)
  nnoremap('<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {'tailwindcss', 'tsserver', 'eslint', 'pyright'},
  automatic_installation = true
})

require('lspconfig').pyright.setup({ on_attach = on_attach })

require('lspconfig').tsserver.setup({
  on_attach = on_attach,
  root_dir = root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")
})

require('lspconfig').eslint.setup({
  on_attach = on_attach,
  root_dir = root_pattern(".eslintrc.js", "node_modules", ".git")
})
