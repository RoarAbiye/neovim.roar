vim.keymap.set('n', ";", ":", {})
vim.keymap.set('n', ":", ";", {})

vim.keymap.set('n', "<leader>h", "<C-w>w<left>", {})
vim.keymap.set('n', "<leader>l", "<C-w>w<right>", {})
vim.keymap.set('n', "<leader>k", "<C-w>w<up>", {})
vim.keymap.set('n', "<leader>j", "<C-w>w<down>", {})

-- past from clip board

vim.keymap.set({'n', 'v'}, "<leader>p", "\"+p", {})
vim.keymap.set({'n', 'v'}, "<leader>P", "\"+P", {})

