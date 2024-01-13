return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
  },
  keys = {
    { "<leader>e", false },
    { "<C-n>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    { "<C-N>", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  config = function()
    require("neo-tree").setup()
  end,
}
