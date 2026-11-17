-- Mason package names (see :Mason)
local tools = {
  -- LSP
  "lua-language-server",
  "pyright",
  "ruff",
  "typescript-language-server",
  "eslint-lsp",
  "gopls",
  "clangd",
  "rust-analyzer",
  "bash-language-server",
  "json-lsp",
  "yaml-language-server",
  -- Formatter
  "stylua",
  "prettier",
  "goimports",
  "gofumpt",
  "clang-format",
  "shfmt",
}

return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Completion capabilities for every server
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Per-server settings
      vim.lsp.config("gopls", {
        settings = { gopls = { gofumpt = true, staticcheck = true } },
      })
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
      })

      -- Auto vim.lsp.enable() every server installed via Mason
      require("mason-lspconfig").setup({})

      require("mason-tool-installer").setup({
        ensure_installed = tools,
        run_on_start = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buf = args.buf
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
          end

          -- Let pyright handle hover; ruff only lints
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("<leader>ch", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
          end, "Toggle inlay hints")
        end,
      })
    end,
  },
}
