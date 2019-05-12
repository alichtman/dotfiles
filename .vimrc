" Indenting configuration. Tabs master race.

" Default in nvim, left in for vim compatibility
set autoindent
set noexpandtab

set smartindent
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
filetype plugin indent on

set encoding=utf8

" breaking
set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40

" 80, 120 character guidelines
"set cc=81
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Highlight current line
set cursorline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Jump from .h to .c file
autocmd BufLeave *.{c,cpp} mark C
autocmd BufLeave *.h       mark H

" Restore cursor position when opening a file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the filename in the window titlebar
set title

" Allow backspace in insert mode
set backspace=indent,eol,start

" Enhance tab completion
set wildmenu
set ruler
set secure

" Tell Vim to automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" store a bunch of undo history
set undolevels=400

" Show matching brackets/parenthesis
set showmatch
" Don't blink when matching
set matchtime=0
" Find as you type search
set incsearch
" Highlight search terms
set hlsearch
" Case insensitive search
set ignorecase
" Case sensitive if we type an uppercase
set smartcase

"Startify config
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

let g:startify_bookmarks = [ {'a': '~/.vimrc'}, {'b': '~/.zshrc'} ]

let g:startify_custom_header = [
            \ '                               ',
            \ '            __                 ',
            \ '    __  __ /\_\    ___ ___     ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\  ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \  ',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\ ',
            \ '     \/__/    \/_/\/_/\/_/\/_/',
\ ]

" NERDTree Config

" Make startify and NERDTree work together
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Close vim if only thing remaining is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden = 1
let NERDTreeStatusline = 0

" vim-easymotion
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Vim Dev Icons
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0

" Disable Markdown folding
let g:vim_markdown_folding_disabled = 1
" Autoresize TOC window
let g:vim_markdown_toc_autofit = 1

" Vim-Plug
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'jremmen/vim-ripgrep'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'

" Tab completion
Plug 'ervandew/supertab'

" File explorer
Plug 'scrooloose/nerdtree'

Plug 'easymotion/vim-easymotion'

" Prettify vim
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
"Plug 'mhartington/oceanic-next'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" TODO: Set up linting and autocomplete
"Plug 'vim-syntastic/syntastic'
"Plug 'w0rp/ale'
"Plug 'davidhalter/jedi-vim'

call plug#end()

" Set SuperTab to scroll down the list instead of up the list
let g:SuperTabDefaultCompletionType = "<c-n>"

" Theme
set background=dark
"set background=light

syntax on

" Better Whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_skip_empty_lines=1
let g:show_spaces_that_precede_tabs=1

" Airline config
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

colorscheme onedark
"colorscheme OceanicNext

" Move the current line above or below
" These mappings also take a count, so 2]e moves the current line 2 lines below.
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" source: http://amix.dk/vim/vimrc.html
