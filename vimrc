" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set shiftwidth=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================

" ---- willy ting: pathogen
" willyedit fixing pathogen execute infect error
set nocp
""all pathogen#infect()
execute pathogen#infect()
syntax on
filetype plugin indent on

" to use this, use the keys literally (press ] then h then s, etc.)

nmap ]hs <Plug>(GitGutterStageHunk)
nmap ]hu <Plug>(GitGutterUndoHunk)
nmap ]hp <Plug>(GitGutterPreviewHunk)

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" for syntastic
let g:syntastic_python_checkers=['python3']


" for vim!
nmap <Left> gT
nmap <Right> gt


" NERDTree Tabs
"
cnoreabbrev W w
cnoreabbrev NT NERDTreeTabsToggle
cnoreabbrev Nt NERDTreeTabsToggle

cnoreabbrev tb tabedit
cnoreabbrev Tb tabedit
cnoreabbrev Gs Gstatus


let g:nerdtree_tabs_open_on_console_startup=1


let NERDTreeShowHidden=1

let g:airline_theme='murmur'


" You can now copy stuff using yank directly to the clipboard (to CMD+V)
set clipboard=unnamed

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

set background=dark
colorscheme solarized

" vim easymotion binding. WILLYNOTE: This may fk up some stuff tho 
map <Leader> <Plug>(easymotion-prefix)

" EASIER EASYMOTION YOO
nmap c <Leader>


" FZF stuff
cnoreabbrev fz FZF
" Git blame
"
"
cnoreabbrev Gbl Git blame
cnoreabbrev gbl Git blame

" NERD TREE
cnoreabbrev ntf NERDTreeFind


" spacing and tabs
set tabstop=2
set shiftwidth=2

let g:NERDTreeWinSize=20
