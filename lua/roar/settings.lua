local o = vim.opt

o.nu = true
o.rnu = true
o.smartindent = true
o.signcolumn = "yes"

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true
o.background = "dark"

o.scrolloff = 8
o.isfname:append("@-@")

o.updatetime = 50

o.colorcolumn = "80"

vim.g.mapleader = " "

vim.diagnostic.config({ virtual_text = true })

vim.opt.encoding = 'UTF-8'
