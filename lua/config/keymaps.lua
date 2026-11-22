local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows (Alt + direction); splits use the default <C-w>s / <C-w>v
map("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Narrower window" })
map("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Wider window" })
map("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Taller window" })
map("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Shorter window" })

-- Move selected lines
map("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- Diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Restart LSP for this buffer, then reload it so servers that were not attached
-- yet (e.g. Tailwind right after installing it) get a chance to attach
map("n", "<leader>cr", function()
	local buf = vim.api.nvim_get_current_buf()
	if #vim.lsp.get_clients({ bufnr = buf }) > 0 then
		vim.cmd("lsp restart")
	end
	if vim.bo[buf].modified then
		vim.notify("LSP restarted (buffer has unsaved changes, not reloaded)", vim.log.levels.INFO)
	else
		vim.cmd("edit")
		vim.notify("LSP restarted", vim.log.levels.INFO)
	end
end, { desc = "Restart LSP" })

-- Cheatsheet: open CHEATSHEET.md in a read-only float, q to close
map("n", "<leader>?", function()
	local path = vim.fn.stdpath("config") .. "/CHEATSHEET.md"
	local buf = vim.fn.bufadd(path)
	vim.fn.bufload(buf)
	vim.bo[buf].modifiable = false
	vim.bo[buf].readonly = true
	vim.bo[buf].bufhidden = "hide"

	local width = math.min(100, math.floor(vim.o.columns * 0.85))
	local height = math.floor(vim.o.lines * 0.85)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2) - 1,
		col = math.floor((vim.o.columns - width) / 2),
		border = "rounded",
		title = " Cheatsheet ",
		title_pos = "center",
	})
	vim.wo[win].wrap = false
	vim.wo[win].conceallevel = 2
	vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, nowait = true })
	vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, nowait = true })
end, { desc = "Keymap cheatsheet" })
