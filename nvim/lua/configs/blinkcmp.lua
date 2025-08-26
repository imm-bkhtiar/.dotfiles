require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<CR>'] = { 'accept' , "fallback" },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  snippets = {
    preset = 'luasnip',
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  completion = {
    list = {
      selection = {
        preselect = false,
       -- function()
       --   local filetype = vim.bo.filetype
       --   if filetype == "css" then
       --     return false
       --   end
       --   return true
       -- end,
        auto_insert = false,
      },
    },
    accept = {
      auto_brackets = { enabled = true, },
    },
    menu = {
      border = "rounded",
      winblend = 10,
      draw = {
        treesitter = { "lsp" },
        components = {
          kind_icon = {
            text = function (ctx)
              local icon = ctx.kind_icon
              if ctx.item.source_name == 'LSP' then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, {kind = ctx.kind})
                if color_item and color_item.abbr ~= "" then
                  icon = color_item.abbr
                end
              end
              return icon .. ctx.icon_gap
            end,
            highlight = function (ctx)
              local highlight = "BlinkCmpKind" .. ctx.kind
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, {kind = ctx.kind})
                if color_item and color_item.abbr_hl_group then
                  highlight = color_item.abbr_hl_group
                end
              end
              return highlight
            end
          }
        }
      },
    },

  documentation = {
      auto_show = true,
      window = {
        border = 'rounded',
        winblend = 10,
      }
    }
  },

  signature = {
    enabled = true,
    window = {
      border = "rounded",
      winblend = 10,
    },
  },

  fuzzy = { implementation = "lua" }

})
require("nvim-highlight-colors").setup({})
