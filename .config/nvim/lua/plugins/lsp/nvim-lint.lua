return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters.markdownlint.args = {
      "--disable",
      "MD013", -- disable line length limit
      "MD024", -- allow multiple headings with the same comment
      "MD030", -- allow spaces after list markers
      "MD033", -- allow inline HTML
      "MD036", -- allow emphasis blocks
      "MD040", -- allow code blocks without language specification
      "MD041", -- allow non-headers on the first line, e.g. meta section
      "MD046", -- allow mixed code-block styles
    }
  end,
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    },
  },
}
