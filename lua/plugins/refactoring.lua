local rf_ok, rf = pcall(require, 'refactoring')

if not rf_ok then
  return
end

rf.setup({})
