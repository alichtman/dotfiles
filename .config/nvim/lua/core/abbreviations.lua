-- Abbreviations {{{

-- Insert timestamp
vim.cmd("iabbrev dts " .. os.date("%a, %b %d, %Y -- %X"), { expr = true })

-- Spelling corrections

vim.cmd.iabbrev({
	"<buffer>",
	"yb",
	"by",
})

vim.cmd.iabbrev({
	"<buffer>",
	"ni",
	"in",
})

-- END Abbreviations }}}
