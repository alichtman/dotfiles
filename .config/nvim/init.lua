if vim.env.VSCODE then
  vim.g.vscode = true
end

require("core.options")
require("lazy-config")
require("core.abbreviations")
require("core.autocmds")
require("core.commands")
require("core.functions")
require("core.keymaps")
require("core.reload")
