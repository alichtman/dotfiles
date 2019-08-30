" .vimrc for Neovim
" Aaron Lichtman

"""""""
" TODO
" Wrap every autocommand in an augroup with multiple autocommands in the same group if it makes sense
" Better logical organization of settings

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
""""""""""""""""""
" General Settings
""""""""""""""""""

set nocompatible
set encoding=utf-8
set autochdir
set nostartofline  " Don’t reset cursor to start of line when moving around.
set title        " Show the filename in the window titlebar
set backspace=indent,eol,start " Allow backspace in insert mode
set modeline
set ruler
set secure
set spelllang=en

" Tab completion menu
set wildmenu
set wildmode=full

" Undo
set undolevels=1000  " store a bunch of undo history
set undofile

" Automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode
set number

augroup lineNumbers
	autocmd InsertEnter * :set number
	autocmd InsertLeave * :set relativenumber
augroup END

" Use gtf to jump to files with these extensions
set suffixesadd=.md,.c,.h,.cpp,.py,.tex

" Don't treat hyphens and underscores like whitespace
set iskeyword+=-
set iskeyword+=_

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

" Line breaking
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

" Restore cursor position when opening a file
autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\   execute "normal! g`\"" |
			\ endif

" Close vim if the quickfix window is the only window visible (and only tab)
" https://stackoverflow.com/a/7477056
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

" Disable Markdown folding
let g:vim_markdown_folding_disabled = 1
" Autoresize TOC window
let g:vim_markdown_toc_autofit = 1

""""""""""""""
" Indentataion
""""""""""""""

set autoindent
set smartindent
set copyindent
set preserveindent
" Use tabs, not spaces. #TabsMasterRace
set noexpandtab
set softtabstop=4
" Control how many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=4
" How many spaces a tab is
set tabstop=4
filetype plugin indent on

""""""""""""
" Remappings
""""""""""""

" Set , as leader
let mapleader = ","
let maplocalleader = "-"

" Quickly edit dotfiles
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" Yeet those "Not an editor command" errors right out the fucking window
" Or, defenestrate, as my Dad would say.
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! Qa qa

" Use jk or kj for Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Quoting Shortcuts
" TODO: tpope/vim-surround instead?
" nnoremap <leader>" viw<esc>bi"<esc>ea"<esc>lel
" nnoremap <leader>' viw<esc>bi'<esc>ea'<esc>lel
" nnoremap <leader>` viw<esc>bi`<esc>ea`<esc>lel

" Make help always appear as a vertical split.
cabbrev h vert h

" Insert mdash
iabbrev <buffer> --- &mdash

" Distraction Free Mode
nnoremap <silent> <leader>z :Goyo<cr>

"Traverse the buffer list more easily.
nnoremap <silent> b[ :bprevious<CR>
nnoremap <silent> b] :bnext<CR>
nnoremap <silent> B[ :bfirst<CR>
nnoremap <silent> B] :blast<CR>

" Move the current line above or below with ALT + [j/k].
noremap <A-j> ddjP
noremap <A-k> ddkP

" Make j and k operate on virtual lines, not real lines.
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" TODO: Enable spellcheck for markdown and txt files
" TODO: Add autocorrect.vim
augroup spellcheck
	autocmd!
	autocmd BufRead,BufNewFile *.md set filetype=markdown
	autocmd BufRead,BufNewFile *.txt set filetype=text
	autocmd FileType markdown setlocal spell
	autocmd FileType text setlocal spell
	hi SpellBad cterm=underline ctermfg=red
augroup END

" Append modeline after last line in buffer with <Leader>ml
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Open / Close NERDTree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Visually select text then press Ctrl-u to convert the text to UPPER CASE,
" then to lower case, then to Title Case.
" https://vim.fandom.com/wiki/Switching_case_of_characters
function! CycleCasing(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap <c-u> y:call setreg('', CycleCasing(@"), getregtype(''))<CR>gv""Pgv


"""""""""""""""""
" Plugin Settings
"""""""""""""""""

" Yep, shoulda been writing code instead of picking different colorscehemes.
"colorscheme snow
colorscheme gruvbox
"colorscheme onedark
"colorscheme OceanicNext

let g:gruvbox_contrast_dark='dark'

" Theme
set background=dark
"set background=light

" TODO: Move to YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Config
" https://github.com/neoclide/coc.nvim#example-vim-configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
" Scary!
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
            \ ' ',
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

" On $ vim, open startify and NERDTree
augroup nerdtree-open-close
	autocmd VimEnter *
				\   if !argc()
				\ |   Startify
				\ |   NERDTree
				\ |   wincmd w
				\ | endif

	" Close vim if only thing remaining is NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

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
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_pylint_exe = 'python3 -m pylint'

""""""""
" Python
""""""""

let g:python3_host_prog = '/usr/local/bin/python3'
