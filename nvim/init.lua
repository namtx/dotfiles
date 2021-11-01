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
paq {'williamboman/nvim-lsp-installer'}
paq {'beauwilliams/focus.nvim'}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

require('nvim-tree').setup {}
require('focus').setup({ signcolumn = false, number = false })

-- Options
g.mapleader = " "
opt.termguicolors = true
opt.number = true
opt.expandtab = true
opt.tabstop = 2
opt.hlsearch = true

-- Commands
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode

-- Mappings

map('n', '<leader>w-', ':vsplit<cr>')
map('n', '<leader>w=', ':sp<cr>')
map('i', 'jk', '<esc>')
map('n', '<leader>wh', ':FocusSplitLeft<cr>', {silent = true})
map('n', '<leader>wl', ':FocusSplitRight<cr>', {silent = true})
map('n', '<leader>wj', ':FocusSplitDown<cr>', {silent = true})
map('n', '<leader>wk', ':FocusSplitUp<cr>', {silent = true})
map('i', '<C-a>', '<C-o>^')
map('i', '<C-e>', '<C-o>$')

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

--- Plugin Mappings
map('n', '<C-p>', ':Files <cr>')
map('n', '<leader>bb', ':Buffers<cr>')
map('n', '<leader>gf', ':GFiles?<cr>')
map('n', '<leader>t', ':NvimTreeToggle<cr>')
map('n', '<leader>hh', ':History<cr>')
map('n', '<leader>/', ':BLines<cr>')
map('n', '<leader>mm', ':Marks<cr>')
map('n', '<leader>gb', ':Git blame<cr>')

--- LSP Mappings
local lsp = require 'lspconfig'
local lsp_installer = require 'nvim-lsp-installer'
require('lspfuzzy').setup {}

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
    cmd [[ do User LspAttachBuffers ]]
end)

map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>gf', '<cmd>lua vim.lsp.buf.definition()<CR>')
