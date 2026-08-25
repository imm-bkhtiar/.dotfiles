return {
  require("luasnip").filetype_extend("javascriptreact", { "html" }),
  require("luasnip").filetype_extend("typescriptreact", { "html" }),
  require("luasnip").filetype_extend("html", { "html" }),
  require("luasnip.loaders.from_vscode").load({
    paths = { "~/.config/nvim/lua/options/snippets/" },
    include = { "html", "javascript", "css" },
  }),

  require("luasnip.loaders.from_vscode").lazy_load()
}
