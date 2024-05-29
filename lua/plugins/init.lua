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
  'saadparwaiz1/cmp_luasnip',

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

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  {
    'zbirenbaum/copilot.lua',
    config = function ()
      require('copilot').setup({})
    end
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  }
})

pcall(require, 'plugins.leap')
pcall(require, 'plugins.tmux')
pcall(require, 'plugins.tele')
pcall(require, 'plugins.harp')
pcall(require, 'plugins.trst')
pcall(require, 'plugins.lspc')
pcall(require, 'plugins.snip')
pcall(require, 'plugins.ncmp')
pcall(require, 'plugins.stal')
pcall(require, 'plugins.surr')
pcall(require, 'plugins.tree')
pcall(require, 'plugins.sign')
-- pcall(require, 'plugins.copi')
require('scrollbar').setup()

vim.cmd[[colorscheme tokyonight-night]]
