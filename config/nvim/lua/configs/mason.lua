require("mason").setup({
  ensure_installed = {"html", "lua_ls", "cssls", "ts_ls", "intelephense", "emmetls"},
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
