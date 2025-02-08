return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<C-n>", ":Neotree toggle<CR>", desc = "Explorer NeoTree (root dir)", remap = true },
    -- { "<C-N>", ":Neotree toggle<CR>", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  config = function()
    require("neo-tree").setup({
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
          reveal = true,
        },
      },
    })
  end,
}
