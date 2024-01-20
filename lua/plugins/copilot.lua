local ok, copilot = pcall(require, "copilot");

if not ok then
  return
end

copilot.setup({
  filetypes = {
    c = false,
    cpp = false,
    javascript = false,
    typescript = false,
    javascriptreact = false,
    typescriptreact = false,
  },
  suggestion = { enabled = false },
  panel = { enabled = false },
})
