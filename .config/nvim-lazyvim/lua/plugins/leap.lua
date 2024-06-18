return {
  "ggandor/leap.nvim",
  enabled = true,
  dependencies = { "tpope/vim-repeat" },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
      end,
      desc = "Leap anywhere on current window",
    },
  },
}
