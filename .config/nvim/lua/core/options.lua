-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- General Options {{{
--
vim.g.mapleader = ","
vim.g.loaded_perl_provider = 0
vim.opt.encoding = "utf-8"

vim.opt.autochdir = true
vim.opt.secure = true
vim.opt.modeline = true -- Note that this creates a security risk
vim.opt.modelines = 4
vim.opt.spelllang = "en"
vim.opt.spell = false -- Don't spellcheck by default. Will turn on for certain filetypes in an augroup
vim.opt.startofline = false -- Don’t reset cursor to start of line when moving around.
vim.opt.title = true -- Show the filename in the window titlebar
vim.opt.autoread = true -- Autoread changed files
vim.opt.showmode = false -- Don't show mode under statusline w/ mode
vim.opt.scrolloff = 6 -- Minimal num of lines to keep above/below cursor
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cmdheight = 1 -- Better display for messages
vim.opt.updatetime = 300 -- Smaller updatetime for CursorHold & CursorHoldI
vim.opt.cursorline = true -- Highlight current line
vim.opt.hidden = true -- Enable buffers to exist in the background
vim.opt.backup = false -- Don't keep a backup file. writebackup is enough for my purposes.
vim.opt.splitbelow = true -- Open new horizontal splits to the bottom
vim.opt.splitright = true -- And vertical splits to the right
vim.opt.signcolumn = "yes" -- Always show signcolumns
vim.opt.switchbuf = "usetab" -- Search first in opened windows if opening buffer
vim.opt.shortmess:append({ c = true }) -- Don't give ins-completion-menu messages
vim.opt.backspace = { "start", "eol", "indent" } -- Make delete in insert mode behave as expected.
vim.opt.fillchars:append("fold:.") -- Make folds pretty.
vim.opt.tags = "tags"

-- END General Options }}}

-- Tab completion menu
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildignore = {
  "svn",
  "CVS",
  ".git",
  "*.pyc",
  "*.o",
  "*.a",
  "*.class",
  "*.mo",
  "*.la",
  "*.so",
  "*.obj",
  "*.swp",
  "*.jpg",
  "*.png",
  "*.xpm",
  "*.gif",
  "*.pdf",
  "*.bak",
  "*.beam",
  "*/tmp/*",
  "*.zip",
  "log/**",
  "node_modules/**",
  "target/**",
  "tmp/**",
  "*.rbc",
}

-- Undo {{{

vim.opt.undolevels = 1000 -- store a bunch of undo history
vim.opt.undofile = true

-- END Undo }}}

-- Use gtf to jump to files with these extensions
vim.opt.suffixesadd:append(".md,.c,.h,.cpp,.py,.tex")

-- Don't treat hyphens and underscores like whitespace in searches
vim.opt.iskeyword:append({ "-", "_" })

-- Search {{{

vim.opt.showmatch = true -- Show matching brackets/parenthesis
vim.opt.matchtime = 0 -- Don't blink when matching
vim.opt.incsearch = true -- Find as you type search
vim.opt.hlsearch = true -- Highlight search terms
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.inccommand = "nosplit" -- Show regex replacement changes as you're typing
vim.opt.smartcase = true -- Case sensitive if we type an uppercase
vim.opt.mousemodel = "extend"

-- END Search }}}

-- Line breaks {{{

vim.opt.wrap = true
vim.opt.linebreak = false
-- vim.opt.textwidth=120       " TODO: break lines when line length increases only outside of markdown and text files
vim.opt.breakindent = true
vim.opt.breakindentopt = "min:40"
vim.cmd("highlight ColorColumn ctermbg=237")
vim.opt.colorcolumn = "81,121" -- 80 and 120 character guidelines

-- END Line breaks }}}

-- Show “invisible” characters
vim.opt.list = true
vim.opt.listchars = {
  eol = "¬",
  tab = "▸-", -- tab REQUIRES a string of two characters: https://github.com/neovim/neovim/issues/26988
  extends = "»",
  precedes = "«",
  trail = "·",
  space = "·",
}

-- Indentation {{{

vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.cmd("filetype plugin indent on")

vim.opt.expandtab = true -- enter spaces when tab is pressed
vim.opt.tabstop = 4 -- use 4 spaces to represent tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- number of spaces to use for auto indent
vim.opt.autoindent = true -- copy indent from current line when starting a new lineet noexpandtab

-- END Indentation }}}

-- Make vertical splits prettier
vim.opt.fillchars = { vert = "┃" }
vim.cmd("highlight VertSplit guifg=11")

-- Dictionary and Thesaurus {{{

vim.opt.dictionary = "/usr/share/dict/words"
vim.opt.thesaurus = "~/.config/nvim/thesaurus/mthesaur.txt"

-- END Dictionary and Thesaurus }}}

-- Suda {{{

-- This shouldn't have to be set here, but it doesn't work in the suda.lua config
vim.g.suda_smart_edit = 1

-- END Suda }}}

-- vim Diagnostics {{{

vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

-- }}}
