" .vimrc for Neovim on macOS using iTerm2
" Written by: Aaron Lichtman (and the internet)

" I've spent 10,000 fucking hours on this thing. I hope someone else gets some
" use out of this.

" TODO {{{

" 1. Figure out why termguicolors causes color words to be higlighted in their color.
" 2. Syntastic -> ALE?
" 3. Properly configure C and C++ formatting.
" 4. Set up snippets
" 5. Remove unused default colorschemes

" END TODO }}}

let uname = substitute(system('uname'), '\n', '', '')
" Example values: Linux, Darwin

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Dependency for gist-vim
Plug 'mattn/webapi-vim'

" Syntax Highlighting, Linting and Completion
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ycm-core/YouCompleteMe'
Plug 'davidhalter/jedi-vim'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

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

" Show leading spaces
Plug 'Yggdroot/indentLine'

" Tagbar
Plug 'liuchengxu/vista.vim'

" Register Preview
Plug 'junegunn/vim-peekaboo'

" Markdown
Plug 'godlygeek/tabular'
Plug 'dkarter/bullets.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Delimiters
Plug 'Raimondi/delimitMate'

" Surrounding text
Plug 'tpope/vim-surround'

" Git and GitHub
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" File Scrolling
Plug 'psliwka/vim-smoothie'

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

if uname == 'Darwin'
    " Time Tracking
    Plug 'wakatime/vim-wakatime'
endif

" Undo
Plug 'mbbill/undotree'

call plug#end()

" Extended % matching
runtime macros/matchit.vim

" }}}

" General Settings  {{{

set secure
set modeline
set spelllang=en
set mouse=nv                    " Use mouse for pane selection, resizing, and cursor movement.
set nostartofline               " Don’t reset cursor to start of line when moving around.
set title                       " Show the filename in the window titlebar
set autoread                    " Autoread changed files

" Enable copying to system clipboard
if uname == "Darwin"
    set clipboard=unnamed
elseif uname == "Linux"
    set clipboard=unnamedplus
endif

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
syntax on

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

set tags=tags

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

" Line breaking {{{

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
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

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

set termguicolors
set background=dark
let g:gruvbox_contrast_dark='dark'
colorscheme gruvbox-material


"colorscheme solarized
"colorscheme snow
"colorscheme gruvbox
"colorscheme onedark
"colorscheme OceanicNext

" Make vertical splits prettier
set fillchars+=vert:┃
highlight VertSplit guifg=11

" indentLine {{{

" Show leading spaces
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_conceallevel = 1

" END indentLine }}}

" TODO: Fix this mess
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
" " \              'airline-theme': 'onedark',
" " \ },
" " \ 'onedark' : {},
" " \ 'OceanicNext' : {},
" " \ }

" Vim Dev Icons {{{

let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0

" END Vim Dev Icons }}}

" Vista {{{

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']

" END Vista }}}

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

augroup VimStartupSequence
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
" paths will work nicely. Pairs with the set of FZF mappings below to allow
" you to access files in the parent directories.
augroup SetWorkingDirForCurrentWindow
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END

" Folding {{{

augroup MakeFoldsPersistent
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup END

augroup Folding
    autocmd!
    " TODO: What I really want is for this to apply to zshrc, vimrc and
    " tmux.conf, not all vim and tmux fts. Should be included in a modeline
    autocmd FileType vim,tmux setlocal foldmethod=marker foldcolumn=2
    autocmd FileType python setlocal foldmethod=indent
augroup END

" END Folding }}}

augroup RestoreCursorPositionWhenOpeningFile
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif
augroup END

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
    autocmd BufRead,BufNewFile *.md set filetype=pandoc
    autocmd BufRead,BufNewFile *.txt set filetype=text
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

augroup MarkdownConcealing
    autocmd!
    autocmd FileType markdown,pandoc set conceallevel=0
augroup END

augroup SpellcheckAndWritingTools
    autocmd!
    autocmd FileType markdown,text setlocal spell | call litecorrect#init()
    hi SpellBad cterm=underline ctermfg=red
augroup END

augroup NoPasteAfterLeavingInsertMode
    autocmd!
    au InsertLeave * silent! set nopaste
augroup END

" tbh not sure if this should stay
" augroup coc-config
  " autocmd!
  " " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setlocal formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" END AutoGroups- }}}

" Functions {{{

" Append modeline after last line in buffer
function! AppendModeline() abort
  let l:modeline = printf("# vim: ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  call append(line("$"), l:modeline)
  doautocmd BufRead
endfunction

" Modeline for nasm files
function! AppendASMModeline() abort
let l:modeline = printf("; vim: ft=nasm ts=%d sw=%d tw=%d et :",
        \ &tabstop, &shiftwidth, &textwidth)
  call append(line("$"), l:modeline)
  doautocmd BufRead
endfunction

" Rename current file (mirrors $ mv)
function! RenameFile() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':!trash ' . old_name
    redraw!
  endif
endfunction

function! ToggleNerdTree() abort
    :NERDTreeToggle
    :AirlineRefresh
endfunction

" Cycle casing of selected text from upper to lower to title
" https://vim.fandom.com/wiki/Switching_case_of_characters
function! CycleCasing(str) abort
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

" Open Markdown preview using grip
" https://www.reddit.com/r/vim/comments/8asgjj/topnotch_vim_markdown_live_previews_with_no/
function! OpenMarkdownPreview() abort
  if exists('s:markdown_job_id') && s:markdown_job_id > 0
    call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  let s:markdown_job_id = jobstart('grip ' . shellescape(expand('%:p')))
  if s:markdown_job_id <= 0 | return | endif
  call system('open http://localhost:6419')
endfunction

" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
function! ExecuteMacroOverVisualRange() abort
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" END Functions }}}

" Remappings {{{

" Set , as leader and - as localleader
let mapleader = ","
let maplocalleader = "-"

" Quickly edit important configs
nnoremap <leader>ev :drop ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>:AirlineRefresh<cr>
nnoremap <leader>et :drop ~/.tmux.conf<cr>
nnoremap <leader>ez :drop ~/.zshrc<cr>

" Make : commands easier
nnoremap ; :

" Insert timestamp
iabbrev <expr> dts strftime("%a, %b %d, %Y -- %X")

" Don't overwrite copy register when deleting with x or X
nnoremap x "_x
nnoremap X "_X

" Read modeline
nnoremap <leader>mr :doautocmd BufRead<Cr>

" Yeet those 'Not an editor command' errors right out the fucking window
" Or, defenestrate, as my Dad would say.
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! Qa qa

" Make Y behave like C and D
nnoremap Y y$

" Make U do the opposite of u (redo)
nnoremap U <C-r>

" Make K split the current line at the cursor (the opposite of J)
nnoremap K i<CR><Esc>

" Use jk or kj for Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Save one chracter when saving, and only write if there are changes
nnoremap <leader>w :up<CR>

" Toggle Scratchpad
nnoremap <leader>sp :ScratchPreview<CR>

" FZF mappings
nnoremap <C-p> :GFiles<CR>
nnoremap <C-p>. :Files<CR>
nnoremap <C-p>.. :Files ../..<CR>
nnoremap <leader>b :Buffers<CR>

" Git Mappings

" Open selection on github
nnoremap go :.Gbrowse<CR>
vnoremap go :'<,'>.Gbrowse<CR>

" TODO: Further optimize?
nnoremap ga :Gwrite<CR>
nnoremap gc :Git commit --verbose<CR>
nnoremap gl :Gpull<CR>
nnoremap gmv :Gmove<CR>
nnoremap gp :Gpush<CR>
nnoremap gs :Gstatus<CR>

" Close buffers and windows more easily
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>q! :bdelete!<cr>

" Quickly select the text you just pasted
nnoremap gV `[v`]

" Automatically jump to end of pasted text
" noremap <silent> p p`]
" nnoremap <silent> p p`]

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
nnoremap <silent> <leader>z :Goyo<cr>

" Traverse buffer list more easily.
nnoremap <leader>h :bprevious<CR>
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

" Move the current line above or below with ALT + [j/k].
" TODO: Make this not fail on top or bottom of file
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

" Quickly close Quickfix and Location Windows
nnoremap <script> <silent> <leader>tl :lclose<CR>
nnoremap <script> <silent> <leader>tq :cclose<CR>

" Jump to anywhere on screen with minimal keystrokes `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Toggle spell check
nnoremap <silent> <leader>s :set spell!<CR>

" Toggle file browser, undotree and Vista tagbar
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <C-n> :call ToggleNerdTree()<CR>
nnoremap <Leader>v :Vista!!<CR>

" Turn off search highlighting
nnoremap <Leader>/ :noh<CR>

" Markdown Preview
nnoremap <silent> <leader>mpg :call OpenMarkdownPreview()<cr>
nnoremap <silent> <leader>mpp :Pandoc pdf<cr>

" Cycle casing of selected text
vnoremap <c-u> y:call setreg('', CycleCasing(@"), getregtype(''))<CR>gv""Pgv

" Run macro over visual range with @REG
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Remappings }}}

" Writing {{{

" Note that this dictionary is purely for spelling correction and does not
" allow you to look up definitions. That's why I have the vim-dict plugin.
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/thesaurus/mthesaur.txt

" END Writing }}}

" coc.nvim {{{
" Heavily based on: https://github.com/neoclide/coc.nvim#example-vim-configuration

" https://github.com/neoclide/coc.nvim/issues/856
if uname == "Darwin"
    let g:coc_node_path = "/usr/local/bin/node"
elseif uname == "Linux"
    let g:coc_node_path = "/usr/bin/node"
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" TODO: Use tab to trigger completion with support for snippets.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? coc#_select_confirm() :
      " \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" TODO: Snippets {{{

" " Use <C-l> to trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> to select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
" " Jump to next placeholder.
" let g:coc_snippet_next = '<c-k>'
"
" " Jump to previous placeholder.
" let g:coc_snippet_prev = '<c-j>'
"
" " Use <C-j> to both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" END Snippets }}}

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
nmap <leader>rn <Plug>(coc-rename)

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

" vim-jedi {{{

" Fix lagginess with large python libraries
" https://github.com/davidhalter/jedi-vim/issues/217
let g:jedi#popup_on_dot = 0

let g:jedi#documentation_command = "H"

" END vim-jedi }}}

" TODO: Ultisnips {{{

" https://github.com/SirVer/ultisnips/issues/1052#issuecomment-504719268
" let g:UltiSnipsExpandTrigger = "<nop>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" END Ultisnips }}}

" Markdown {{{

" Pandoc {{{

" vim-pandoc {{{

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

" END vim-pandoc }}}

" vim-pandoc-syntax {{{

let g:pandoc#syntax#conceal#urls = 0
let g:pandoc#syntax#conceal#blacklist = [ "codeblock_start", "codeblock_delim", "image", "block" ]
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#codeblocks#embeds#langs = [ "python", "ruby", "c", "bash=sh" ]

" END vim-pandoc-syntax }}}

" END pandoc }}}

" END Markdown }}}

" fzf {{{

" https://github.com/neovim/neovim/issues/9718#issuecomment-546603628
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" END fzf }}}

" vim-startify {{{

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
              \ '            And down the rabbit hole we go...',
              \ ]

let g:startify_files_number = 8
let g:startify_update_oldfiles = 0
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1

" END Startify }}}

" Undotree {{{

let g:undotree_SetFocusWhenToggle = 1

" END Undotree }}}

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

" vim-airline {{{

let g:airline_theme='onedark'
" let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'markdown', 'pandoc', 'rst', 'tex', 'text']
let g:airline#extensions#wordcount#enabled = 1

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

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" END Syntastic }}}

" ALE {{{

" " TODO: Dedup with better_whitespace
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}
" let g:ale_linters = {
" \   'python': ['flake8', 'mypy'],
" \}
"
" let g:ale_fix_on_save = 1
" let g:ale_python_flake8_options='--ignore=E225,E402,E501'
" let g:ale_python_mypy_options='--ignore-missing-imports'

" END ALE }}}

" YouCompleteMe {{{

" let g:ycm_path_to_python_interpreter = '/usr/local/var/pyenv/shims/python3'

" END YouCompleteMe }}}

" Python {{{

let python_highlight_all=1

if uname == "Darwin"
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:python_host_prog = '/usr/local/bin/python2'
elseif uname == "Linux"
    let g:python3_host_prog = '/usr/bin/python3'
    let g:python_host_prog = '/usr/bin/python2'
endif

" END Python }}}

" Gist {{{

let g:gist_detect_filetype = 1

if uname == "Darwin"
    let g:gist_clip_command = 'pbcopy'
elseif uname == "Linux"
    let g:gist_clip_command = 'xsel -ib'
endif

" END Gist }}}
