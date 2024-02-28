local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

local status, telescope = pcall(require, 'telescope')

if not status then
  return
end

telescope.setup {
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip"},
    },
  }
}

local builtin_ok, builtin = pcall(require, 'telescope.builtin')

if builtin_ok then
  map('n', '<leader>f', builtin.find_files)
  map('n', '<leader>b', builtin.buffers)
  map('n', '<leader>F', builtin.live_grep)
  map('n', '<leader>df', builtin.diagnostics)
  map('n', '<leader>/', builtin.current_buffer_fuzzy_find)
end

print(vim.keycode('<leader>'))
