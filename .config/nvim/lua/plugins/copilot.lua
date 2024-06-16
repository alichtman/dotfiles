return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  event = "InsertEnter",
  cmd = "Copilot",
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
    },
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
        accept_line = "<C-;>",
        accept_word = "<C-,>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<C-l>",
        accept_line = "<C-;>",
        accept_word = "<C-,>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4,
      },
    },
    filetypes = { markdown = true, jrnl = false, help = false },
  },
}
