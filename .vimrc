" Nikitas Frantzeskakis
" my .vimrc 
" Type :so % to refresh .vimrc at all times
" -----------------------------------------
" 
" Plugins used (TODO remove deprecated)
" -----------------------------------------
" YouCompleteMe
" ag
" ctrlp
" nerdtree
" node
" syntastic
" tlib_vim
" unite.vim
" vim-addon-mw-utils
" vim-airline
" vim-colors-solarized
" Vim-Jinja2-Syntax
" vim-jsdoc
" vim-lucius
" vim-mercenary
" vim-snipmate
" vim-tmux-navigator

set nocompatible

execute pathogen#infect()
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>' use 4 spaces width
set shiftwidth=4

" on pressing tab insert 4 spaces
set expandtab

set number
syntax enable

" --- LUCIOUS COLOR SCHEME SETTINGS ---
"set background=dark
"let g:solarized_termcolors = 256 
"colorscheme solarized
"colorscheme Lucius
"LuciusDarkLowContrast
"LuciusDarkHighContrast

" --- SOLARIZED COLOR SCHEME SETTINGS ---
"let g:solarized_termtrans = 1
set background=dark
colorscheme solarized


" buffer management
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>

" map C-S to save in any mode
noremap <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S>     <C-C>:update<CR>
inoremap <silent> <C-S>     <C-O>:update<CR>

" <leader> + S to save in any mode
map <leader>s <C-S>

" basic ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Setup some default ignores
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
   \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
   \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version control. It also supports works with .svn, .hg, .bzr.
 let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr> 

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" automatically rebalance windows on vim resize
au FocusLost,WinLeave * :silent! wa

" show cursor position at all times
set ruler
" backspace deleting normally in insert mode
set backspace=2 

" default NERDTree size
let NERDTreeWinSize=25
" use <C-n> to toggle NERDTree
map <C-n> :NERDTreeToggle<cr>


" scrolling
" start scrolling when we are 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" zooming
noremap <leader>- :wincmd _<cr>:wincmd \|<cr>
noremap <leader>= :wincmd =<cr>

" airline setup
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"niometrics path
set path=~/niometrics/nio-products/v2/**

"place .swp files in separate directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" enable mouse scrolling/copying!
" for tmux & vim
set ttyfast
set mouse=a
set ttymouse=xterm2

" split panes
set splitbelow
set splitright
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

" HTML editing
set matchpairs+=<:>
let g:html_indent_tags = 'li\|p'

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks
nnoremap <tab> %
vnoremap <tab> %

" access system clipboard
set clipboard=unnamed

" beautify json shortcut
nmap <leader>jj :%!python -m json.tool<cr>

" use jshint
let g:syntastic_javascript_checkers = ['eslint']
" JS syntax checking with JSX support
"let g:syntastic_javascript_checkers = ['jshint', 'eslint']
"
" disable ES5 linting for .jsx files
"autocmd BufNewFile,BufRead *.jsx set filetype=jsx
"let g:syntastic_disabled_filetypes=['jsx']
"
" enable syntax highlighting for .es6, .nunj files
"au BufRead,BufNewFile *.nunj setfiletype jinja
au BufRead,BufNewFile *.nunj set filetype=jinja
autocmd BufNewFile,BufRead *.es6 let b:es6_ext_found = 1
autocmd BufNewFile,BufRead *.es6 set filetype=javascript.es6
autocmd BufNewFile,BufRead *.hyper set filetype=javascript.es6
"autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set ft=jinja 

" show any linting errors immediately
let g:syntastic_check_on_open = 1

" snipmate config
" using Ctrl+J
"imap <C-J> <Plug>snipMateNextOrTrigger<cr>
"smap <C-J> <Plug>snipMateNextOrTrigger<cr>

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h 

let g:ag_working_path_mode="r"

" incsearch
set incsearch
