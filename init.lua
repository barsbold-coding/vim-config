if vim.g.vscode then
  require('keymapping')
else
  require('options')
  require('keymapping')
  require('plugins')
  require('autocommands')
end
