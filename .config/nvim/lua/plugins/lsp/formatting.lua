return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Web development
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },

        -- Markdown
        markdown = { "mdformat" },

        -- Lua
        lua = { "stylua" }, -- Fast, highly configurable

        -- Python
        python = { "isort", "black" }, -- isort for imports, black for code

        -- Rust
        rust = { "rustfmt" }, -- Official formatter

        -- Go
        go = { "gofmt", "goimports" }, -- Standard Go formatters

        -- Shell scripts
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },

        -- C/C++
        c = { "clang_format" },
        cpp = { "clang_format" },
        cuda = { "clang_format" },

        -- C#
        cs = { "csharpier" },

        -- Java
        java = { "google-java-format" },

        -- SQL
        sql = { "sqlfmt" },

        -- Misc formats
        toml = { "taplo" },
        xml = { "xmlformat" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
