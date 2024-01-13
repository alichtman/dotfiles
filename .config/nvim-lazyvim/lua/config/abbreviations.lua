-- Abbreviations {{{

-- TODO: Doesn't work!

-- Insert timestamp
vim.cmd('iabbrev <expr> dts strftime("%a, %b %d, %Y -- %X")')

-- Spelling corrections

vim.cmd.iabbrev({
  "<buffer>",
  "yb",
  "by",
})

vim.cmd({
  "<buffer>",
  "ni",
  "in",
})

vim.cmd("iabbrev <buffer> true True")

-- END Abbreviations }}}
