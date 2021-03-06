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
" vim-rooter
" vim-airline
" vim-airline-themes
" vim-colors-solarized
" Vim-Jinja2-Syntax
" vim-jsdoc
" vim-lucius
" vim-mercenary
" vim-snipmate
" vim-tmux-navigator
" vim-flow
" vim-easymotion
" vim-surround
" auto-pairs
" indentLine
" emmet-vim
"


set nocompatible

execute pathogen#infect()
filetype plugin indent on

" SOFT TABS
" show existing tab with 4 spaces width
"set tabstop=4

" when indenting with '>' use 4 spaces width
"set shiftwidth=4

" on pressing tab insert 4 spaces
"set expandtab
"
" HARD TABS
set shiftwidth=4
set tabstop=4

set number
syntax enable

"let g:solarized_termcolors = 256 

" --- LUCIOUS COLOR SCHEME SETTINGS ---
"set background=dark
colorscheme solarized
"colorscheme Lucius
"LuciusDarkLowContrast
"LuciusDarkHighContrast

" --- SOLARIZED COLOR SCHEME SETTINGS ---
"let g:solarized_termtrans = 1
set background=dark
"set background=light


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
"noremap <silent> <C-S>      :update<CR>
"vnoremap <silent> <C-S>     <C-C>:update<CR>
"inoremap <silent> <C-S>     <C-O>:update<CR>

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
"Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" solarized for airline
let g:airline_theme = 'solarized'

"path
"set path=~/niometrics/nio-products/v2/**
set path=~/niometrics/nio-products/v2

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_enable_signs = 1

" use jshint
let g:syntastic_javascript_checkers = ['eslint']
" JS syntax checking with JSX support
"let g:syntastic_javascript_checkers = ['jshint', 'eslint']
"
" disable ES5 linting for .jsx files
"autocmd BufNewFile,BufRead *.jsx set filetype=jsx
"let g:syntastic_disabled_filetypes=['jsx']
"
" enable syntax highlighting for .es6, .swig, .nunj files
"au BufRead,BufNewFile *.nunj setfiletype jinja
au BufRead,BufNewFile *.nunj set filetype=jinja
au BufRead,BufNewFile *.swig set filetype=jinja
autocmd BufNewFile,BufRead *.es6 let b:es6_ext_found = 1
autocmd BufNewFile,BufRead *.es6 set filetype=javascript.es6
autocmd BufNewFile,BufRead *.hyper set filetype=javascript.es6
"autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set ft=jinja 

" show any linting errors immediately
"let g:syntastic_check_on_open = 1

" snipmate config
" using Ctrl+J
"imap <C-J> <Plug>snipMateNextOrTrigger<cr>
"smap <C-J> <Plug>snipMateNextOrTrigger<cr>

" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h 
"
" vim-rooter config
" -----------------
autocmd BufEnter * :Rooter
" 
" uncomment the following to use <Leader>cd to invoke vim 
" rooter only
"let g:rooter_manual_only = 1

" incsearch
set incsearch

" The Silver Searcher
"let g:ag_prg="<path> --vimgrep"
"let g:ag_working_path_mode="r"

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

endif
"nnoremap L :Ag<SPACE>
"
"FLOW plugin config
" disable (temporary)
let g:flow#enable = 0

" Use CTRL-S for saving, also in Insert mode
" note: this requires to include stty -ixon into
" your .zshrc or .bashrc to work
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>


" tests
"let g:solarized_bold = 0
"let g:solarized_contrast = "low"
"let g:solarized_termcolors = 256
"colorscheme solarized
set cursorline
"set cursorcolumn
"hi CursorLine cterm=NONE ctermbg=117 ctermfg=NONE guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=darkred guifg=white
"
"

" Relative line numbers
set number
set relativenumber

" Edit .vimrc with <Leader>ev
nmap <Leader>ev :e $MYVIMRC<cr>


" Automaticall source .vimrc after edit
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" Show linebreaks more clearly
set breakindent
set formatoptions=l
set lbr
set showbreak=**\ \

" Jump to the end of the line
inoremap ii <Esc>$a

" Leave insert mode quickly
inoremap jk <Esc>

" Remap ; to :
nnoremap ; :

" Emmet configs
" Apply JSX expansions when in javascript filetype
let g:user_emmet_settings={'javascript': {'extends':'jsx'}}

" NOTES
" --------------------
" Edit .vimrc file \ev
" 
" Change the surrounding chars
"     cs (change surrounding) <old char> <new char>
"
" Easymotion example
" <Leader><Leader>w
" <Leader><Leader>fo (when looking for an 'o')
"
" Default emmet key <C-y> 
