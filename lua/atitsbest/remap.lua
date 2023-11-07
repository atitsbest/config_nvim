vim.keymap.set('n', '<leader>pv', ":Ex<CR>", {})

vim.keymap.set("v", "<S-down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Keeps search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")



