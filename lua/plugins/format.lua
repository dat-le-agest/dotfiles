local web = { "prettier" }

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      go = { "goimports", "gofumpt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      rust = { "rustfmt" }, -- ships with the Rust toolchain from mise
      sh = { "shfmt" },
      javascript = web,
      typescript = web,
      javascriptreact = web,
      typescriptreact = web,
      json = web,
      yaml = web,
      css = web,
      html = web,
      markdown = web,
    },
    format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
  },
}
