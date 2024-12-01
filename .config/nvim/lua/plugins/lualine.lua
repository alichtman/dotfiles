return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- https://github.com/nvim-lualine/lualine.nvim/issues/1312
    vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
    vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })

    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    lualine.setup({
      options = {
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          { "encoding" },
          { "fileformat", icons_enabled = false },
          { "filetype" },
        },
        -- lualine_x = { "progress" },

        -- lualine_y = { "location" },
        -- lualine_y = { "encoding", { "fileformat", icons_enabled = false } },
        -- lualine_z = {
        --   { "filetype" },
        -- },
      },
    })
  end,
}
