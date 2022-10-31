vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
  -- Packer itself:
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')

  -- LSP:
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use('neovim/nvim-lspconfig')
  use('lukas-reineke/lsp-format.nvim')

  -- colorschemes:
  use('folke/tokyonight.nvim')
  use('tanvirtin/monokai.nvim')
  use('morhetz/gruvbox')
  use('altercation/vim-colors-solarized')
end)
