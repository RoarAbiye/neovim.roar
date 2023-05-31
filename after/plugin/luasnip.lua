require("luasnip.loaders.from_vscode").load {}
local luasnip = require("luasnip")

vim.keymap.set("i", "<C-j", function ()-- code
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      return
      --fallback()
    end
end,{}
)

vim.keymap.set("i", "<C-k", function ()-- code
   if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      return
    --  fallback()
    end
end,{}
)
--  ["<S-Tab>"] = cmp.mapping(function(fallback)
--    if cmp.visible() then
--      cmp.select_prev_item()
--  end, { "i", "s" }),
--
function name()
  -- code
end
