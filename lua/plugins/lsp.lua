local mason_ok, mason = pcall(require, 'mason')
local null_ok, null_ls = pcall(require, 'null-ls')
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
local scrollbar_ok, scrollbar = pcall(require, 'scrollbar')

if not mason_ok and not null_ok and not lspconfig_ok then
  return
end

mason.setup()

-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  code_actions.gitsigns,
--   formatting.eslint,
})

-- lspconfig.tsserver.setup {
--   root_dir = lspconfig.util.root_pattern('package.json', 'index.html'),
--   single_file_support = false,
--   filetypes = {'typescript', 'javascript', 'typescriptreact', 'javascriptreact'}
-- }
lspconfig.denols.setup {
  root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
}
lspconfig.eslint.setup {}
lspconfig.clangd.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.jedi_language_server.setup {}
lspconfig.volar.setup{
  filetypes = {'vue', 'typescript'}
}
lspconfig.rust_analyzer.setup {
  single_file_support = true,
}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      workspace = {
        library = vim.tbl_extend("keep",
          {"/usr/lib/lua-language-server/meta/template"},
        vim.api.nvim_get_runtime_file("", true)),
      },
    },
  },
}

vim.diagnostic.config {
  virtual_text = false,
}
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

if not scrollbar_ok then
  return
end

require('scrollbar').setup()
