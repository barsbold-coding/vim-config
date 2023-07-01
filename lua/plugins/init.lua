require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'
  use 'tamton-aquib/staline.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'tpope/vim-commentary'
  use 'nvim-lualine/lualine.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'williamboman/mason.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'kylechui/nvim-surround'
  use 'windwp/nvim-autopairs'
  use 'petertriho/nvim-scrollbar'
  use 'alexghergh/nvim-tmux-navigation'
  use 'lewis6991/gitsigns.nvim'
  use 'akinsho/bufferline.nvim'
  use 'sindrets/diffview.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use 'ggandor/leap.nvim'
  use 'lukas-reineke/cmp-under-comparator'
  use 'pwntester/octo.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ThePrimeagen/refactoring.nvim'
  use 'ludovicchabant/vim-gutentags'

end)

require('plugins.telescope')
require('plugins.staline')
require('plugins.nvimtree')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.surround')
require('plugins.gitsigns')
require('plugins.project')
require('plugins.alpha')
require('plugins.leap')
require('plugins.octo')
