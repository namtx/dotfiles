local u = require('utils')

require('focus').setup({ signcolumn = false, number = false })

u.map('n', '<leader>wh', ':FocusSplitLeft<cr>', { silent = true })
u.map('n', '<leader>wl', ':FocusSplitRight<cr>', { silent = true })
u.map('n', '<leader>wj', ':FocusSplitDown<cr>', { silent = true })
u.map('n', '<leader>wk', ':FocusSplitUp<cr>', { silent = true })

