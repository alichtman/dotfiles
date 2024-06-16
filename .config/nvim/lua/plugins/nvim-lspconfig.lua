return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {},
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable K for hover becuase it interferes with K to move things to a new line
    keys[#keys + 1] = { "K", false }
    -- map H to hover
    keys[#keys + 1] = { "H", vim.lsp.buf.hover, desc = "Hover" }
  end,
}
