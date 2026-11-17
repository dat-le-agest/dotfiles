local o = vim.opt

o.number = true
o.relativenumber = true
o.mouse = "a"
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 8
o.termguicolors = true
o.showmode = false

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.wrap = false

o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

o.splitright = true
o.splitbelow = true

o.undofile = true
o.swapfile = false
o.updatetime = 250
o.timeoutlen = 300

-- Set clipboard after startup so it does not slow down launch
vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = { border = "rounded" },
})
