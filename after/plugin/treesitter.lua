require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "lua", "html", "css", "typescript", "javascript" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- require('nvim-ts-autotag').setup()
