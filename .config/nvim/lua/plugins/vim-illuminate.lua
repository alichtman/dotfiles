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
        "TelescopePrompt",
        "markdown",
        "jrnl",
      },
    })
    vim.api.nvim_create_augroup("highlight_symbol_under_cursor", { clear = true })

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      group = "highlight_symbol_under_cursor",
      callback = function()
        local formatting_opts = { fg = "#ff8700", bold = true }
        vim.api.nvim_set_hl(0, "IlluminatedWordText", formatting_opts)
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", formatting_opts)
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", formatting_opts)
      end,
      desc = "Highlight symbol under cursor",
    })
  end,
}
