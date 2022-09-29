
" Fundamental{{{
set number
set relativenumber
set syntax=on
set hlsearch
set autowrite
set autoindent
set titlestring=string
set title
set confirm
set ignorecase
set shiftwidth=2
set tabstop=2
set scrolloff=2
set cursorline
set cursorcolumn
set mouse=a
set foldenable
set foldmethod=marker
set foldnestmax=2
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=number
set colorcolumn=80

" }}}

" Plugins{{{
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'https://github.com/ellisonleao/gruvbox.nvim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/cohama/lexima.vim'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }
Plug 'mxw/vim-jsx'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()
"}}}

" Key mapping {{{
nnoremap Y "*y
vnoremap Y "*y
"}}}

" COC config{{{
" 	TAB key
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
"}}}

" NERDTree config {{{

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"}}}

" Gruvbox config {{{
set background=dark
colorscheme gruvbox
" }}}

" Lightline config {{{
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
			\ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'coffee' ] ]
			\ },
			\ 'component': {
			\ 	'coffee': '☕️'
      \ },
			\ 'component_function': {
			\ 	'coffee': 'LightlineCoffee'
			\	},
      \ }

function! LightlineCoffee()
  return winwidth(0) > 70 ? '☕️' : ''
endfunction
" }}}

" Fuzzy finder config{{{
" FZF key bindings
nnoremap <C-f> :FZF<CR>
nnoremap F :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }
"}}}

" Prettier config {{{
let g:neoformat_try_node_exe = 1
autocmd BufWritePre *.js Neoformat
"}}}

" TreeSitter config{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
"}}}

" Put this in your .vimrc
augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END
