return {
  "RRethy/vim-illuminate",
  config = function()
    -- Highlight symbol under cursor on hover
    -- TODO: Make this theme-agnostic
    local background_color = require("gruvbox").palette["dark1"]
    vim.cmd("hi IlluminatedWordText guibg=" .. background_color)
    vim.cmd("hi IlluminatedWordRead guibg=" .. background_color)
    vim.cmd("hi IlluminatedWordWrite guibg=" .. background_color)
  end,
}
