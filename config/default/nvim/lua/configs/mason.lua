require("mason").setup({})

require("mason-lspconfig").setup({
  ensure_installed = {
    "html",
    "lua_ls",
    "cssls",
    "ts_ls",
    "intelephense",
    "emmet_ls",
    "tailwindcss"
  },

  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
})
