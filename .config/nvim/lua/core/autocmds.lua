-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Folding {{{

vim.api.nvim_create_augroup("Folding", {})

vim.api.nvim_create_autocmd("FileType", {
	group = "Folding",
	pattern = { "vim", "tmux", "lua" },
	callback = function()
		vim.opt.foldcolumn = "2"
		vim.opt.foldmethod = "marker"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = "Folding",
	pattern = { "python" },
	callback = function()
		vim.opt.foldmethod = "indent"
	end,
})

-- End Folding }}}

-- Spellcheck {{{

vim.api.nvim_create_augroup("SpellcheckAndWritingTools", {})

vim.api.nvim_create_autocmd("FileType", {
	group = "SpellcheckAndWritingTools",
	pattern = { "markdown", "text", "mail", "gitcommit", "jrnl" },
	callback = function()
		vim.opt.spell = true
		vim.opt.spelllang = "en_us"
		--vim.cmd([[call litecorrect#init()]]) -- TODO: Doesn't work
		vim.cmd("highlight SpellBad gui=undercurl guifg=#f96161")
	end,
})

-- augroup SpellcheckAndWritingTools
-- autocmd!
-- autocmd FileType markdown,text,mail setlocal spell | call litecorrect#init()
-- hi SpellBad cterm=underline ctermfg=red
-- augroup END
-- END Spellcheck }}}

-- Remove Trailing Whitespace {{{

vim.api.nvim_create_augroup("RemoveTrailingWhitespace", {})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = "RemoveTrailingWhitespace",
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- END Remove Trailing Whitespace }}}

-- Indentation {{{

vim.api.nvim_create_augroup("Indentation", {})
vim.api.nvim_create_autocmd("FileType", {
	group = "Indentation",
	pattern = { "c", "h", "Makefile" },
	callback = function()
		vim.opt.expandtab = false
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = "Indentation",
	pattern = { "python" },
	callback = function()
		vim.opt.expandtab = true
	end,
})

-- END Indentation }}}

-- Set Correct Filetype {{{

vim.api.nvim_create_augroup("SetCorrectFiletype", {})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = "SetCorrectFiletype",
	pattern = { "*.plist" },
	callback = function()
		vim.opt.filetype = "xml"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = "SetCorrectFiletype",
	pattern = { "*.md" },
	callback = function()
		vim.opt.syntax = "on"
		vim.opt.filetype = "markdown"
		vim.opt.conceallevel = 0
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = "SetCorrectFiletype",
	pattern = { "*.txt" },
	callback = function()
		vim.opt.filetype = "text"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = "SetCorrectFiletype",
	pattern = { "*.jrnl" },
	callback = function()
		vim.opt.filetype = "jrnl"
		vim.opt.textwidth = 0
		vim.syntax = "on"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = "SetCorrectFiletype",
	pattern = { "*.js", "*.ts", "*.tsx", "*.jsx" },
	callback = function()
		vim.opt.tabstop = 2
	end,
})

-- End Set Correct Filetype }}}

-- Set Working Dir For Current Buffer {{{

-- TODO: This doesn't work
vim.api.nvim_create_augroup("SetWorkingDirForCurrentBuffer", {})
-- vim.api.nvim_create_autocmd('BufEnter', {
-- group = 'SetWorkingDirForCurrentBuffer',
-- pattern = { '*' },
-- callback = function()
-- vim.cmd('lcd %:p:h')
-- end
-- })

-- END Set Working Dir For Current Buffer }}}

-- Make Folds Persistent {{{

vim.api.nvim_create_augroup("MakeFoldsPersistent", {})
vim.api.nvim_create_autocmd("BufWinLeave", {
	group = "MakeFoldsPersistent",
	pattern = { "*" },
	callback = function()
		vim.cmd.mkview({ mods = { emsg_silent = true } })
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = "MakeFoldsPersistent",
	pattern = { "*" },
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
})

-- END Make Folds Persistent }}}

-- GitCommitFormat {{{

vim.api.nvim_create_augroup("GitCommitFormat", {})
vim.api.nvim_create_autocmd("FileType", {
	group = "GitCommitFormat",
	pattern = { "gitcommit" },
	callback = function()
		vim.opt.textwidth = 72 -- Force the cursor onto a new line after 72 characters
		vim.opt.colorcolumn = "+1" -- Color the 73rd column
		vim.opt.colorcolumn = "+51" -- And the 51st column (for titles)
	end,
})

-- END GitCommitFormat }}}

-- Only configure Markdown Image Pasting for markdown docs {{{

vim.api.nvim_create_augroup("MarkdownImagePaste", {})
vim.api.nvim_create_autocmd("FileType", {
	group = "MarkdownImagePaste",
	pattern = { "markdown", "pandoc" },
	callback = function()
		vim.api.nvim_set_keymap(
			"n",
			"<leader>p",
			":call mdip#MarkdownClipboardImage()<CR>",
			{ noremap = true, silent = true }
		)
	end,
})

-- END MarkdownImagePaste }}}

-- NoPasteAfterLeavingInsertMode {{{

vim.api.nvim_create_augroup("NoPasteAfterLeavingInsertMode", {})
vim.api.nvim_create_autocmd("InsertLeave", {
	group = "NoPasteAfterLeavingInsertMode",
	pattern = { "*" },
	callback = function()
		vim.opt.paste = false
	end,
})

-- END NoPasteAfterLeavingInsertMode }}}

-- Auto Close vim {{{

vim.api.nvim_create_augroup("AutoCloseVim", {})
--  Close vim if the quickfix window is the only window visible (and only tab)
vim.api.nvim_create_autocmd("WinEnter", {
	group = "AutoCloseVim",
	pattern = { "*" },
	callback = function()
		if vim.fn.winnr("$") == 1 and vim.bo.buftype == "quickfix" then
			vim.cmd("quit")
		end
	end,
})

-- vim.api.nvim_create_autocmd("BufDelete", {
--   group = "AutoCloseVim",
--   pattern = { "*" },
--   callback = function()
--     local count = #vim.fn.getbufinfo({ buflisted = true })
--     if count == 0 then
--       vim.cmd("quit")
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("QuitPre", {
	group = "AutoCloseVim",
	callback = function()
		local invalid_win = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("[No Name]") ~= nil then
				table.insert(invalid_win, w)
			end
		end
		if #invalid_win == #wins - 1 then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(invalid_win) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

-- augroup AutoCloseVim
-- autocmd!
-- " https://stackoverflow.com/a/7477056
-- autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | quit | endif
-- " Close vim if only thing remaining is NERDTree
-- autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif
-- " Close vim if only thing remaining is CHADTree
-- autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | quit! | endif
-- " CLose vim if the only thing remaining is an empty buffer with no type
-- " autocmd BufEnter * if (winnr("$") == 1 && &buftype == "" ) | quit! | endif
-- augroup END

-- }}}

-- Uninstall and reinstall pyright the first time a python file is opened this session {{{
-- https://www.reddit.com/r/neovim/comments/1dhmxmd/lsp_doesnt_activate_unless_its_installed_during/

-- local mason_updated = false
-- vim.api.nvim_create_augroup("MasonPyrightUpdate", {})
--
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = "MasonPyrightUpdate",
--   pattern = "*.py",
--   callback = function()
--     if not mason_updated then
--       -- TODO Figure out how to run these in the background
--       vim.cmd("MasonUninstall pyright")
--       vim.cmd("MasonInstall pyright")
--       mason_updated = true
--     end
--   end,
-- })

-- }}}
