return {
  require("luasnip").filetype_extend("html", { "html" }),
  require("luasnip").filetype_extend("text", { "plaintext" }),
  require("luasnip.loaders.from_vscode").load({
    paths = { "~/.config/nvim/lua/options/snippets/" },
    include = { "html", "javascript", "css", "plaintext" },
  }),

  require("luasnip.loaders.from_vscode").lazy_load()
}
