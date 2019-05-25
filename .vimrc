" .vimrc for Neovim
" Aaron Lichtman

""""""""""""""""""
" General Settings
""""""""""""""""""
set autoindent
set noexpandtab

set nocompatible

" Indenting configuration.
set smartindent
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
filetype plugin indent on

set encoding=utf8
set autochdir

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the filename in the window titlebar
set title

" Allow backspace in insert mode
set backspace=indent,eol,start

" Tab completion menu
set wildmenu
set wildmode=full

set ruler
set secure

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Tell Vim to automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" store a bunch of undo history
set undolevels=1000

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

" Enable spellcheck for markdown and txt files
"set spelllang=en
"autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd BufRead,BufNewFile *.txt set filetype=text
"autocmd FileType markdown setlocal spell
"autocmd FileType text setlocal spell
"hi SpellBad cterm=underline ctermfg=red

" Fix weird line tracers while scrolling bug
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" breaking
set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40

" TODO: 80, 120 character guidelines. Not sure why this doesn't work... classic.
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


" Disable Markdown folding
let g:vim_markdown_folding_disabled = 1
" Autoresize TOC window
let g:vim_markdown_toc_autofit = 1

"""""""""""""""""""""""""
" Key/Command Remappings
"""""""""""""""""""""""""

" Yeet
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Make help always appear as vertical split.
cabbrev h vert h

" Distraction Free Mode
nnoremap <silent> <leader>z :Goyo<cr>

" Move the current line above or below
" These mappings also take a count, so 2]e moves the current line 2 lines below.
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

"Traverse the buffer list more easily.
"Taken from Tim Pope’s unimpaired.vim plugin
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"Force myself to use h,j,k,l for navigation
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" source: http://amix.dk/vim/vimrc.html

" Make j and k operate on virtual lines, not real lines.
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

"""""""""
" Plugins
"""""""""
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'jremmen/vim-ripgrep'
Plug 'sheerun/vim-polyglot'

" Automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'

" Tab completion
Plug 'ervandew/supertab'

" File explorer. Possibly replace with vifm or vimfiler
Plug 'scrooloose/nerdtree'

Plug 'easymotion/vim-easymotion'

" Prettify vim
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'nightsense/snow'
Plug 'mhartington/oceanic-next'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tables and alignment
Plug 'godlygeek/tabular'

" Markdown
Plug 'plasticboy/vim-markdown'

" Lists
Plug 'dkarter/bullets.vim'

" Distraction-Free Writing
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Linting and autocomplete
" Syntastic is really really slow...
Plug 'vim-syntastic/syntastic'
"Plug 'w0rp/ale'

" Timetracking
Plug 'wakatime/vim-wakatime'

call plug#end()

"""""""""""""""""
" Plugin Settings
"""""""""""""""""

" Yeah, I should really have been writing code instead of picking different
" themes for my terminal...
"colorscheme snow
colorscheme gruvbox
"colorscheme onedark
"colorscheme OceanicNext

" Set SuperTab to scroll down the list instead of up the list
let g:SuperTabDefaultCompletionType = "<c-n>"

" Theme
set background=dark
"set background=light

let python_highlight_all=1
syntax on

"Startify config
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

let g:startify_bookmarks = [
			\ {'a': '~/.vimrc'},
			\ {'b': '~/.zshrc'},
			\ {'c': '~/Desktop/Aaron/todo.md'},
			\ {'d': '~/Desktop/Development/security/notes'},
			\ {'e': '~/Desktop/Development/security/notes/books/practical-binary-analysis'},
			\ {'f': '~/Desktop/Development/notes'} ]

let g:startify_custom_header = [
            \ '                               ',
            \ '            __',
            \ '    __  __ /\_\    ___ ___',
            \ '   /\ \/\ \\/\ \ /'' __` __`\',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\',
            \ '     \/__/    \/_/\/_/\/_/\/_/',
\ ]

let g:startify_files_number = 6
let g:startify_update_oldfiles = 0
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1

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

" Better Whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_skip_empty_lines=1
let g:show_spaces_that_precede_tabs=1

" Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""
" NerdCommenter
"""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""
" Bullets.vim
"""""""""""""
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

"""""""""""
" Syntastic
"""""""""""
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
