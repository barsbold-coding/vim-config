local ts_ok, ts = pcall(require, 'nvim-treesitter.configs')

if not ts_ok then
  return
end

ts.setup({
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
  }
})
