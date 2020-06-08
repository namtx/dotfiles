let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							PLUGINS MANAGER
"

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
	Plug 'mhinz/vim-startify'
	Plug 'rbgrouleff/bclose.vim'
	Plug 'francoiscabrol/ranger.vim'
	Plug 'mhinz/vim-startify'
	Plug 'ThePrimeagen/vim-be-good'
	Plug 'phanviet/vim-monokai-pro'
	Plug 'ayu-theme/ayu-vim'
	Plug 'Yggdroot/indentLine'
	Plug 'vim-airline/vim-airline'
	Plug 'fatih/vim-go'
	Plug 'mattn/emmet-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-sleuth'
call plug#end()

" Vim config
"
set number
set relativenumber
set ruler
set rulerformat=%l\:%c
set cc=120
set timeoutlen=1000 ttimeoutlen=5
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							PLUGINS CONFIGURATIONS
"
if executable('rg')
	set grepprg=rg\ --color=never
	let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	let g:ctrlp_use_catching = 0
endif

" Ranger
let g:ranger_open_new_tab = 1

let g:indentLine_color_term = 239

" CocVim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Vim-fugitive
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gs :G<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							REMAPPINGS
"

" Vim config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Tree
nnoremap <leader>rr :RangerCurrentDirectory<cr>
nnoremap <leader>ss :wq<cr>
" window
nnoremap <leader>w- :vsplit<cr>
nnoremap <leader>w+ :sp<cr>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wt <C-w>T

nmap <leader>p o<Esc>p
inoremap jk <Esc>

" GOTO Code Definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nnoremap <leader>cr :CocRestart

nnoremap <leader>pf :CtrlP<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							LANGUAGE SPECIFIC
"
" Rust
autocmd FileType rust nnoremap <buffer> <leader>ta :! cargo test<cr>
autocmd FileType rust nnoremap <buffer> <leader>te :! cargo run<cr>
" Golang
let g:go_fmt_command = "goimports"
