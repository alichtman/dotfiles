return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
        "NvimTree",
        "undotree",
        "alpha",
      },
    })
    vim.api.nvim_create_augroup("highlight_symbol_under_cursor", { clear = true })

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      group = "highlight_symbol_under_cursor",
      callback = function()
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "IncSearch" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "IncSearch" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "IncSearch" })
      end,
      desc = "Highlight symbol under cursor",
    })
  end,
}
