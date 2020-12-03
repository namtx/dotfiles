let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:deoplete#enable_at_startup = 1

call plug#begin('~/.local/share/nvim/plugged')
	" Editor
	Plug 'Yggdroot/indentLine' " Show indent line
	Plug 'editorconfig/editorconfig-vim'
	Plug 'mattn/emmet-vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-vinegar' " Netrw

	" Git plugins
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the sign col

	" Languages 
	Plug 'fatih/vim-go' " Golang
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
	Plug 'udalov/kotlin-vim'

	" Colors, themes
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'

	Plug 'tpope/vim-eunuch' " VIM sugar for the UNIX shell commands that need it the most
	Plug 'tpope/vim-sleuth' " This plugin automatically adjusts 'shiftwidth' and 'expandtab',
				" heuristically based on the current file

	" Fuzzy search
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Others
	Plug 'easymotion/vim-easymotion'
call plug#end()

" Editor configurations
set ruler
set number
set relativenumber
set cc=120
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set timeoutlen=1000 ttimeoutlen=5
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)
set rulerformat=%l\:%c

" <leader>
let mapleader = " "

" Colors
set termguicolors
colorscheme gruvbox

" VIM configurations
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" VIM mapping
nnoremap <leader>ss :wq<cr>
inoremap jk <Esc>

" Window
nnoremap <leader>w- :vsplit<cr>
nnoremap <leader>w+ :sp<cr>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wt <C-w>T

" Terminal
map <Leader>t :term<cr>
tmap <Leader>t <c-w>:term ++close<cr>
" vim-powered terminal in new tab
map <Leader>T :tab term<cr>
tmap <Leader>T <c-w>:tab term<cr>

" Avoid using arrow keys
nnoremap <Left> 	:echo "Use h instead"<cr>
vnoremap <Left> 	:<C-u>echo "Use h instead"<cr>
inoremap <Left> 	<C-o>:echo "Use h instead"<cr>
nnoremap <Up> 		:echo "Use k instead"<cr>
vnoremap <Up> 		:<C-u>echo "Use k instead"<cr>
inoremap <Up> 		<C-o>:echo "Use k instead"<cr>
nnoremap <Right> 	:echo "Use l instead"<cr>
vnoremap <Right> 	:<C-u>echo "Use l instead"<cr>
inoremap <Right> 	<C-o>:echo "Use l instead"<cr>
nnoremap <Down> 	:echo "Use j instead"<cr>
vnoremap <Down> 	:<C-u>echo "Use j instead"<cr>
inoremap <Down> 	<C-o>:echo "Use j instead"<cr>

" Moving
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^


" =================== PLUGINS CONFIGURATIONS ===================
" indentLine
let g:indentLine_color_term = 239

" CocVim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Vim-fugitive
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gs :G<cr>
nnoremap <silent> <leader>gb :Git blame<cr>

" Coc VIM
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <leader>cr :CocRestart

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" fzf
nnoremap <C-p> :Files<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>fs :Rg<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>gf :GFiles?<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>hh :History<cr>
nnoremap <silent> <leader>ww :Windows<cr>

function! s:searchWordInProject()
  execute 'Rg '.expand('<cword>')
endfunction
nnoremap <silent> <leader>ps :call <SID>searchWordInProject()<cr>

let g:fzf_preview_window = ['right:60%']

" Easymotion
nmap <leader><leader>s <Plug>(easymotion-overwin-2)

" =================== LANGUAGES SUPPORTS ===================
" golang
let g:go_fmt_command = "goimports"

" ReactJS
let g:coc_global_extensions = []
command! -nargs=0 Prettier :CocCommand prettier.formatFile
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" PHPUnit
nnoremap <silent> <leader>tf :call phpfunctions#runPhpUnitTestAllFile()<cr>
nnoremap <silent> <leader>tt :call phpfunctions#runPhpUnitTestOnlyFunction()<cr>
