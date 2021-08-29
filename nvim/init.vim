let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

call plug#begin('~/.local/share/nvim/plugged')
	" Editor
	Plug 'Yggdroot/indentLine' " Show indent line
	Plug 'editorconfig/editorconfig-vim'
	Plug 'mattn/emmet-vim'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-commentary'

	Plug 'tpope/vim-surround'
	" cs'" change single quoutes to double quotes
	" visual S' put visual selected object into single quoutes

	" Git plugins
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the sign col
	Plug 'kdheepak/lazygit.nvim'

	" Languages 
	Plug 'fatih/vim-go' " Golang
	Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
	Plug 'udalov/kotlin-vim'

	" Colors, themes
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'christianchiarulli/nvcode-color-schemes.vim'

	" Status
	" Plug 'glepnir/spaceline.vim'
	" Plug 'vim-airline/vim-airline'

	Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-eunuch' " VIM sugar for the UNIX shell commands that need it the most
	Plug 'tpope/vim-sleuth' " This plugin automatically adjusts 'shiftwidth' and 'expandtab',
				" heuristically based on the current file

	" Fuzzy search
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'honza/vim-snippets'
	Plug 'joaohkfaria/vim-jest-snippets'

	" Others
	Plug 'justinmk/vim-sneak'
	Plug 'itchyny/vim-cursorword'

	" Tree
	" Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'

	" Vim wiki
	Plug 'vimwiki/vimwiki'
	
	Plug 'mhinz/vim-startify'

	" Floaterm
	Plug 'voldikss/vim-floaterm'

	" Code out-line
	Plug 'liuchengxu/vista.vim'

	" Tmux
	" Plug 'tpope/vim-tbone'
	
	" Copy & paste
	Plug 'christoomey/vim-system-copy'
	
	" Scrollbar
	" Plug 'dstein64/nvim-scrollview'
	
	" Which key
	Plug 'liuchengxu/vim-which-key'
call plug#end()

" Editor configurations
set nocompatible
filetype plugin on
syntax on
set ruler
set number
" set relativenumber
set cc=120
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set timeoutlen=1000 ttimeoutlen=5
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)
set rulerformat=%l\:%c
set encoding=utf8
set hidden
set scrolloff=8
set signcolumn=yes
set lazyredraw

" <leader>
let mapleader = " "

" Colors
set termguicolors

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

" Tree
nnoremap <silent> <leader>t :NvimTreeToggle<CR>
nnoremap <silent> <leader>ff :NvimTreeFindFile<cr>
lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
      { key = "v",                            cb = tree_cb("vsplit") },
      { key = "<C-x>",                        cb = tree_cb("split") },
      { key = "t",                            cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "P",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "<S-CR>",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "K",                            cb = tree_cb("first_sibling") },
      { key = "J",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[c",                           cb = tree_cb("prev_git_item") },
      { key = "]c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "s",                            cb = tree_cb("system_open") },
      { key = "q",                            cb = tree_cb("close") },
      { key = "g?",                           cb = tree_cb("toggle_help") },
    }
EOF

nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" vim-powered terminal in new tab
map <leader>T :tab term<cr>
tmap <leader>T <c-w>:tab term<cr>

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
" Colors
" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "haskell" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "haskell" },  -- list of language that will be disabled
  },
}
EOF

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Airline
let g:airline_powerline_fonts = 1

" indentLine
let g:indentLine_color_term = 239

" Vim-fugitive
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gs :G<cr>
nnoremap <silent> <leader>gb :Git blame<cr>

" Lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

" CocVim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <leader>cr :CocRestart<cr>
nnoremap <leader>cd :CocDiagnostics<cr>

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

" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" fzf
nnoremap <C-p> :Files<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>fs :Rg<cr>
nnoremap <silent> <leader>gf :GFiles?<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>hh :History<cr>

" nnoremap <silent> <leader>ww :Windows<cr>

function! s:searchWordInProject()
  execute 'Rg '.expand('<cword>')
endfunction
nnoremap <silent> <leader>ps :call <SID>searchWordInProject()<cr>

let g:fzf_preview_window = ['right:60%']

" Floaterm
let g:floaterm_wintype = 'split'
let g:floaterm_keymap_new    = '<leader>fn'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<leader>ft'
let g:floaterm_height = 0.4

" vimwiki
nmap <Leader>tl <Plug>VimwikiToggleListItem
vmap <Leader>tl <Plug>VimwikiToggleListItem
let g:vimwiki_listsyms = '✗○◐●✓'

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_customwiki2html='~/.local/share/nvim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'

" sneak.vim
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

" =================== LANGUAGES SUPPORTS ===================
" Golang
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
