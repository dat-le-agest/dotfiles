return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep project" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume last search" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Diagnostics" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Symbols" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks (bookmark)" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", mode = { "n", "v" }, desc = "Code action" },
  },
  init = function()
    -- Use fzf-lua for vim.ui.select (gra, rename prompts, TermSelect...), loading it on first use
    vim.ui.select = function(...)
      require("fzf-lua").register_ui_select()
      return vim.ui.select(...)
    end
  end,
  opts = {
    -- Register as vim.ui.select as soon as fzf-lua loads (needed by <leader>ca)
    ui_select = {},
  },
}
