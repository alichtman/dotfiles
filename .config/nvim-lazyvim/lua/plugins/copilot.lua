return {
    -- {
    -- "zbirenbaum/copilot.lua",
    -- enabled = true,
    -- event = "InsertEnter",
    -- cmd = "Copilot",
    -- dependencies = {
    -- {
    -- "zbirenbaum/copilot-cmp",
    -- },
    -- },
    -- keys = {
    -- { "i", "<A-l>", require("copilot.suggestion").accept() },
    -- { "i", "<A-;>", require("copilot.suggestion").accept_line() },
    -- { "i", "<A-,>", require("copilot.suggestion").accept_word() },
    -- },
    -- opts = {
    -- -- suggestion = { enabled = false },
    -- -- panel = { enabled = false },
    -- suggestion = {
    -- auto_trigger = true,
    -- keymap = {
    -- accept = "<A-;>",
    -- accept_line = "<A-l>",
    -- accept_word = "<A-,>",
    -- },
    -- },
    -- filetypes = {
    -- -- Enable Copilot in all files
    -- ["*"] = true,
    -- -- Disable in jrnl
    -- jrnl = true,
    --
    -- },
    -- config = function()
    -- require("copilot").setup({})
    -- end,
    -- },
    -- },
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        event = "InsertEnter",
        cmd = "Copilot",
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
            },
        },
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<A-l>",
                    accept_line = "<A-;>",
                    accept_word = "<A-,>",
                }
            },
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<A-l>",
                    accept_line = "<A-;>",
                    accept_word = "<A-,>",
                    refresh = "gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            filetypes = { markdown = true, help = true, },
        },
    }

}
