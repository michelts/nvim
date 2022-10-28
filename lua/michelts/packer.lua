vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
  -- Packer itself:
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')

  -- LSP:
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- colorschemes:
  use('folke/tokyonight.nvim')
  use('tanvirtin/monokai.nvim')
  use('morhetz/gruvbox')
  use('altercation/vim-colors-solarized')
end)
