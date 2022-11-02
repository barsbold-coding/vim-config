" Fundamentals
set number " Show line number
set relativenumber " Make line numbers relative
set syntax=on
set hlsearch " Show highlights on search
set shiftwidth=2
set autoindent
set tabstop=2 
set scrolloff=3
set colorcolumn=80
set mouse=a " Enable mouse navigation
set noshowmode
set statusline=3
set updatetime=800
set cindent

" Call plugins
call plug#begin()

Plug 'EdenEast/nightfox.nvim' " Color Scheme
Plug 'b3nj5m1n/kommentary' " Comment toggler
Plug 'windwp/nvim-autopairs' " Quote and Brackets autopairs
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'tamton-aquib/staline.nvim' " Cool status and buffer lines
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto completions
Plug 'nvim-lua/plenary.nvim' " Overlay window
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " File searcher
Plug 'nvim-tree/nvim-tree.lua' " Tree file explorer
Plug 'lukas-reineke/indent-blankline.nvim' " Indent liner
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
let g:tigris#enabled = 1

" Color Scheme config
let g:solarized_italic_comments = v:true
colorscheme nightfox 
" Set comments italic
highlight Comment gui=italic

" Custom keybindings
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <C-t> <cmd>NvimTreeToggle<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')

" Lua file load
lua << EOLua
vim.opt.laststatus=2
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-autopairs").setup {}
require("staline").setup()
require("nvim-tree").setup()
require("stabline").setup({
	style="slant",
})
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
require('telescope').setup{
	defaults = {
		file_ignore_patterns = {"node_modules"}
	}
}
EOLua
