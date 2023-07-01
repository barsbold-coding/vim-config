local g = vim.g
local o = vim.o
local set = vim.opt
local A = vim.api

local TabWidth = 2

local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 700,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,

  signcolumn = "yes",
  wrap = true,
  linebreak = true,
  scrolloff = 8,
  sidescrolloff = 8,
  whichwrap = "bs<>[]hl",
}

for k, v in pairs(options) do
  o[k] = v
end

-- Editor
set.termguicolors = true
set.clipboard = "unnamedplus"
set.encoding = "utf-8"
set.laststatus = 2
set.showtabline = 2
set.splitbelow = true
set.splitright = true
set.scrolloff = 8
vim.cmd[[set encoding=utf-8]]
vim.cmd[[colorscheme tokyonight-night]]
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

vim.cmd "set noshowmode"

set.wrap = true
set.textwidth = 300

-- Tab and indent
set.expandtab = true
set.shiftwidth = TabWidth
set.tabstop = TabWidth

-- Mouse
set.mouse = 'a'
set.mousefocus = true

set.backup = false
set.writebackup = false
set.updatetime = 300
set.signcolumn = 'yes'
