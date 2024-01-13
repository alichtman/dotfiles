-- return {
-- "tomtom/tcomment_vim",
-- cmd = "TComment",
-- config = function()
-- vim.keymap.set("n", "<leader>cc", "<Plug>:TComment<CR>", { desc = "Toggle Comment" })
-- vim.keymap.set("v", "<leader>cc", "<Plug>:TCommentBlock<CR>gv", { desc = "Toggle Comment"})
-- end,
-- }
--

return {
    'numToStr/Comment.nvim',
    -- opts = {
        ---LHS of toggle mappings in NORMAL mode
        -- toggler = {
            ---Line-comment toggle keymap
            -- line = ',cc',
            -- ---Block-comment toggle keymap
            -- block = ',cc',
        -- },
        -- add any options here
    -- },
    -- cmd = "Commentary",
    -- event = "VeryLazy",
    -- config = function()
    -- -- Maintain cursor position
    -- vim.keymap.set('x', '<leader>cc', '<Plug>Commentary', { noremap = false })
    -- -- vim.keymap.set('n', '<leader>cc', 'my<cmd>norm vip<bar>gc<cr>`y')
    -- vim.keymap.set("n", "<leader>cc", "<cmd>Commentary<cr>")
    -- vim.keymap.set("v", "<leader>cc", "<cmd>Commentary<cr>")
    -- vim.keymap.set("n", "<A-/>", vim.cmd.Commentary)
    -- vim.keymap.set("v", "<A-/>", vim.cmd.Commentary)
    -- end,
}
