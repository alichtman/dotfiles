return {
    "mbbill/undotree",
    init = function()
        -- vim.g.undotree_WindowLayout = 4
        -- vim.g.undotree_ShortIndicators = 0
        -- vim.g.undotree_DiffpanelHeight = 10
        -- vim.g.undotree_DiffAutoOpen = 1
        vim.g.undotree_SetFocusWhenToggle = 1
        -- vim.g.undotree_SplitWidth = 40
        -- vim.g.undotree_TreeNodeShape = "*"
        -- vim.g.undotree_TreeVertShape = "|"
        -- vim.g.undotree_TreeSplitShape = "/"
        -- vim.g.undotree_TreeReturnShape = "\\"
        -- vim.g.undotree_DiffCommand = "diff"
        -- vim.g.undotree_RelativeTimestamp = 1
        -- vim.g.undotree_HighlightChangedText = 1
        -- vim.g.undotree_HighlightChangedWithSign = 1
        -- vim.g.undotree_HighlightSyntaxAdd = "DiffAdd"
        -- vim.g.undotree_HighlightSyntaxChange = "DiffChange"
        -- vim.g.undotree_HighlightSyntaxDel = "DiffDelete"
        -- vim.g.undotree_HelpLine = 1
        -- vim.g.undotree_CursorLine = 1
    end,
    cmd = "UndotreeToggle",
    keys = {
        { "<leader>u", ":UndotreeToggle<cr>:UndotreeFocus<cr>", desc = "Undo Tree" },
    }
}
