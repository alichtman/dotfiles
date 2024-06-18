return {
  "anuvyklack/windows.nvim",
  event = "WinNew",
  dependencies = {
    { "anuvyklack/middleclass" },
    { "anuvyklack/animation.nvim", enabled = false },
  },
  keys = { { "<leader>m", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
  config = function()
    vim.o.winwidth = 5
    vim.o.equalalways = false
    require("windows").setup({
      animation = { enable = false, duration = 150 },
    })
  end,
}
