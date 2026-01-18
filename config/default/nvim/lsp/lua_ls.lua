return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Supaya 'vim' tidak dianggap undefined
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}
