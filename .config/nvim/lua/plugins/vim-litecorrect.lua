return {
  "preservim/vim-litecorrect",
  lazy = true,
  ft = { "markdown", "text" },
  config = function()
    vim.cmd([[call litecorrect#init()]])
  end,
}
