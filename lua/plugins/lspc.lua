local map = require('keymapping')
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.tsserver.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
        languages = {'vue', 'typescript', 'javascript'},
      },
    },
  },
  root_dir = lspconfig.util.root_pattern('package.json', 'index.html'),
  single_file_support = false,
  filetypes = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
  }
}

lspconfig.emmet_language_server.setup {}

lspconfig.volar.setup{
  filetypes = {'vue', 'typescript'}
}
lspconfig.eslint.setup{
  filetypes = {'vue', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact'}
}

lspconfig.clangd.setup {
  filetypes = {'c', 'cpp'}
}

lspconfig.rust_analyzer.setup {
  filetypes = {'rust'},
  capabilities = capabilities,
}
lspconfig.lua_ls.setup {}

lspconfig.sourcekit.setup {
  filetypes = { 'swift' },
  single_file_support = true
}

lspconfig.csharp_ls.setup {}

capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require("clangd_extensions").setup({
  ast = {
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },

    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  }
})
map('n', '<space>e', vim.diagnostic.open_float)
vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
}
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
  end,
})



local signs = { Error = "", Warn = "", Hint = "", Info = "כֿ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

