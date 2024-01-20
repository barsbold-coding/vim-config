local rename_ok, rename = pcall(require, 'inc_rename')
local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

if not rename_ok then
  return
end

rename.setup({
  preview_empty_name = false,
})

map('n', '<space>rn', ':IncRename ', { silent = true })
