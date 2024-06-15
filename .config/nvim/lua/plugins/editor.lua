local Util = require("lazyvim.util")

# https://github.com/SethGunnells/dotfiles/blob/b3fae694b114e213b63f6a45efd7ee98e00430f5/nvim/lua/plugins/telescope.lua#L49-L76
local function get_git_root_opts()
  local opts = {}
  if is_git_repo() then
    local dot_git_path = vim.fn.finddir(".git", ".;")
    opts = { cwd = vim.fn.fnamemodify(dot_git_path, ":h") }
  end
  return opts
end

local function make_find_files(from_root)
  return function()
    local opts = {
      hidden = true,
      previewer = false,
      path_display = {
        shorten = {
          len = 5,
          exclude = { -1, -2 },
        },
      },
    }
    if from_root then
      opts = vim.tbl_extend("force", opts, get_git_root_opts())
    end
    require("telescope.builtin").find_files(opts)
  end
end

return {
  -- Disabling S so it doesn't conflict with vim-surround
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
        -- stylua: ignore
        keys = {
            { "S", false },
        },
  },

  -- Fuzzy finder.
  -- The default key bindings to find files will use Telescope's
  -- `find_files` or `git_files` depending on whether the
  -- directory is a git repo.
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      --{ "<C-P>", make_find_files(false), desc = "Telescope - Find Files (CWD)" },
      --{ "<C-p>", make_find_files(true), desc = "Telescope - Find Files (Git Root)" },
      --{ "<C-p>", Util.pick.telescope("find_files"), desc = "Find Files (git root)" },
      -- find
      --{ "<leader>fg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      --{ "<leader>fG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      keys = {
        { "<leader>v", require("telescope.builtin").treesitter, { desc = "Show treesitter symbols" } },
      },
    },
  },
}
