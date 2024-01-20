local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 30,
    side = "left",
  },
})
require'nvim-web-devicons'.setup()
