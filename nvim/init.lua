--- Helpers
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

--- Plugins
cmd 'packadd paq-nvim'
local paq = require('paq').paq
paq {'savq/paq-nvim', opt = true}
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
paq {'neovim/nvim-lspconfig'}
paq {'ibhagwan/fzf-lua'}
paq {'vijaymarupudi/nvim-fzf'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'christoomey/vim-system-copy'}
paq {'tpope/vim-surround'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}
paq {'tpope/vim-sleuth'}
paq {'tpope/vim-commentary'}
paq {'Yggdroot/indentLine'}
paq {'tpope/vim-fugitive'}
paq {'williamboman/nvim-lsp-installer'}
paq {'beauwilliams/focus.nvim'}
paq {'github/copilot.vim'}
paq {'voldikss/vim-floaterm'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-project.nvim'}
paq {'vim-autoformat/vim-autoformat'} -- format

g['deoplete#enable_at_startup'] = 1

-- Options
g.mapleader = " "
opt.termguicolors = true
opt.number = true
opt.expandtab = true
opt.tabstop = 2
opt.hlsearch = true
opt.winbar = "%{%v:lua.require('modules.core.winbar').statusline()%}"

-- Commands
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
cmd 'colorscheme default'

_G.global = {}

require('modules.core')
require('modules.plugins')
require('modules.lsp')
