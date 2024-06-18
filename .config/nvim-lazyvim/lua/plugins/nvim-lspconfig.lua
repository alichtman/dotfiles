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
  on_attach = function(buffer)
    local opts = { noremap = true, silent = true, buffer = buffer }
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set({ "n", "v" }, "<leader>fmt", vim.lsp.buf.format, opts)
    vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=" .. buffer .. "<cr>", opts)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover, opts)
  end,
}
