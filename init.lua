require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

vim.lsp.enable({
    "bashls",
    "biome",
    "eslint",
    "gopls",
    "luals",
    "phpactor",
    "pyright",
    "ruff",
})
