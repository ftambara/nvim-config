local lsp_zero = require("lsp-zero")

-- Keybindings
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Mason
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  name = "clangd",
  cmd = {"clangd", "--background-index", "--clang-tidy", "--log=verbose"},
  initialization_options = {
    fallback_flags = { "-std=c++17" },
  },
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

lspconfig.racket_langserver.setup({
  cmd = { "racket", "--lib", "racket-langserver"},
  filetypes = { "racket" },
})

lspconfig.pyright.setup({
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        -- ignore = { '*' },
      },
    },
  },
})

lspconfig.ruff.setup({
    init_options = {
        settings = {
            lint = {
                enable = true,
                preview = true,
            },
            format = {
                preview = true,
            },
        },
    },
})

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = false,
      },
      validate = true,
      completion = true,
      editor = {
        tabSize = 4,
      },
    },
  },
})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})
