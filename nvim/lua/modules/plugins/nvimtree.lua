local u = require('utils')

require('nvim-tree').setup {}

u.map('n', '<leader>t', ':NvimTreeToggle<cr>')
u.map('n', '<leader>tr', ':NvimTreeFindFileToggle<cr>')
