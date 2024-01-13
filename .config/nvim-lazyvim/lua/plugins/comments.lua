return {
  {
    "scrooloose/nerdcommenter",
    cmd = { "NERDCommenterToggle" },
    keys = {
      { mode = { "n", "v" }, "<A-/>", "<Plug>NERDCommenterToggle" }, -- Mirrors VS Code commenting keymap
      { mode = { "n", "v" }, "<leader>cc", "<Plug>NERDCommenterComment", { desc = "Comment Line" } },
      { mode = { "n", "v" }, "<leader>ccc", "<Plug>NERDCommenterUncomment", { desc = "Uncomment Line" } },
    },
    setup = function()
      vim.g.NERDSetDefaultMappings = 0 -- " Set to 1 if you want all maps to be set. Setting this to 0 allows you to only use the mappings you specifically want.
      vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters
      vim.g.NERDCommentEmptyLines = 1 -- " Allow commenting and inverting empty lines (useful when commenting a region)
      vim.g.NERDTrimTrailingWhitespace = 1 -- " Trim trailing whitespace when uncommenting
    end,
  },
}
