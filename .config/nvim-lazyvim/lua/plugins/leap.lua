return {
  "ggandor/leap.nvim", -- TODO: Doesn't work! vim-easymotion
  --event = { "VeryLazy", "BufReadPre", "BufNewFile" },
  --dependencies = { "tpope/vim-repeat" },
  --keys = {
  --{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
  --{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
  --{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  --},
  config = function()
    require("leap").set_default_keymaps()
  end,
}
