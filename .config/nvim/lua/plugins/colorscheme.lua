vim.opt.termguicolors = true

-- Ignore colorschemes that I'll never use
vim.opt.wildignore = vim.opt.wildignore
  + {
    "blue.vim",
    "darkblue.vim",
    "default.vim",
    "delek.vim",
    "desert.vim",
    "elflord.vim",
    "evening.vim",
    "lunaperche.vim",
    "habamax.vim",
    "industry.vim",
    "koehler.vim",
    "morning.vim",
    "murphy.vim",
    "ron.vim",
    "ron.vim",
    "pablo.vim",
    "slate.vim",
    "vim",
    "rose-pine.vim",
    "sorbet.vim",
    "torte.vim",
    "wildcharm.vim",
    "zaibatsu.vim",
    "zellner.vim",
  }

-- NOTE: If you want colorschemes to show up in the picker, you CAN NOT lazy load them

return {
  {
    "sainnhe/everforest",
    lazy = false,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
      require("lualine").setup({
        options = {
          theme = "everforest",
        },
      })
    end,
  },
  {
    "drewtempelmeyer/palenight.vim",
    lazy = false,
    config = function()
      vim.g.palenight_terminal_italics = 1
      require("lualine").setup({
        options = {
          theme = "palenight",
        },
      })
    end,
  },
  { "mhartington/oceanic-next", name = "OceanicNext", lazy = false },
  { "reedes/vim-colors-pencil", lazy = false },
  {
    "ghifarit53/daycula-vim",
    lazy = false,
    config = function()
      vim.g.daycula_current_word = "bold"

      require("lualine").setup({
        options = {
          theme = "nightfly",
        },
      })
    end,
  },
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

  -- {
  -- 	"LazyVim/LazyVim",
  -- 	opts = {
  -- 		colorscheme = "gruvbox",
  -- 	},
  -- },
}
