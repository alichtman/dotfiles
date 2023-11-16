" .vimrc for Neovim on macOS using iTerm2
" Written by: Aaron Lichtman (and the internet)

" I've spent 10,000 fucking hours on this thing.
" I hope someone else gets some use out of this.

" TODO {{{

" 1. Configure ALE
" 2. Properly configure C and C++ formatting.
" 4. Remove unused default colorschemes
" 5. Map opening correct man page to H

" END TODO }}}

" This variable determines if you're running nvim on macOS or Linux
" Example values: Linux, Darwin
let uname = substitute(system('uname'), '\n', '', '')

" Plugins {{{

call plug#begin()

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'
Plug 'kovetskiy/sxhkd-vim'
Plug 'zdharma-continuum/zinit-vim-syntax'
Plug 'wren/jrnl.vim'
Plug 'prisma/vim-prisma'

" Linting, Completion and Highlighting
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'psf/black', { 'branch': 'stable' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Assistance
Plug 'github/copilot.vim', {'branch': 'release'}

" Shell Commands in ENV
Plug 'christoomey/vim-run-interactive'

" Move lines above or below with ALT + [j/k], and side to side with ALT + [h/l]
Plug 'matze/vim-move'

" Clipboard configuration
Plug 'alichtman/sane-clipboard.vim'

" File explorers
Plug 'scrooloose/nerdtree'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Notifications
Plug 'rcarriga/nvim-notify'

" Writing-related
Plug 'reedes/vim-litecorrect'
Plug 'szw/vim-dict'
Plug 'amix/vim-zenroom2'

" Themes
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'reedes/vim-thematic'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'nightsense/snow'
Plug 'mhartington/oceanic-next'
Plug 'reedes/vim-colors-pencil'
Plug 'meain/hima-vim'
Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}

" General Appearance
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'folke/trouble.nvim'

" Focus
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'

" Highlight copied line
Plug 'markonm/hlyank.vim'

" Show leading spaces
Plug 'Yggdroot/indentLine'

" Register Preview
Plug 'junegunn/vim-peekaboo'

" Markdown
Plug 'godlygeek/tabular'
Plug 'dkarter/bullets.vim'
Plug 'PratikBhusal/vim-grip'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ferrine/md-img-paste.vim'

" Delimiters
Plug 'Raimondi/delimitMate'

" Surrounding text
Plug 'tpope/vim-surround'

" Dependency for gist-vim
Plug 'mattn/webapi-vim'

" Git and GitHub
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'

" Smooth Scrolling
Plug 'psliwka/vim-smoothie'

" :<NUM> Preview
Plug 'nacro90/numb.nvim'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ripgrep
Plug 'jremmen/vim-ripgrep'

" Quick Jump
Plug 'easymotion/vim-easymotion'
Plug 'jinh0/eyeliner.nvim'

" Persistent Scratch Buffers
Plug 'mtth/scratch.vim'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Time Tracking
" Plug 'wakatime/vim-wakatime'

" Write to readonly file as root
Plug 'lambdalisue/suda.vim'

" Undo
Plug 'mbbill/undotree'

" Unix Tools
Plug 'tpope/vim-eunuch'

Plug 'alichtman/open-close.vim'
Plug 'alichtman/cycle-casing.vim'

call plug#end()

" Extended % matching
runtime macros/matchit.vim

" }}}

" General Settings  {{{

let g:loaded_perl_provider = 0

set secure
set modeline                    " Note that this creates a security risk
set modelines=4
set spelllang=en
set nospell                     " Don't spellcheck by default. Will turn on for certain filetypes in an augroup
set mouse=nv                    " Use mouse for pane selection, resizing, and cursor movement.
set nostartofline               " Don’t reset cursor to start of line when moving around.
set title                       " Show the filename in the window titlebar
set autoread                    " Autoread changed files
set noshowmode                  " Don't show mode under statusline w/ mode
set scrolloff=6                 " Minimal num of lines to keep above/below cursor
set number                      " Enable line numbers
set cmdheight=1                 " Better display for messages
set updatetime=300              " Smaller updatetime for CursorHold & CursorHoldI
set cursorline                  " Highlight current line
set hidden                      " Enable buffers to exist in the background
set nobackup                    " Don't keep a backup file. writebackup is enough for my purposes.
set splitbelow                  " Open new horizontal splits to the bottom
set splitright                  " And vertical splits to the right
set signcolumn=yes              " Always show signcolumns
set switchbuf=usetab            " Search first in opened windows if opening buffer
set shortmess+=c                " Don't give ins-completion-menu messages
set backspace=indent,eol,start  " Make delete in insert mode behave as expected.
set fillchars+=fold:.           " Make folds pretty.
set tags=tags

" Tab completion menu
set wildmenu
set wildmode=full
set wildignore+=.svn,CVS,.git,*.pyc,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*/tmp/*,*.zip,log/**,node_modules/**,target/**,tmp/**,*.rbc

" Undo {{{

set undolevels=1000  " store a bunch of undo history
set undofile

" END Undo }}}

" Use gtf to jump to files with these extensions
set suffixesadd=.md,.c,.h,.cpp,.py,.tex


" Don't treat hyphens and underscores like whitespace
set iskeyword+=-
set iskeyword+=_

" Search {{{

set showmatch             " Show matching brackets/parenthesis
set matchtime=0           " Don't blink when matching
set incsearch             " Find as you type search
set hlsearch              " Highlight search terms
set ignorecase            " Case insensitive search
set inccommand=nosplit    " Show regex replacement changes as you're typing
set smartcase             " Case sensitive if we type an uppercase

" END Search }}}

" Line breaks {{{

set wrap
set nolinebreak
" set textwidth=120       " TODO: break lines when line length increases only outside of markdown and text files
set breakindent
set breakindentopt=min:40
highlight ColorColumn ctermbg=237
set colorcolumn=81,121   " 80 and 120 character guidelines

" END Line breaking }}}

" Show “invisible” characters
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,space:·

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

" END General Settings }}}

" Appearance {{{

" set guifont=SFMono\ Nerd\ Font\ 14

" Theme {{{

set termguicolors
let g:gruvbox_contrast_dark='dark'
let g:palenight_terminal_italics=1

let g:daycula_current_word='bold'

let g:everforest_background='hard'
let g:everforest_better_performance=1
let g:everforest_enable_italic=1

" Make vertical splits prettier
set fillchars+=vert:┃
highlight VertSplit guifg=11

" Default theme
" let g:thematic#theme_name = 'palenight'
" let g:thematic#theme_name = 'onedark'
" let g:thematic#theme_name = 'daycula'
" let g:thematic#theme_name = 'tokyonight'
let g:thematic#theme_name = 'gruvbox'

" Default theme properties which may be overridden in thematic#themes
let g:thematic#defaults = {
\ 'airline-theme': 'onedark',
\ 'background': 'dark',
\ }

let g:thematic#themes = {
\ 'palenight': {
\     'colorscheme': 'palenight',
\     'airline-theme': 'palenight',
\ },
\ 'tokyonight': {
\     'colorscheme': 'tokyonight',
\     'airline-theme': 'palenight',
\ },
\ 'light': {
\     'colorscheme': 'gruvbox-material',
\     'airline-theme': 'gruvbox_material',
\     'background': 'light',
\ },
\ 'github': {
\     'background': 'light',
\     'colorscheme': 'hima',
\     'airline-theme': 'palenight',
\ },
\ 'gruvbox': {
\     'colorscheme': 'gruvbox-material',
\     'airline-theme': 'onedark',
\ },
\ 'snow': {
\     'colorscheme': 'snow',
\     'airline-theme': 'snow_dark',
\ },
\ 'onedark': {
\     'colorscheme': 'onedark',
\     'airline-theme': 'onedark',
\ },
\ 'OceanicNext': {
\     'colorscheme': 'OceanicNext',
\     'airline-theme': 'oceanicnext'
\ },
\ 'daycula': {
\     'colorscheme': 'daycula',
\     'airline-theme': 'daycula'
\ },
\ 'everforest': {
\    'colorscheme': 'everforest',
\    'airline-theme': 'everforest'
\ },
\ 'everforest_light': {
\    'background': 'light',
\    'colorscheme': 'everforest',
\    'airline-theme': 'everforest',
\ },
\}

" END Theme }}}

" indentLine {{{

" Show leading spaces
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_conceallevel = 0

" END indentLine }}}

" Vim Dev Icons {{{

let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0

" END Vim Dev Icons }}}

" Vista {{{

" NOTE: Won't work for ctags, only the LSP executives
" (https://github.com/liuchengxu/vista.vim#options)
" let g:vista_default_executive = 'ctags'
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista#renderer#enable_icon = 1
" let g:vista_fzf_preview = ['right:50%']

" END Vista }}}

" Numb.nim {{{

:lua require('numb').setup()

" ENV Numb.nvim }}}

" Appearance }}}

" AutoGroups {{{

augroup setFoldMethodMarkerOnVimrc
    autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END

augroup SpellCheckTextFiles
    autocmd!
    autocmd FileType * set nospell
    autocmd FileType jrnl,txt,md,markdown set spell
augroup END

augroup SetXMLSyntaxForPlist
    autocmd!
    au BufRead,BufNewFile *.plist set ft=xml
augroup END

" Folding {{{

augroup Folding
    autocmd!
    " TODO: What I really want is for this to apply to zshrc, vimrc and
    " tmux.conf, not all vim and tmux fts. Should be included in a modeline
    autocmd FileType vim,tmux setlocal foldmethod=marker foldcolumn=2
    autocmd FileType python setlocal foldmethod=indent
augroup END

" END Folding }}}

" Automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode.
augroup LineNumbers
    autocmd!
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
augroup END

augroup Indentation
    autocmd!
    " configure expanding of tabs for various file types
    au BufRead,BufNewFile *.py set expandtab
    au BufRead,BufNewFile *.c set noexpandtab
    au BufRead,BufNewFile *.h set noexpandtab
    au BufRead,BufNewFile Makefile* set noexpandtab
augroup END

augroup SetCorrectFiletype
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.txt set filetype=text
    autocmd BufRead,BufNewFile *.jrnl set filetype=jrnl textwidth=0
augroup END

augroup GitCommitFormat
    autocmd!
    " Force the cursor onto a new line after 72 characters
    autocmd FileType gitcommit set textwidth=72
    " Colour the 73rd column so that we don’t type over our limit
    set colorcolumn=+1
    " Also colour the 51st column (for titles)
    autocmd FileType gitcommit set colorcolumn+=51
augroup END

augroup pandocSyntax
    autocmd!
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=pandoc
    au! BufNewFile,BufFilePre,BufRead *.md,*.jrnl set syntax=on
augroup END

augroup JavascriptSpaceing
    autocmd!
    au! BufNewFile,BufFilePre,BufRead *.js *.ts set tabstop=2
augroup MarkdownConcealing
    autocmd!
    autocmd FileType markdown,pandoc set conceallevel=0
augroup END

augroup MarkdownImagePaste
    autocmd!
    autocmd FileType markdown,pandoc nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
augroup END

augroup SpellcheckAndWritingTools
    autocmd!
    autocmd FileType markdown,text,mail setlocal spell | call litecorrect#init()
    hi SpellBad cterm=underline ctermfg=red
augroup END

augroup NoPasteAfterLeavingInsertMode
    autocmd!
    au InsertLeave * silent! set nopaste
augroup END

augroup HighlightCurrentWord
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

augroup CreateDirBeforeWritingIfNeeded
    autocmd!
    autocmd BufWritePre * :call s:MkNonExistentDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" END AutoGroups- }}}

" Functions {{{

" Append modeline after last line in buffer
function! AppendModeline() abort
  let l:modeline = printf("# vim: ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  call append(line("$"), l:modeline)
  doautocmd BufRead
endfunction

function! ReplaceAppleQuotes() abort
    silent! %s/[“”’]/"/g
    echo "Replaced Apple Quotes"
endfunction

command! ReplaceAppleQuotes call ReplaceAppleQuotes()

" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
function! ExecuteMacroOverVisualRange() abort
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" https://stackoverflow.com/a/4294176/8740440
function s:MkNonExistentDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" END Functions }}}

" Abbreviations {{{

" Insert timestamp
iabbrev <expr> dts strftime("%a, %b %d, %Y -- %X")

" Spelling corrections
iabbrev yb by
iabbrev ni in

" END Abbreviations }}}

" Remappings {{{

" Set , as leader and - as localleader
let mapleader = ","
let maplocalleader = "-"

" Quickly edit important configs
nnoremap <leader>ev :drop ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>:AirlineRefresh<cr>:lua require("notify")("Sourced init.vim!")<cr>
nnoremap <leader>ed :drop $XDG_CONFIG_HOME/zsh/<cr>

" Read modeline
nnoremap <leader>mr :doautocmd BufRead<Cr>

" Yeet those 'Not an editor command' errors right out the fucking window
" defenestrate, as my Dad would say.
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! Qa qa
command! QA qa

" Make Y behave like C and D
nnoremap Y y$

" Make U do the opposite of u (redo)
nnoremap U <C-r>

" Make K split the current line at the cursor (the opposite of J)
nnoremap K i<CR><Esc>

" Use jk or kj for Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Quickly save, only writing the file if there are changes
nnoremap <leader>w :up<CR>

" Open link under cursor
" nnoremap <silent> gx :!firefox <c-r><c-a><CR>

" Run shell command using my regular shell env
cmap !i RunInInteractiveShell

" Toggle Scratchpad
nnoremap <leader>sp :ScratchPreview<CR>

" Find files using Telescope command-line sugar
nnoremap <C-P>      <cmd>:lua vim.find_files_from_project_git_root()<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap /          <cmd>Telescope live_grep<cr>
" nnoremap *          <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Open selection on github
nnoremap go :.GBrowse<CR>
vnoremap go :'<,'>.GBrowse<CR>

" Close buffers and windows more easily
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>q! :bdelete!<cr>

" Quickly select the text you just pasted
nnoremap gV `[v`]

" Automatically jump to end of pasted text
noremap <silent> p p`]
nnoremap <silent> p p`]

" Create vertical split for help
cabbrev hv vert h

" Change word under cursor. Repeatable with . https://youtu.be/7Bx_mLDBtRc?t=130
nnoremap c* *Ncgn

" Quickly tabularize selected block
vnoremap <leader>t :Tabularize / \|<cr>

" Dictionary (definition) lookup
nnoremap <leader>D :Dict<cr>
vnoremap <leader>D :Dict<cr>

" Distraction Free Mode
nnoremap <silent> <leader>z :ZenMode<cr>

" Traverse buffer list more easily.
nnoremap <leader>` :Telescope marks<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Easily move between panes
nnoremap <silent> <C-h> <C-w>h
vnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
vnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
vnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
vnoremap <silent> <C-l> <C-w>l

" Fix vim-smoothie scrolling mapping conflict with idk?
noremap <silent> <Plug>(SmoothieUpwards) <cmd>call smoothie#upwards() <CR>

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

" Quickly close Quickfix and Location Windows
nnoremap <script> <silent> <leader>tl :lclose<CR>
nnoremap <script> <silent> <leader>tq :cclose<CR>

" Jump to anywhere on screen with minimal keystrokes `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Toggle spell check
nnoremap <silent> <leader>s :set spell!<CR>

" Toggle filetree, undotree and Vista tagbar.
" <C-n> remap for toggling filetree is provided by open-close.vim
nnoremap <C-n> :call ToggleFileTree()<cr>
nnoremap <leader>u :UndotreeToggle<cr>
" nnoremap <Leader>v :Vista!!<CR>
nnoremap <Leader>v :lua require'telescope.builtin'.treesitter{}<CR>

" Turn off search highlighting
nnoremap <Leader>/ :noh<CR>

" Markdown Preview
nnoremap <silent> <leader>mp :GripStop<cr> :GripStart<cr>
nnoremap <silent> <leader>mpp :Pandoc pdf<cr>

" Run macro over visual range with @REG
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Match VSCode commenting hotkeys
nnoremap <A-/> <plug>NERDCommenterToggle
" NOTE: This behavior depends on the comment state of the top-most line. If it
" is commented, all selected lines are commented, and vice-versa
vnoremap <A-/> <plug>NERDCommenterToggle<CR>gv

" END Remappings }}}

" Writing {{{

" Note that this dictionary is purely for spelling correction and does not
" allow you to look up definitions. That's why I have the vim-dict plugin.
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.config/nvim/thesaurus/mthesaur.txt

" END Writing }}}

" Markdown / Pandoc {{{

" vim-pandoc {{{

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

" END vim-pandoc }}}

" vim-pandoc-syntax {{{

let g:pandoc#syntax#conceal#urls = 0
let g:pandoc#syntax#conceal#blacklist = [ "codeblock_start", "codeblock_delim", "image", "block" ]
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#codeblocks#embeds#langs = [ "python", "ruby", "c", "bash=sh", "toml" ]

" END vim-pandoc-syntax }}}

" END Markdown / Pandoc }}}

" vim-startify {{{

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Recent Files']            },
            \ { 'type': 'dir',       'header': ['   Recent Files in '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_bookmarks = [
            \ {'a': '~/.config/nvim/init.vim'},
            \ {'b': '~/.config/zsh/.zshrc'},
            \ {'c': '~/.config/tmux/tmux.conf'},
            \ {'d': '~/Desktop/personal/'},
            \ {'e': '~/Desktop/Development/notes'} ]

let g:startify_custom_header = [
              \ '                  _            .',
              \ '                 u            @88>',
              \ '    u.    u.    88Nu.   u.    %8P      ..    .     :',
              \ '  x@88k ,@88c, ‘88888 ,888c    .     .888: x888  x888.',
              \ ' ^`8888""8888“  ^8888  8888  .@88u  ~`8888~‘888X`?888f`',
              \ '   8888  888R    8888  8888 ‘‘888E`   X888  888X ‘888>',
              \ '   8888  888R   .8888b.888P   888E    X888  888X ‘888>',
              \ '  “*88*“ 8888“   ^Y8888*““    888&   “*88% “*88“ ‘888!`',
              \ '    ““   ‘Y“       `Y“        R888“    `~    “    `“`',
              \ '                               ““',
              \ '',
              \ '            Down the rabbit hole we go...',
              \ ]

let g:startify_files_number = 8
let g:startify_update_oldfiles = 0
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1

" END Startify }}}

" RipGrep {{{

let g:rg_derive_root = 1
let g:rg_highlight = 1

" END RipGrep }}}

" Undotree {{{

let g:undotree_SetFocusWhenToggle = 1

" END Undotree }}}

" open-close {{{

let g:open_close_use_NERDTree = 1
" let g:open_close_use_CHADTree = 1

" END open-close }}}

" NERDTree {{{

let NERDTreeShowHidden = 1
let NERDTreeStatusline = 0

" END NERDTree }}}

" CHADTree {{{

let g:chadtree_settings = { 'theme.text_colour_set': 'nerdtree_syntax_dark' }

" END }}}

" Eyeliner {{{

lua << EOF
require'eyeliner'.setup {
  highlight_on_key = true, -- show highlights only after keypress
  dim = true               -- dim all other characters if set to true (recommended!)
}
EOF

" }}}

" vim-easymotion {{{

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" END vim-easymotion }}}

" vim-airline {{{

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename in the tabline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'markdown', 'pandoc', 'rst', 'tex', 'text']
let g:airline#extensions#wordcount#enabled = 1
" Display ALE error info in the status bar
let g:airline#extensions#ale#enabled = 1

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
            \ 'pandoc',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch',
            \ 'jrnl'
            \]

" END Bullets.vim }}}

" treesitter {{{

lua << EOF
require'nvim-treesitter.install'.compilers = { 'gcc' }

require'nvim-treesitter.configs'.setup({
ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "javascript", "ninja", "ruby", "swift", "typescript", "python"},
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    smart_rename = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      keymaps = {
        smart_rename = "grr",
      },
    },
--     navigation = {
--       enable = true,
--       -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
--       keymaps = {
--         goto_definition = "gd",
--         list_definitions = "gnD",
--         list_definitions_toc = "gO",
--         goto_next_usage = "<a-*>",
--         goto_previous_usage = "<a-#>",
--       },
--     },
  },
})

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
}
EOF

" END treesitter }}}

" telescope {{{

lua << EOF
require('telescope').setup{
  defaults = {
      theme = "dropdown",
  },
  pickers = {
      find_files = {
          theme = "dropdown",
      },
      live_grep = {
          theme = "dropdown",
      },
      buffers = {
          theme = "dropdown",
      },
      treesitter = {
          theme = "dropdown",
      },
  },
  extensions = {
  }
}

function vim.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end
EOF

" END telescope }}}

" cycle-casing {{{

let g:cycle_casing_mapping_enabled = 1

" END }}}

" Completion / Linting {{{

" Prettier {{{

" Format on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" END Prettier }}}

" ALE {{{

" Disable loclist and enable quickfix. Open list when things are wrong.
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options='--ignore=E117,E402,E501,W191,C0330'

" ALELinters for each language
let g:ale_linters = {
\     'c': ['clangtidy', 'cppcheck', 'gcc'],
\     'cpp': ['clangtidy', 'cppcheck', 'gcc'],
\     'css': ['prettier'],
\     'html': ['prettier'],
\     'java': ['checkstyle', 'javac'],
\     'javascript': ['prettier', 'eslint'],
\     'json': ['prettier'],
\     'markdown': ['prettier'],
\     'python': ['flake8', 'mypy'],
\     'yaml': ['prettier']
\}
"
" :ALEFix-ers for each language
" let g:ale_fixers = {
" \     '*': ['remove_trailing_lines', 'trim_whitespace'],
" \     'java': ['google_java_format'],
" \     'c': ['clang-format']
" \}

let g:ale_fixers = {
\     '*': ['remove_trailing_lines', 'trim_whitespace']
\}

" END ALE }}}

" Copilot {{{

let g:copilot_filetypes = {
  \ 'jrnl': v:false,
  \ }

" Alt-l to accept Copilot suggestion
" Alt-[ / ] to cycle through suggestions
imap <silent><script><expr> <M-l> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" END Copilot }}}

" coc.nvim {{{
" Heavily based on: https://github.com/neoclide/coc.nvim#example-vim-configuration

" https://github.com/neoclide/coc.nvim/issues/856
if uname == "Darwin"
    let g:coc_node_path = "/usr/local/bin/node"
elseif uname == "Linux"
    let g:coc_node_path = "/home/alichtman/.config/nvm/versions/node/v18.3.0/bin/node"
endif

" Use tab for completion {{{

" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" "suggest.noselect": true should be set in the configuration file
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Either accept the tab-completion or format code on Enter
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" }}}

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Use H to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mapping for rename current word
nmap <F2>       <Plug>(coc-rename)
nmap <leader>fr <Plug>(coc-references)

" Mapping for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Mapping for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Mapping for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" END coc.nvim }}}

" END Completion }}}

" suda.vim {{{

let g:suda_smart_edit = 1

" END suda.vim }}}

" Python {{{

let python_highlight_all=1

if uname == "Darwin"
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:python_host_prog = '/usr/local/bin/python2'
elseif uname == "Linux"
    let g:python3_host_prog = '/usr/local/var/pyenv/shims/python3'
    let g:python_host_prog = '/usr/bin/python2'
endif

" END Python }}}

" Gist {{{

let g:gist_detect_filetype = 1
let g:gist_token_file = $XDG_CACHE_HOME . '/gist-vim'

if uname == "Darwin"
    let g:gist_clip_command = 'pbcopy'
elseif uname == "Linux"
    let g:gist_clip_command = 'xsel -ib'
endif

" END Gist }}}

" vim: foldmethod=marker :
