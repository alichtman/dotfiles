return {
  "jackMort/ChatGPT.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = { "ChatGPT" },
  config = function()
    require("chatgpt").setup()
  end,
}
