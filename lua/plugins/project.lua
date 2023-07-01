local project_ok, project = pcall(require, 'project_nvim')

if not project_ok then
  return
end

project.setup({
  active = true,
  manual_mode = false,
  dettection_methods = { 'pattern' },
  patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },
  show_hidden = false,
  silent_chdir = true,
  ignore_lsp = {},
})

local tele_ok, telescope = pcall(require, 'telescope')

if not tele_ok then
  return
end

telescope.load_extension('projects')
