require('mason').setup()

local null_ls = require('null-ls')
-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  code_actions.gitsigns,
--   formatting.eslint,
})


local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern('package.json', 'index.html'),
  single_file_support = false,
}
lspconfig.denols.setup {
  root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
}
lspconfig.eslint.setup {}
lspconfig.clangd.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.rust_analyzer.setup {}
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


require('scrollbar').setup()
