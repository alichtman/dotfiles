return { -- TODO: Doesn't work!
    "lambdalisue/suda.vim",
    lazy = false,
    cmd = { "SudaRead", "SudaWrite" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.g.suda_smart_edit = true
    end,
}
