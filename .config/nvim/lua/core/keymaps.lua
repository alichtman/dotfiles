-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local configPath = vim.fn.stdpath("config")

-- Quickly edit important configs
vim.keymap.set("n", "<leader>ev", function()
  require("telescope.builtin").find_files({ cwd = configPath })
end, { silent = true, desc = "Edit vim config" })

vim.keymap.set("n", "<leader>ec", function()
  require("telescope.builtin").find_files({ cwd = "~/.config/" })
end, { silent = true, desc = "Edit config files" })

vim.keymap.set("n", "<leader>sv", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

-- Don't overwrite copy register when deleting with x or X
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "X", '"_X', { noremap = true })

-- Read modeline
vim.keymap.set("n", "<leader>mr", ":doautocmd BufRead<cr>")

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

-- Make U (redo) do the opposite of u (undo)
vim.keymap.set("n", "U", "<C-r>")

-- Make K split the current line at the cursor (the opposite of J)
vim.keymap.set("n", "K", "i<CR><Esc>")

-- Quickly save, only writing the file if there are changes
vim.keymap.set("n", "<leader>w", ":up<CR>")

-- Open URL under cursor with gx
vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<CR>")

-- Don't touch unnamed register when pasting over visual selection
vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

-- Quickly select the text you just pasted
vim.keymap.set("n", "gV", "`[v`]")

-- Automatically jump to end of pasted text
vim.keymap.set("n", "p", "p`]", { remap = true })

-- Change word under cursor. Repeatable with . https://youtu.be/7Bx_mLDBtRc?t=130
vim.keymap.set("n", "c*", "*Ncgn", { remap = true })

-- lazy.nvim makes j and k operate on virtual lines by default. Do the same for arrow keys
vim.keymap.set("n", "<Up>", "gk", { noremap = true, buffer = true, silent = true })
vim.keymap.set("n", "<Down>", "gj", { noremap = true, buffer = true, silent = true })
vim.keymap.set("i", "<Up>", "<C-o>gk", { noremap = true, buffer = true, silent = true })
vim.keymap.set("i", "<Down>", "<C-o>gj", { noremap = true, buffer = true, silent = true })

-- Quickly tabularize selected block
-- vnoremap <leader>t :Tabularize / \|<cr>

-- TIP: Traverse buffer list more easily.
-- Shift + h/l to cycle through buffers. Shift + arrow left / right to move tmux windows

-- " Quickly close Quickfix and Location Windows
-- nnoremap <script> <silent> <leader>tl :lclose<CR>
-- nnoremap <script> <silent> <leader>tq :cclose<CR>

-- Toggle spell check
vim.keymap.set("n", "[]s", ":set spell!<CR>", { desc = "Toggle spell check" })

-- TODO: Markdown Preview
-- nnoremap <silent> <leader>mp :GripStop<cr> :GripStart<cr>
-- nnoremap <silent> <leader>mpp :Pandoc pdf<cr>

-- Run macro over visual range with @REG
vim.keymap.set("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true })

-- If you write with a visual block selected, ignore the "write partial file" feature and just write the whole file
vim.cmd([[ cabbrev <expr> w getcmdtype()==':' && getcmdline() == "'<,'>w" ? '<c-u>w' : 'w' ]])
vim.cmd([[ cabbrev <expr> W getcmdtype()==':' && getcmdline() == "'<,'>W" ? '<c-u>w' : 'w' ]])
