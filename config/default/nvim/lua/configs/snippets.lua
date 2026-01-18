return {
  require("luasnip").filetype_extend("javascriptreact", { "html" }),
  require("luasnip.loaders.from_vscode").lazy_load(),
  require("luasnip.loaders.from_vscode").lazy_load({
    paths = { "~/.config/nvim/lua/options/snippets/" },
    include = { "html", "javascript", "css" },
  })
}
