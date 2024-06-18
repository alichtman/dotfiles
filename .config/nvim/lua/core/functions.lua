vim.api.nvim_create_user_command("ReplaceAppleQuotes", function()
	vim.api.nvim_command('silent! %s/[“”]/"/g')
	vim.api.nvim_command("silent! %s/[’]/'/g")
	print("Replaced Apple Quotes")
end, { bang = true })

-- Append modeline after last line in buffer
vim.api.nvim_create_user_command("AppendModeline", function()
	local modeline = string.format(
		"# vim: ts=%d sw=%d tw=%d %set :",
		vim.o.tabstop,
		vim.o.shiftwidth,
		vim.o.textwidth,
		vim.o.expandtab and "" or "no"
	)
	vim.api.nvim_buf_set_lines(0, -1, -1, false, { modeline })
	vim.api.nvim_exec("doautocmd BufRead", false)
end, { bang = true })

-- Banish "not an editor command" errors
vim.api.nvim_create_user_command("WQ", function()
	vim.cmd("wq")
end, { bang = true })
vim.api.nvim_create_user_command("Wq", function()
	vim.cmd("wq")
end, { bang = true })
vim.api.nvim_create_user_command("W", function()
	vim.cmd("w")
end, { bang = true })
vim.api.nvim_create_user_command("Q", function()
	vim.cmd("q")
end, { bang = true })
vim.api.nvim_create_user_command("QA", function()
	vim.cmd("qa")
end, { bang = true })
vim.api.nvim_create_user_command("Qa", function()
	vim.cmd("qa")
end, { bang = true })
