local in_ok, indent_line = pcall(require, 'indent_blankline')

if not in_ok then
  return
end

indent_line.setup({})
