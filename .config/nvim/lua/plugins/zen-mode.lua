return {
  -- dir = "~/Desktop/Development/open-source-contributions/zen-mode.nvim",
  "alichtman/zen-mode.nvim",
  -- "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  cmd = "ZenMode",
  opts = {
    plugins = {
      gitsigns = true,
      tmux = false,
    },
    dont_exit_on_win_enter = true,
  },
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
