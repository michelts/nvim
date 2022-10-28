local util = require('lspconfig/util')
local nnoremap = require('michelts.keymap').nnoremap

local opts = {
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
  local bufopts = { silent=true, buffer=bufnr }
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

require('lspconfig').tsserver.setup{
  on_attach = on_attach,
  root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")
}

local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
      vim.cmd("nmap <Leader>f <Plug>(prettier-format)")

      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
