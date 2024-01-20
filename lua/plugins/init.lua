local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'folke/tokyonight.nvim',
  'tamton-aquib/staline.nvim',
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', event = 'VeryLazy' },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-commentary',
  'nvim-lualine/lualine.nvim',
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  'williamboman/mason.nvim',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'dcampos/nvim-snippy',
  'hrsh7th/nvim-cmp',
  'kylechui/nvim-surround',
  'windwp/nvim-autopairs',
  'petertriho/nvim-scrollbar',
  'alexghergh/nvim-tmux-navigation',
  'lewis6991/gitsigns.nvim',
  'akinsho/bufferline.nvim',
  'sindrets/diffview.nvim',
  'ahmedkhalf/project.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'goolord/alpha-nvim',
  'ggandor/leap.nvim',
  'lukas-reineke/cmp-under-comparator',
  'pwntester/octo.nvim',
  'nvim-treesitter/nvim-treesitter',
  'ThePrimeagen/refactoring.nvim',
  'ThePrimeagen/harpoon',
  'zbirenbaum/copilot.lua',
  'zbirenbaum/copilot-cmp',
  'onsails/lspkind-nvim',
  'smjonas/inc-rename.nvim',
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
})

require('plugins.telescope')
require('plugins.treesitter')
require('plugins.staline')
require('plugins.nvimtree')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.surround')
require('plugins.gitsigns')
require('plugins.project')
require('plugins.alpha')
require('plugins.leap')
require('plugins.theme')
require('plugins.octo')
require('plugins.copilot')
require('plugins.rename')
require('plugins.noice')
