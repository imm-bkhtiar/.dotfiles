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
      -- require "configs.lsp"
    end
  },
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require "configs.mason"
    end
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      'brenoprata10/nvim-highlight-colors',
    },
    version = '1.*',
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
    enabled = false,
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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function ()
      require "configs.neotree"
    end
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
      config = function ()
        require "configs.markdown_render"
      end
  },
  {
    'laytan/cloak.nvim',
    config = function ()
      require "configs.cloak"
    end
  },
  {
    "jiaoshijie/undotree",
    config = function ()
      require "configs.undotree"
    end
  },
}
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd ~/.local/share/nvim/lazy/markdown-preview.nvim/ && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  --   config = function()
  --     require "configs.markdown_preview"
  --   end
  -- },
