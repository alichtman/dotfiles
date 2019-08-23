" .vimrc for Neovim
" Aaron Lichtman

""""""""""""""""""
" General Settings
""""""""""""""""""

set nocompatible
set autoindent
set noexpandtab

" Indenting configuration.
set smartindent
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
filetype plugin indent on

set encoding=utf-8
set autochdir
set nostartofline              " Don’t reset cursor to start of line when moving around.
set title                      " Show the filename in the window titlebar
set backspace=indent,eol,start " Allow backspace in insert mode

" Tab completion menu
set wildmenu
set wildmode=full

set ruler
set secure

" Undo
set undolevels=1000  " store a bunch of undo history
set undofile

" Automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Go to file
set suffixesadd=.md,.c,.h,.cpp,.py,.tex

" Search Config
set showmatch   " Show matching brackets/parenthesis
set matchtime=0 " Don't blink when matching
set incsearch   " Find as you type search
set hlsearch    " Highlight search terms
set ignorecase  " Case insensitive search
set inccommand=nosplit " Show regex replacement changes as you're typing
set smartcase   " Case sensitive if we type an uppercase

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

" Set , as leader
let mapleader = ","

" Yeet
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Use jk or kj for Escape
:imap jk <Esc>
:imap kj <Esc>

" Make help always appear as vertical split.
cabbrev h vert h

" Distraction Free Mode
nnoremap <silent> <leader>z :Goyo<cr>

"Traverse the buffer list more easily.
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Move the current line above or below with ALT + [j/k]
nnoremap <A-j> :<c-u>execute 'move +'. v:count1<cr>
nnoremap <A-k> :<c-u>execute 'move -1-'. v:count1<cr>

" Make j and k operate on virtual lines, not real lines.
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en

" Enable spellcheck for markdown and txt files
"autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd BufRead,BufNewFile *.txt set filetype=text
"autocmd FileType markdown setlocal spell
"autocmd FileType text setlocal spell
"hi SpellBad cterm=underline ctermfg=red

"""""""""
" Plugins
"""""""""
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'jremmen/vim-ripgrep'
Plug 'sheerun/vim-polyglot'

" Automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'

" Tab Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File explorer.
Plug 'scrooloose/nerdtree'

Plug 'easymotion/vim-easymotion'

" Git
Plug 'tpope/vim-fugitive'

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
"TODO: Plug 'w0rp/ale'

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

let g:gruvbox_contrast_dark='dark'

" Theme
set background=dark
"set background=light

""""""
" CoC Config
" https://github.com/neoclide/coc.nvim#example-vim-configuration
""""""

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

""""""""""""""""
" End CoC Config
""""""""""""""""

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
			\ {'c': '~/.tmux.conf'},
			\ {'d': '~/Desktop/personal/'},
			\ {'e': '~/Desktop/Development/notes'} ]

let g:startify_custom_header = [
            \ '                               ',
            \ '            __',
            \ '    __  __ /\_\    ___ ___',
            \ '   /\ \/\ \\/\ \ /'' __` __`\',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\',
            \ '     \/__/    \/_/\/_/\/_/\/_/',
			\ ]

let g:startify_files_number = 8
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

"""""""""""""
" Status Line
"""""""""""""

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
