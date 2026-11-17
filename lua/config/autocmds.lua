vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank()
  end,
})

-- 4-space indent for languages that conventionally use 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "rust", "c", "cpp" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})

-- Go uses real tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod" },
  callback = function()
    vim.bo.expandtab = false
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})
