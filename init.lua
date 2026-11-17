if vim.fn.has("nvim-0.11") == 0 then
	vim.api.nvim_echo({ { "This config requires Neovim >= 0.11", "ErrorMsg" } }, true, {})
	return
end

-- Fallback: make sure mise shims are on PATH (when nvim is started outside an interactive shell)
local mise_shims = (vim.env.MISE_DATA_DIR or vim.fn.expand("~/.local/share/mise")) .. "/shims"
if vim.fn.isdirectory(mise_shims) == 1 and not vim.env.PATH:find(mise_shims, 1, true) then
	vim.env.PATH = vim.env.PATH .. ":" .. mise_shims
end

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
