vim.opt.termguicolors = true
vim.g.gruvbox_contrast_dark = "dark"
vim.g.palenight_terminal_italics = 1

vim.g.daycula_current_word = "bold"

vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1

-- TODO: Add all of the other colorschemes, and something like thematic

-- Ignore colorschemes that I'll never use
vim.opt.wildignore = vim.opt.wildignore + { "blue.vim", "darkblue.vim", "industry.vim", "zaibatsu.vim", "zellner.vim" }

return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string // TODO: Change to empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
  },

  { "shaunsingh/oxocarbon.nvim" },

  { "rose-pine/neovim", name = "rose-pine" },

  {
    "folke/tokyonight.nvim",
    lazy = true,

    opts = function()
      return {
        style = "moon",
        -- transparent = true,
        -- styles = {
        --   sidebars = "transparent",
        --   floats = "transparent",
        -- },
        sidebars = {
          "qf",
          "vista_kind",
          "terminal",
          "spectre_panel",
          "startuptime",
          "Outline",
        },
        on_colors = function(c)
          -- local hsluv = require("tokyonight.hsluv")
          -- local function randomColor(color)
          --   if color ~= "NONE" then
          --     local hsl = hsluv.hex_to_hsluv(color)
          --     hsl[1] = math.random(0, 360)
          --     return hsluv.hsluv_to_hex(hsl)
          --   end
          --   return color
          -- end
          -- local function set(colors)
          --   if type(colors) == "table" then
          --     for k, v in pairs(colors) do
          --       if type(v) == "string" then
          --         colors[k] = randomColor(v)
          --       elseif type(v) == "table" then
          --         set(v)
          --       end
          --     end
          --   end
          -- end
          -- set(c)
        end,
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          -- hl.LineNr = { fg = c.orange, bold = true }
          hl.LineNrAbove = { fg = c.fg_gutter }
          hl.LineNrBelow = { fg = c.fg_gutter }
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
  },
}
