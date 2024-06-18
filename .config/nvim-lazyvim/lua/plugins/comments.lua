return {
  -- TODO: Migrate to built in commenting support: https://github.com/neovim/neovim/blob/20f22f75ee629ae2db4cd99e730fa0af26553177/runtime/doc/various.txt#L566
  {
    "scrooloose/nerdcommenter",
    cmd = { "NERDCommenterToggle" },
    keys = {
      { mode = { "n" }, "<A-/>", "<Plug>NERDCommenterToggle" }, -- Mirrors VS Code commenting keymap
      { mode = { "v" }, "<A-/>", "<Plug>NERDCommenterToggle<CR>gv" }, -- Mirrors VS Code commenting keymap
      { mode = { "n" }, "<leader>cc", "<Plug>NERDCommenterComment", { desc = "Comment Line" } },
      { mode = { "v" }, "<leader>cc", "<Plug>NERDCommenterComment<CR>gv", { desc = "Comment Line" } },
      { mode = { "n" }, "<leader>ccc", "<Plug>NERDCommenterUncomment", { desc = "Uncomment Line" } },
      { mode = { "v" }, "<leader>ccc", "<Plug>NERDCommenterUncomment<CR>gv", { desc = "Uncomment Line" } },
    },
    setup = function()
      vim.g.NERDSetDefaultMappings = 0 -- " Set to 1 if you want all maps to be set. Setting this to 0 allows you to only use the mappings you specifically want.
      vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters
      vim.g.NERDCommentEmptyLines = 1 -- " Allow commenting and inverting empty lines (useful when commenting a region)
      vim.g.NERDTrimTrailingWhitespace = 1 -- " Trim trailing whitespace when uncommenting
    end,
  },
}
