return  {
 {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        -- tmux = true,
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
    {
  "rrethy/vim-illuminate",
  config = function()
    -- highlight symbol under cursor on hover
    -- todo: make this theme-agnostic
    local background_color = require("gruvbox").palette["dark1"]
    vim.cmd("hi illuminatedwordtext guibg=" .. background_color)
    vim.cmd("hi illuminatedwordread guibg=" .. background_color)
    vim.cmd("hi illuminatedwordwrite guibg=" .. background_color)
  end,
},
}
