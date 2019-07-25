let g:python3_host_prog 		= '/usr/bin/python3'
let g:python_host_prog 			= '/usr/bin/python'
let g:deoplete#enable_at_startup 	= 1

" 						PLUGINS CONFIGURATION
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'ruanyl/vim-fixmyjs'
	Plug 'airblade/vim-gitgutter'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
	Plug 'tpope/vim-sleuth'
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	Plug 'mhinz/vim-startify'
call plug#end()

" 						EDITOR CONFIGURATION
" Line number
:set number

"						ESLINT
" let g:fixmyjs_engine	=	'eslint'
" :autocmd BufWritePost *.js :Fixmyjs
"						CTRLP
if executable('rg')
	set grepprg=rg\ --color=never
	let g:ctrlp_user_command		=	'rg %s --files --color=never --glob ""'
	let g:ctrlp_use_catching	= 	0
endif

let mapleader = ","
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>t :Vexplore<cr>
" Rust programming
autocmd FileType rust nnoremap <buffer> <leader>ta :! cargo test<cr>
autocmd FileType rust nnoremap <buffer> <leader>te :! cargo run<cr>

" Tabs size
autocmd FileType javascript setlocal tabstop=2|setl shiftwidth=2|setl softtabstop=2
 
" Netrw
let g:netrw_banner = 0
