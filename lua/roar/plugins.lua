-- 😴 LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 🔌 PLUGINS LIST
local plugins = {

	"shaunsingh/nord.nvim",
	"j-hui/fidget.nvim",
	"ryanoasis/vim-devicons",
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"theHamsta/nvim-dap-virtual-text",
  {'folke/neodev.nvim'},
 {'rcarriga/nvim-dap-ui', dependencies= 'mfussenegger/nvim-dap'},
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
  { "mxsdev/nvim-dap-vscode-js", dependencies = {"mfussenegger/nvim-dap"}},
	"nvim-lualine/lualine.nvim",

	"KabbAmine/vCoolor.vim",
	"norcalli/nvim-colorizer.lua",
	-- 🔍telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- ⚙ LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"mfussenegger/nvim-dap",
	"jose-elias-alvarez/null-ls.nvim",
	"prettier/vim-prettier",

	{ "williamboman/mason.nvim", build = ":MasonUpdate" },

	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"windwp/nvim-ts-autotag",

	-- COMPLETION PLUGINS
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim",
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",
	"windwp/nvim-autopairs",
	"tpope/vim-surround",
	"numToStr/Comment.nvim",
	"tpope/vim-fugitive",
}

local opts = {}

require("lazy").setup(plugins, opts)
