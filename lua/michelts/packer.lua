vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'tanvirtin/monokai.nvim'
  use 'neovim/nvim-lspconfig'
end)
