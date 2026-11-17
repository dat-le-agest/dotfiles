return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle reveal<cr>", desc = "File tree" },
      { "<leader>be", "<cmd>Neotree toggle buffers<cr>", desc = "Buffer list" },
    },
    opts = function()
      -- `o` is the "Order by" prefix by default (oc, od, on, ...); drop it and use `o` to open
      local o_open = {
        ["o"] = "open",
        ["oc"] = "none",
        ["od"] = "none",
        ["og"] = "none",
        ["om"] = "none",
        ["on"] = "none",
        ["os"] = "none",
        ["ot"] = "none",
      }
      return {
        close_if_last_window = true,
        window = { width = 32, mappings = { ["o"] = "open" } },
        filesystem = {
          -- Let oil handle opening directories (nvim .); neo-tree is only a sidebar
          hijack_netrw_behavior = "disabled",
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          filtered_items = { hide_dotfiles = false, hide_gitignored = false },
          window = { mappings = o_open },
        },
        buffers = { window = { mappings = o_open } },
        git_status = { window = { mappings = o_open } },
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<C-\>]], desc = "Toggle terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical terminal" },
      { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select terminal" },
      {
        "<leader>tk",
        function()
          -- Kill the focused terminal, or the last one that was focused
          local terms = require("toggleterm.terminal")
          local id = terms.get_focused_id()
          local term = id and terms.get(id, true) or terms.get_last_focused()
          if term then
            term:shutdown()
          else
            vim.notify("No terminal to kill", vim.log.levels.WARN)
          end
        end,
        desc = "Kill terminal",
      },
      {
        "<leader>gg",
        function()
          -- Lazygit in a large float at the repo root; `q` in lazygit closes it
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true, -- keep it out of <C-\> numbering and TermSelect
            close_on_exit = true,
            float_opts = {
              border = "rounded",
              width = function() return math.floor(vim.o.columns * 0.95) end,
              height = function() return math.floor(vim.o.lines * 0.9) end,
            },
          }):toggle()
        end,
        desc = "Lazygit",
      },
    },
    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      float_opts = { border = "rounded" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
        end
        map("]h", function() gs.nav_hunk("next") end, "Next hunk")
        map("[h", function() gs.nav_hunk("prev") end, "Previous hunk")
        map("<leader>gs", gs.stage_hunk, "Stage hunk")
        map("<leader>gr", gs.reset_hunk, "Reset hunk")
        map("<leader>gp", gs.preview_hunk, "Preview hunk")
        map("<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
      end,
    },
  },
}
