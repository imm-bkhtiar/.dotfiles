local lspconfig = require("lspconfig")

--Enable completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true

local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Setup LSP Servers
local servers = {"html", "lua_ls","cssls", "intelephense", "ts_ls", "emmet_ls", "vls" }


-- on_attach lsp 
-- local on_attach = function(client, bufnr)
--   local opts = { noremap = true, silent = true, buffer = bufnr }
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
-- end

-- Loop lsp server setup 
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end


lspconfig.lua_ls.setup({
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
})

lspconfig.html.setup({
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", 'php.html' },
  capabilities = capabilities,
  settings = {},
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  }
})

lspconfig.ts_ls.setup({
  filetypes = { "html", "javascript", "typescript", "php.html"}
})

lspconfig.intelephense.setup({
  cmd = { "intelephense", "--stdio" },
  root_dir = function ()
    return vim.loop.cwd()
  end,
  filetypes = {'php'}
})

lspconfig.emmet_ls.setup({
  filetypes = { "html" , "php.html"}
})
