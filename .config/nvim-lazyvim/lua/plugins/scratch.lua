return {
  "mtth/scratch.vim",

  keys = {
    { "<leader>sp", ":ScratchPreview<CR>", mode = "n", noremap = true, silent = true },
    { "<leader>sp", ":ScratchSelection<CR>", mode = "v", noremap = true, silent = true },
  },

  init = function()
    vim.g.scratch_no_mappings = 1
    vim.g.scratch_persistence_file = "~/scratchpad/vim-scratchpad.txt"
    vim.g.scratch_autohide = 0
  end,
}
