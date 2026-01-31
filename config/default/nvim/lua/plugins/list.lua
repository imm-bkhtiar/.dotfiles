return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lsp"
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      'brenoprata10/nvim-highlight-colors',
    },
    config = function ()
      require "configs.blinkcmp"
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.3",
    build = "make install_jsregexp",
    config = function()
      require "configs.snippets"
    end,
  },
  {
    "ziontee113/color-picker.nvim",
    lazy = false,
    config = function()
      require "configs.color_picker"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd ~/.local/share/nvim/lazy/markdown-preview.nvim/ && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      require "configs.markdown_preview"
    end
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
      require "configs.hlchunk"
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      require "configs.telescope"
    end
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    branch = "harpoon2",
    config = function ()
      require "configs.harpoon"
    end
    },
    {
      'numToStr/Comment.nvim',
      config = function ()
      require "configs.comment"
      end
    },
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts,
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      lazy = false,
      config = function ()
        require "configs.oilnvim"
      end
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
      config = function ()
        require "configs.markdown_render"
      end
  }
}
