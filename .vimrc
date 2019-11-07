" .vimrc for Neovim on macOS
" Written by: Aaron Lichtman (and the internet)

" I've spent 10,000 fucking hours on this thing. I hope someone else gets some
" use out of this.

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Dependency for gist-vim
Plug 'mattn/webapi-vim'

" Syntax Highlighting, Linting and Completion
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'

" Toggle Quick and Location Lists
Plug 'milkypostman/vim-togglelist'

" File explorers
Plug 'scrooloose/nerdtree'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Writing-related
Plug 'reedes/vim-litecorrect'
Plug 'szw/vim-dict'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Themes
"Plug 'reedes/vim-thematic'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'nightsense/snow'
Plug 'mhartington/oceanic-next'

" General Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'

" Tagbar
Plug 'liuchengxu/vista.vim'

" Register Preview
Plug 'junegunn/vim-peekaboo'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'dkarter/bullets.vim'

" Delimeters
Plug 'Raimondi/delimitMate'

" Surrounding text
Plug 'tpope/vim-surround'

" Git and GitHub
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" RipGrep
Plug 'jremmen/vim-ripgrep'

" Quick Jump
Plug 'easymotion/vim-easymotion'

" Persistent Scratch Buffers
Plug 'mtth/scratch.vim'

" Commenting
Plug 'scrooloose/nerdcommenter'

" TimeTracking
Plug 'wakatime/vim-wakatime'

" Undo
Plug 'mbbill/undotree'

call plug#end()

" Extended % matching
runtime macros/matchit.vim

" }}}

" General Settings  {{{

" Use the mouse for pane selection, resizing, and cursor movement.
set mouse=nv

set nostartofline  " Don’t reset cursor to start of line when moving around.
set title          " Show the filename in the window titlebar
set backspace=indent,eol,start " Allow backspace in insert mode
set modeline
set ruler

" Copy to macOS clipboard
set clipboard=unnamed

set noshowmode  " Showing mode directly under a statusline with mode is redundant
set secure
set spelllang=en
set scrolloff=6
syntax on

" Tab completion menu
set wildmenu
set wildmode=full
set wildignore+=.svn,CVS,.git,*.pyc,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*/tmp/*,*.zip,log/**,node_modules/**,target/**,tmp/**,*.rbc

" Undo and Undotree Settings
set undolevels=1000  " store a bunch of undo history
set undofile
let g:undotree_SetFocusWhenToggle = 1

set number

" Use gtf to jump to files with these extensions
set suffixesadd=.md,.c,.h,.cpp,.py,.tex

set tags=tags

" Don't treat hyphens and underscores like whitespace
set iskeyword+=-
set iskeyword+=_

" Search Config
set showmatch             " Show matching brackets/parenthesis
set matchtime=0           " Don't blink when matching
set incsearch             " Find as you type search
set hlsearch              " Highlight search terms
set ignorecase            " Case insensitive search
set inccommand=nosplit    " Show regex replacement changes as you're typing
set smartcase             " Case sensitive if we type an uppercase

set cmdheight=1           " Better display for messages
set updatetime=300        " Smaller updatetime for CursorHold & CursorHoldI

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Fix weird line tracers while scrolling bug
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Line breaking
set wrap
set nolinebreak
" set textwidth=120     " TODO: break lines when line length increases only outside of markdown and text files
set breakindent
set breakindentopt=min:40

" 80 and 120 character guidelines
highlight ColorColumn ctermbg=lightgrey
set cc=80,120

set cursorline      " Highlight current line

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set hidden          " Enable buffers to exist in the background
set nobackup        " Don't keep a backup file. writebackup is enough for my purposes.

" Open new split panes to right and bottom
set splitbelow
set splitright

set signcolumn=yes  " always show signcolumns

" END General Settings    }}}

" Indentation {{{

set copyindent
set preserveindent
filetype plugin indent on

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new lineet noexpandtab

" END Indentation }}}

" Appearance {{{

set background=dark

"colorscheme snow
"colorscheme gruvbox
colorscheme gruvbox-material
"colorscheme onedark
"colorscheme OceanicNext

" let g:thematic#theme_name = 'gruvbox-material'
"
" let g:thematic#defaults = {
" \ 'airline-theme': 'onedark',
" \ }
"
" " TODO: Resolve airline-theme change bug on source vimrc
" let g:thematic#themes = {
" \ 'gruvbox-material' : {
" \              "airline-theme": 'onedark',
" \ },
" \ }
"
" " let g:thematic#themes = {
" " \ 'snow'  : {},
" " \ 'gruvbox' : {
" " \              'airline-theme': 'onedark',
" " \ },
" " \ 'gruvbox-material' : {
" " \              "airline-theme": 'onedark',
" " \ },
" " \ 'onedark' : {},
" " \ 'OceanicNext' : {},
" " \ }

let g:gruvbox_contrast_dark='dark'

" Vim Dev Icons
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0

" Vista

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

" Appearance }}}

" AutoGroups {{{

augroup AutoCloseVim
    autocmd!
    " Close vim if the quickfix window is the only window visible (and only tab)
    " https://stackoverflow.com/a/7477056
    autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | quit | endif
    " Close vim if only thing remaining is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif
    " TODO: Close vim if all that remains is a no-name buffer
augroup END

augroup OnOpenVim
    autocmd!
    " If opening vim without a file arg, open startify and NERDTree
    autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif
    " Automatically install missing plugins
    autocmd VimEnter *
                \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                \ |   PlugInstall --sync | q
                \ | endif
augroup END

" After opening a file, set working dir to the same as that file so relative
" paths will work nicely. Pairs with the set of :FZF mappings below to allow
" you to access files in the parent directories.
augroup setWorkingDirForCurrentWindow
    autocmd BufEnter * silent! lcd %:p:h
augroup END

augroup MakeFoldsPersistent
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" Restore cursor position when opening a file
augroup OnOpenFile
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif
augroup END

" Automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode
augroup LineNumbers
    autocmd!
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
augroup END

" Auto-folding in vimscript files with {{{ and }}}
augroup Filetype_Vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup Indentation
    autocmd!
    " configure expanding of tabs for various file types
    au BufRead,BufNewFile *.py set expandtab
    au BufRead,BufNewFile *.c set noexpandtab
    au BufRead,BufNewFile *.h set noexpandtab
    au BufRead,BufNewFile Makefile* set noexpandtab
augroup END

" Enable spellcheck for markdown and txt files
" TODO: Clean up
augroup spellcheckAndLexicalThings
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.txt set filetype=text
    autocmd FileType markdown setlocal spell
    autocmd FileType text setlocal spell
    autocmd FileType markdown call litecorrect#init()
    autocmd FileType text call litecorrect#init()
    hi SpellBad cterm=underline ctermfg=red
augroup END

" END AutoGroups- }}}

" Functions {{{

" Append modeline after last line in buffer
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

" Rename current file (mirrors $ mv)
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! ToggleNerdTree()
    :NERDTreeToggle
    :AirlineRefresh
endfunction

" Cycle casing of selected text from upper to lower to title
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

" END Functions }}}

" Remappings {{{

" Set , as leader and - as localleader
let mapleader = ","
let maplocalleader = "-"

" Quickly edit important configs
nnoremap <leader>ev :drop ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>:AirlineRefresh<cr>
nnoremap <leader>et :drop ~/.tmux.conf<cr>
nnoremap <leader>ez :drop ~/.zshrc<cr>

" Make : commands easier
nnoremap ; :

" Don't overwrite registers when deleting with x or X
nnoremap x "_x
nnoremap X "_X

" Yeet those 'Not an editor command' errors right out the fucking window
" Or, defenestrate, as my Dad would say.
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! Qa qa

" Use jk or kj for Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Save one chracter when saving, and only write if there are changes
nnoremap <leader>w :up<CR>

" Open files with fzf. Little hack to make this play nicely with setWorkingDirForCurrentWindow
nnoremap <leader>o :FZF<CR>
nnoremap <leader>o. :FZF ..<CR>
nnoremap <leader>o.. :FZF ../..<CR>
nnoremap <leader>o... :FZF ../../..<CR>

" Close buffers and windows more easily
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>q! :bdelete!<cr>

" Quickly select the text you just pasted
noremap gV `[v`]

" Automatically jump to end of pasted text
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Create vertical split for help
cabbrev hv vert h

" Change word under cursor. Repeatable with . https://youtu.be/7Bx_mLDBtRc?t=130
nnoremap c* *Ncgn

" Quickly tabularize selected block
vnoremap <leader>t :Tabularize / \|<cr>

" Markdown bold
inoremap <leader>b ****<ESC>2ha

" Dictionary lookup
nnoremap <leader>D :Dict<cr>
vnoremap <leader>D :Dict<cr>

" Distraction Free Mode
nnoremap <silent> <leader>z :Goyo<cr>

" Traverse the buffer list more easily.
nnoremap <silent> b[ :bprevious<CR>
nnoremap <silent> b] :bnext<CR>
nnoremap <silent> B[ :bfirst<CR>
nnoremap <silent> B] :blast<CR>

" Easily move between panes
nnoremap <silent> <C-h> <C-w>h
vnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
vnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
vnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
vnoremap <silent> <C-l> <C-w>l

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Move the current line above or below with ALT + [j/k].
noremap <A-j> ddjP
noremap <A-k> ddkP

" Make j and k operate on virtual lines, not real lines.
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Make arrow keys also work on virtual lines
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Open undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Toggle Quick and Location lists
nmap <script> <silent> <leader>tl :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>tq :call ToggleQuickfixList()<CR>

" Jump to anywhere on screen with minimal keystrokes `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Toggle spell check
nmap <silent> <leader>s :set spell!<CR>

" Toggle file browser
nnoremap <Leader>ob :call ToggleNerdTree()<CR>

" Turn off search highlighting
noremap <Leader>/ :noh<CR>

" Toggle tagbar
nmap <Leader>v :Vista!!<CR>

" Cycle casing of selected text
vnoremap <c-u> y:call setreg('', CycleCasing(@"), getregtype(''))<CR>gv""Pgv

" Remappings }}}

" coc.nvim {{{
" Stolen mainly from: https://github.com/neoclide/coc.nvim#example-vim-configuration

" https://github.com/neoclide/coc.nvim/issues/856
let g:coc_node_path = "/usr/local/bin/node"

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

augroup somethingWithFormattingAndJumpingCoC
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

" END coc.nvim }}}

" vim-markdown {{{

" Disable Markdown folding
let g:vim_markdown_folding_disabled = 1
" Autoresize TOC window
let g:vim_markdown_toc_autofit = 1

" }}}

" Startify {{{

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

" END Startify }}}

" NERDTree {{{

let NERDTreeShowHidden = 1
let NERDTreeStatusline = 0

" END NERDTree }}}

" vim-easymotion {{{

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" END vim-easymotion }}}

" Better Whitespace {{{
"
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_skip_empty_lines=1
let g:show_spaces_that_precede_tabs=1

" END Better Whitespace }}}

" Airline / Statusline {{{

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" END Airline }}}

" NerdCommenter {{{

" Add spaces after comment delimiters
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NerdCommenter }}}

" Bullets.vim {{{

let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]

" END Bullets.vim }}}

" Syntastic {{{

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_pylint_exe = 'python3 -m pylint'

" END Syntastic }}}

" Python {{{

let python_highlight_all=1
let g:python3_host_prog = '/usr/local/bin/python3'

" END Python }}}

" vim-togglelist {{{

let g:toggle_list_no_mappings=1

" }}}

" Gist {{{

let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

" END Gist }}}
