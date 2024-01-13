-- TODO!

-- function! ReplaceAppleQuotes() abort
-- silent! %s/[“”]/"/g
-- silent! %s/[’]/'/g
-- echo "Replaced Apple Quotes"
-- endfunction
--
-- command! ReplaceAppleQuotes call ReplaceAppleQuotes()

-- Append modeline after last line in buffer
-- This function can't be at the top, or it's read as a modeline haha
function AppendModeline()
  local modeline = string.format(
    "# vim: ts=%d sw=%d tw=%d %set :",
    vim.o.tabstop,
    vim.o.shiftwidth,
    vim.o.textwidth,
    vim.o.expandtab and "" or "no"
  )
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { modeline })
  vim.api.nvim_exec("doautocmd BufRead", false)
end
