return {
  "nacro90/numb.nvim", -- TODO: Doesn't work!
  lazy = false,
  config = function(_)
    require("numb").setup()
  end,
}
