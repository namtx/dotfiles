local M = {}

vim.api.nvim_set_hl(0, 'WinbarFilePathHL', { bg = '#21202e', fg = '#f6c177'})
vim.api.nvim_set_hl(0, 'WinbarModifiedHL', { bg = '#21202e', fg = '#3e8fb0'})

function M.statusline()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%m', {}).str
  
  file_path = file_path:gsub('~', 'ﴥ')
  file_path = file_path:gsub('/', ' / ')
 
  return '%#WinbarFilePathHL#'
    .. file_path
    .. '%*'
    .. '%#WinbarModifiedHL#'
    .. ' '
    .. modified

end

return M
