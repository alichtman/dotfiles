local Util = require("lazyvim.util")

return {
    -- Disabling S so it doesn't conflict with vim-surround
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "S", false },
        },
    },


    -- Fuzzy finder.
    -- The default key bindings to find files will use Telescope's
    -- `find_files` or `git_files` depending on whether the
    -- directory is a git repo.
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false, -- telescope did only one release, so use HEAD for now
        keys = {
            {
                "<leader>,",
                "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
                desc = "Switch Buffer",
            },
            { "<leader>/",       false },
            { "<C-p>",           Util.telescope("files"),                      desc = "Find Files (git root)" },
            { "<leader><space>", false },
            -- find
            { "<leader>fg",      Util.telescope("live_grep"),                  desc = "Grep (root dir)" },
            { "<leader>fG",      Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
            { "<leader>sg",      false },
            { "<leader>sG",      false },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            keys = {
                { '<leader>v', Util.telescope("treesitter"), { desc = "Show treesitter symbols" } }
            }
        },
    },

}
