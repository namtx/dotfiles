local u = require('utils')

u.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
u.map('n', '<leader>gf', '<cmd>lua vim.lsp.buf.definition()<CR>')
u.map('n', '<leader>do', "<cmd>lua require('fzf-lua').lsp_code_actions()<cr>")

-- <Tab> to navigate the completion menu
u.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
u.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
