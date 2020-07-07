let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							PLUGINS MANAGER
"

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'airblade/vim-gitgutter'
	"Plug 'ctrlpvim/ctrlp.vim'
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
	Plug 'morhetz/gruvbox'
	Plug 'dyng/ctrlsf.vim'
	Plug 'tpope/vim-repeat'
	Plug 'easymotion/vim-easymotion'
	Plug 'voldikss/vim-floaterm'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
call plug#end()

" Vim config
"
set number
set relativenumber
set ruler
set rulerformat=%l\:%c
set cc=120
set timeoutlen=1000 ttimeoutlen=5
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)

let mapleader = " "

colorscheme gruvbox

"=====PLUGINS CONFIGURATIONS======
nnoremap <C-p> :Files<cr>

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

" ctrlsf
let g:ctrlsf_auto_focus = {
	\ 'at': 'start',
	\ }

nmap <leader>sf <Plug>CtrlSFPrompt
nmap <leader>ff <Plug>CtrlSFCwordPath<cr>


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

" Avoid using arrow keys
nnoremap <Left> :echo "Use h instead"<cr>
vnoremap <Left> :<C-u>echo "Use h instead"<cr>
inoremap <Left> <C-o>:echo "Use h instead"<cr>

nnoremap <Up> :echo "Use k instead"<cr>
vnoremap <Up> :<C-u>echo "Use k instead"<cr>
inoremap <Up> <C-o>:echo "Use k instead"<cr>

nnoremap <Right> :echo "Use l instead"<cr>
vnoremap <Right> :<C-u>echo "Use l instead"<cr>
inoremap <Right> <C-o>:echo "Use l instead"<cr>

nnoremap <Down> :echo "Use j instead"<cr>
vnoremap <Down> :<C-u>echo "Use j instead"<cr>
inoremap <Down> <C-o>:echo "Use j instead"<cr>

" Moving
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							LANGUAGE SPECIFIC
"
" Golang
let g:go_fmt_command = "goimports"
