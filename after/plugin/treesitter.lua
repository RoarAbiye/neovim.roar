require("nvim-dap-virtual-text").setup()
require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "lua", "html", "css", "typescript", "javascript" },
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
  incremental_selection = {
      enable = true,
      keymaps = {
		init_selection = "<leader>mn",
		node_incremental = "<leader>nn",
		scope_incremental = "<leader>sn",
		node_decremental = "<leader>ln",
	},
}
})

-- require('nvim-ts-autotag').setup()
