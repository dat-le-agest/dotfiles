return {
  {
    "saghen/blink.cmp",
    -- v2: requires blink.lib; the Rust fuzzy matcher is built with cargo from mise
    dependencies = { "saghen/blink.lib", "rafamadriz/friendly-snippets" },
    build = function()
      require("blink.cmp").build():pwait()
    end,
    opts = {
      keymap = { preset = "default" }, -- C-y accept, C-n/C-p select, C-space open menu
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
      },
      signature = { enabled = true },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- do not pair inside strings/comments (treesitter)
    },
  },
  {
    -- Auto close and auto rename HTML/JSX tags
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
