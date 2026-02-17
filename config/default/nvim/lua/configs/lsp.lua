vim.lsp.enable({
  "html",
  "lua_ls",
  "cssls",
  "intelephense",
  "ts_ls",
  "emmet_ls",
  "vls",
  "eslint_lsp"
})

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "single",
    source = true,
  },
  signs = {},
})
