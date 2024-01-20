local tokyo_ok = pcall(require, 'tokyonight')


if tokyo_ok then
  vim.cmd.colorscheme("tokyonight-night")
end


