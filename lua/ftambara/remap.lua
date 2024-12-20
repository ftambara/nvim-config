vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Less disorienting movements
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Don't lose your register
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])

-- Git
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>')
vim.keymap.set('n', 'go', '<cmd>diffget //3<CR>')
vim.keymap.set('n', 'ga', '<cmd>diffget //2<CR>')
