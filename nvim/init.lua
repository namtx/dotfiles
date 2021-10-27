--- Helpers
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- Plugins
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'christoomey/vim-system-copy'}
paq {'tpope/vim-surround'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}
paq {'tpope/vim-sleuth'}
paq {'tpope/vim-commentary'}
paq {'Yggdroot/indentLine'}
paq {'tpope/vim-fugitive'}
paq {'itchyny/vim-cursorword'}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

require('nvim-tree').setup {}

--- Options
g.mapleader = " "
opt.termguicolors = true
opt.number = true
opt.expandtab = true
opt.tabstop = 2
opt.hlsearch = true

--- Mappings

map('n', '<leader>w-', ':vsplit<cr>')
map('n', '<leader>w=', ':sp<cr>')
map('i', '<leader>jk', '<esc>')
map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wl', '<C-w>l')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
-- moving in insert mode
map('i', '<C-a>', '<C-o>^')
map('i', '<C-e>', '<C-o>$')

--- Plugin Mappings
map('n', '<C-p>', ':Files <cr>')
map('n', '<leader>bb', ':Buffers<cr>')
map('n', '<leader>gf', ':GFiles?<cr>')
map('n', '<leader>t', ':NvimTreeToggle<cr>')
map('n', '<leader>hh', ':History<cr>')
map('n', '<leader>/', ':BLines<cr>')
map('n', '<leader>mm', ':Marks<cr>')
map('n', '<leader>gb', ':Git blame<cr>')
