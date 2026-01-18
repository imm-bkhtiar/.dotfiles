return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", 'php.html' },
  -- capabilities = capabilities,
  settings = {},
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  }
}
