local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Close window" })

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move selected lines
map("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- Diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

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
