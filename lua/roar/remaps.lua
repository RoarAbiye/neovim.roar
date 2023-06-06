local remap = vim.keymap.set

remap("n", ";", ":", {})
remap("n", ":", ";", {})

remap("n", "<leader>h", "<C-w>w<left>", {})
remap("n", "<leader>l", "<C-w>w<right>", {})
remap("n", "<leader>k", "<C-w>w<up>", {})
remap("n", "<leader>j", "<C-w>w<down>", {})

-- copy and past form clip board
remap({ "n", "v" }, "<leader>p", '"+p', {})
remap({ "n", "v" }, "<leader>P", '"+P', {})

remap({ "n", "v" }, "<leader>y", '"+y', {})

remap("n", "vv", "<S-v>", {})

remap("n", "yy", "mz<S-v>y<esc>`z", {})

remap("n", "<leader>vc", "<cmd>VCoolor<cr>", {})
