require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback' },
    ['<Tab>'] = { 'accept' , "fallback" },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },


  sources = {
    default = { 'lsp', 'path', 'snippets' } --  'buffer' },
  },

  snippets = {
    preset = 'luasnip',
    -- preset = "default",
    -- extended_filetypes = {
    --   typescriptreact = {"html", "css"},
    --   javascriptreact = {"html", "css"},
    -- }
  },

  completion = {
    ghost_text = { enabled = false },
    list = {
      selection = {
        preselect = true,
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
      border = "single",
      winblend = 0,
      draw = {
        padding = 2,
        gap = 2,
        treesitter = { "lsp" },
        columns = {
          { "kind_icon" },
          { "label", gap = 2}
        },
        components = {
          kind_icon = {
            text = function(ctx)
              return ctx.kind_icon
            end,
          },

          label = {
            text = function(ctx)
              return ctx.label
            end,
          },

          label_description = {
            text = function(ctx)
              return ctx.label_description
            end,
          },
        },
        -- components = {
        --   kind_icon = {
        --     text = function (ctx)
        --       local icon = ctx.kind_icon
        --       if ctx.item.source_name == 'LSP' then
        --         local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, {kind = ctx.kind})
        --         if color_item and color_item.abbr ~= "" then
        --           icon = color_item.abbr
        --         end
        --       end
        --       return icon .. ctx.icon_gap
        --     end,
        --     highlight = function (ctx)
        --       local highlight = "BlinkCmpKind" .. ctx.kind
        --       if ctx.item.source_name == "LSP" then
        --         local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, {kind = ctx.kind})
        --         if color_item and color_item.abbr_hl_group then
        --           highlight = color_item.abbr_hl_group
        --         end
        --       end
        --       return highlight
        --     end
        --   }
        -- }
      },
    },
    documentation = {
      auto_show = true,
      window = {
        border = 'single',
        winblend = 0,
      }
    },
  },



  signature = {
    enabled = true,
    window = {
      border = "single",
      winblend = 0,
    },
  },

  fuzzy = { implementation = "lua" }

})
require("nvim-highlight-colors").setup({})
