local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<leader>ca", vim.lsp.buf.code_action)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Less disorienting movements
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Don't lose your register
map("x", "<leader>p", [["_dP]])

map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({"n", "v"}, "<leader>d", [["_d]])

-- Git
map("n", "<leader>gs", "<cmd>Git<CR>")
map("n", "go", "<cmd>diffget //3<CR>")
map("n", "ga", "<cmd>diffget //2<CR>")
