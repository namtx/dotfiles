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
"
"  - to go up
"  I to toggle style
"  gh to toggle hidden dotfiles 
"  . to pre-populate file path at the end of `:`
"  y. to yank file path
"  ~ to go home
"  <c-6> to switch back to the previous buffer from the netw buffer
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
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = " "

colorscheme gruvbox


" Ranger
let g:ranger_open_new_tab = 1

let g:indentLine_color_term = 239

" CocVim
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Vim-fugitive
"
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gs :G<cr>

" ctrlsf
"
let g:ctrlsf_auto_focus = {
	\ 'at': 'start',
	\ }

nmap <leader>sf <Plug>CtrlSFPrompt
nmap <leader>ff <Plug>CtrlSFCwordPath<cr>


" Vim config
"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Tree
"
nnoremap <leader>rr :RangerCurrentDirectory<cr>
nnoremap <leader>ss :wq<cr>

" Window
"
nnoremap <leader>w- :vsplit<cr>
nnoremap <leader>w+ :sp<cr>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wt <C-w>T

nmap <leader>p o<Esc>p
inoremap jk <Esc>

" Coc VIM
"
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nnoremap <leader>cr :CocRestart
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
"
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Avoid using arrow keys
"
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
"
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" FZF
" https://github.com/junegunn/fzf.vim#commands
"
nnoremap <C-p> :Files<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>fs :Rg<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>gf :GFiles?<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>hh :History<cr>
nnoremap <silent> <leader>ww :Windows<cr>

" Terminal
"
" vim-powered terminal in split window
map <Leader>t :term<cr>
tmap <Leader>t <c-w>:term ++close<cr>

" vim-powered terminal in new tab
map <Leader>T :tab term<cr>
tmap <Leader>T <c-w>:tab term<cr>

" Golang
"
let g:go_fmt_command = "goimports"

" Git
"
nnoremap <silent> <leader>gb :Git blame<cr>

" Functions
function! s:runPhpUnitTestAllFile()
  set shellcmdflag=-ic
  execute('FloatermNew '.'phpunit '.expand('%:p'))
endfunction
nnoremap <silent> <leader>tf :call <SID>runPhpUnitTestAllFile()<cr>

function! s:runPhpUnitTestOnlyFunction()
  set shellcmdflag=-ic
  execute('FloatermNew '.'phpunit '.expand('%:p').' --filter '.expand('<cword>'))
endfunction
nnoremap <silent> <leader>tt :call <SID>runPhpUnitTestOnlyFunction()<cr>
