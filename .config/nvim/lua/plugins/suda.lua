return {
  "lambdalisue/suda.vim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- vim.g.suda_smart_edit = 1 -- Set in options.lua because it wasn't working here.
    vim.g["suda#prompt"] = "Enter sudo password: "
  end,
}
