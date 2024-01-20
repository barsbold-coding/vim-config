local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

map('n', '<space>e', ':NvimTreeToggle<cr>', {silent = true})

local tmux_ok, nvim_tmux_nav = pcall(require, 'nvim-tmux-navigation')

if tmux_ok then
  nvim_tmux_nav.setup({
    disable_when_zoomed = true,
  })

  map('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
  map('n', '<C-t>', nvim_tmux_nav.NvimTmuxNavigateDown)
  map('n', '<C-n>', nvim_tmux_nav.NvimTmuxNavigateUp)
  map('n', '<C-s>', nvim_tmux_nav.NvimTmuxNavigateRight)
end

local builtin_ok, builtin = pcall(require, 'telescope.builtin')

if builtin_ok then
  map('n', '<space>f', builtin.find_files)
  map('n', '<space>b', builtin.buffers)
  map('n', '<space>F', builtin.live_grep)
  map('n', '<space>df', builtin.diagnostics)
end

-- Dvorak - Normal
map("n", "h", "h")
map("n", "t", "j")
map("n", "n", "k")
map("n", "s", "l")

map("n", "T", "6j")
map("n", "N", "6k")
map("n", "H", ":bprev<cr>", {silent = true})
map("n", "S", ":bnext<cr>", {silent = true})

-- Dvorak - Visual
map("v", "h", "h")
map("v", "t", "j")
map("v", "n", "k")
map("v", "s", "l")

map("v", "T", "6j")
map("v", "N", "6k")

map('n', 'm', 'n')
map('n', 'M', 'N')

-- Stays in visual mode after indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up or down
map("v", "<A-n>", ":m .+1<CR>==")
map("v", "<A-t>", ":m .-2<CR>==")
map("v", "p", '"_dP')

map("n", 'llb', 'yyp')
map("n", 'llt', 'yyP')

-- Refactoring keymaps
vim.api.nvim_set_keymap("v", "<space>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<space>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<space>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})


map('n', 'k', function ()
  local current_window = vim.fn.win_getid()
  require('leap').leap { target_windows = { current_window } }
end)

map('v', 'k', function ()
  local current_window = vim.fn.win_getid()
  require('leap').leap { target_windows = { current_window } }
end)

map('n', 'K', function ()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows_on_tabpage }
end)

map('n', '<space>cc', ':bd<cr>', {silent = true})

map('n', '<space>gl', ':Gitsign toggle_current_line_blame<cr>', {silent = true})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'J', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- Harpoon Markings
local marks_ok, marks = pcall('harpoon.mark')

if marks_ok then
  map('n', '<leader>ma', marks.add_file, { silent = true })
  map('n', '<leader>md', marks.rm_file, { silent = true })
  map('n', '<leader>mD', marks.clear_all, { silent = true })
  map('n', '<leader>mt', ':Telescope harpoon marks<cr>', { silent = true })
end

