local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('c', {
  s('print', {
    t('printf("'),
    i(1),
    t(' = %d\\n", '),
    i(2),
    t(');'),
  }),
  s('fori', {
    t('for (int i = 0; i < '),
    i(1),
    t('; ++i) {'),
    t(''),
    t('\t'),
    t(''),
    i(2),
    t('}'),
  }),
})
