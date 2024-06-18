return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    { "<C-u>", "<cmd>TextCaseOpenTelescope<CR>", mode = { "v" }, desc = "Telescope" },
  },
}
