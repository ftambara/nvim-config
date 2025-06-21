---Run the first available formatter followed by more formatters
---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
    local conform = require "conform"
    for i = 1, select("#", ...) do
        local formatter = select(i, ...)
        if conform.get_formatter_info(formatter, bufnr).available then
            return formatter
        end
    end
    return select(1, ...)
end

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        { "<leader>cn", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            -- lua = { "stylua" },
            go = { "goimports", "gofmt" },
            python = { "ruff" },
            -- Install prettier globally.
            -- npm install -g prettier@latest
            ["json"] = { "biome" },
            ["markdown"] = { "prettier" },
            ["javascript"] = { "biome", "prettier", stop_after_first = true },
            ["javascriptreact"] = function(bufnr)
                return { "rustywind", first(bufnr, "biome", "prettier") }
            end,
            ["typescript"] = { "biome", "prettier", stop_after_first = true },
            ["typescriptreact"] = function(bufnr)
                return { "rustywind", first(bufnr, "biome", "prettier") }
            end,
            ["svelte"] = function(bufnr)
                return { "rustywind", first(bufnr, "biome", "prettier") }
            end,
        },
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
        },

        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Set up format-on-save
        format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
