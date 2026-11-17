local parsers = {
  "lua", "vim", "vimdoc", "query", "bash",
  "python",
  "javascript", "typescript", "tsx", "html", "css",
  "go", "gomod", "gosum",
  "c", "cpp", "rust", "toml",
  "json", "yaml", "markdown", "markdown_inline",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
