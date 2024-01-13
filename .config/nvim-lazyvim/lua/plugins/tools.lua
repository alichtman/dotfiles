return {

  { -- TODO: Doesn't work!
    "nacro90/numb.nvim",
    config = function(_)
      require("numb").setup()
    end,
  },
  { "ggandor/leap.nvim" },

  -- Unix Tools
  {
    "tpope/vim-eunuch",
    cmd = { "Delete", "Move", "Rename", "Chmod", "Mkdir" },
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {},
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },

  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPTActAs", "ChatGPT" },
    opts = {},
  },
}
