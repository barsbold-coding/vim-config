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
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', event = 'VeryLazy' },
  'tpope/vim-commentary',
  'alexghergh/nvim-tmux-navigation',
  'ggandor/leap.nvim',
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
  },
  'rebelot/kanagawa.nvim',
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',

  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',

  'nvim-tree/nvim-web-devicons',
  'onsails/lspkind.nvim',
  'p00f/clangd_extensions.nvim',

  'petertriho/nvim-scrollbar',
  'kylechui/nvim-surround',
  'windwp/nvim-autopairs',
  'lewis6991/gitsigns.nvim',
  'tamton-aquib/staline.nvim',
  'akinsho/bufferline.nvim',
  'nvim-tree/nvim-tree.lua',

  'sindrets/diffview.nvim',
})

require('plugins.leap')
require('plugins.tmux')
require('plugins.tele')
require('plugins.harp')
require('plugins.trst')
require('plugins.lspc')
require('plugins.ncmp')
require('plugins.stal')
require('plugins.surr')
require('plugins.tree')
require('scrollbar').setup()
require('gitsigns').setup()

vim.cmd[[colorscheme tokyonight-night]]
