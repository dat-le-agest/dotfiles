return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "auto", globalstatus = true },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      -- Override default [b/]b to follow the order shown in the bufferline
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      -- Faster buffer switching (replaces H/L = top/bottom of screen)
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
      {
        "<leader>bd",
        function()
          -- Close the buffer but keep the window
          local buf = vim.api.nvim_get_current_buf()
          if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
            vim.cmd("BufferLineCyclePrev")
          else
            vim.cmd("enew")
          end
          vim.cmd("confirm bdelete " .. buf)
        end,
        desc = "Close buffer",
      },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin/unpin buffer" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick buffer by letter" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        offsets = {
          { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "left" },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    opts = {
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>c", group = "Code" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Search & replace" },
        { "<leader>b", group = "Buffer" },
        { "<leader>t", group = "Terminal" },
      },
    },
  },
}
