local leap_ok, leap = pcall(require, 'leap')

if not leap_ok then
  return
end

leap.init_highlight(true)
leap.opts.safe_labels = {
  'e', 'p', 'y', 'k', 'j', 'q', 'w', 'z', 'g', 'c', 'r', 'l', 'u',
  'E', 'U', 'K', 'J', 'Q', 'W', 'Z', 'G', 'C', 'R', 'L'
}
