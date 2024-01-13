return {

    -- {
        -- 'jinh0/eyeliner.nvim',
        -- config = function()
            -- require 'eyeliner'.setup {
                -- highlight_on_key = true,
            -- }
        -- end
    -- },
--
    { -- TODO: Doesn't work!
        "nacro90/numb.nvim",
        config = function(_)
            require("numb").setup()
        end,
    },


    { 'reedes/vim-litecorrect' },
    -- better diffing
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
        opts = {},
        keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
    },

    {
        -- TODO: Doesn't work!
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup({

                -- --LHS of toggle mappings in NORMAL mode
                -- toggler = {
                -- --Line-comment toggle keymap
                -- line = 'gcc',
                -- ---Block-comment toggle keymap
                -- block = 'gcc',
                -- },
                -- -- Configuration here, or leave empty to use defaults
            })
            -- vim.keymap.set('x', '<leader>cc', '<Plug>(comment_toggle_linewise)', { noremap = false })
            -- -- vim.keymap.set('n', '<leader>cc', 'my<cmd>norm vip<bar>gc<cr>`y')
            -- vim.keymap.set("n", "<leader>cc", "<cmd>Commentary<cr>")
            -- vim.keymap.set("v", "<leader>cc", "<cmd>Commentary<cr>")
            -- vim.keymap.set("n", "<A-/>", vim.cmd.Commentary)
            -- vim.keymap.set("v", "<A-/>", vim.cmd.Commentary)
        end

    },

    {
        "jackMort/ChatGPT.nvim",
        cmd = { "ChatGPTActAs", "ChatGPT" },
        opts = {},
    },
}
