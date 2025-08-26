-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
local nvimtree = require("nvim-tree")
-- local bufferline = require("bufferline")

-- OR setup with some options
nvimtree.setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle Right20<cr>")

-- bufferline.setup{
--  options = {
--     numbers = "ordinal",
--     diagnostics = "nvim_lsp",
--     separator_style = "slope",
--     show_buffer_close_icons = true,
--     show_close_icon = true,
--     color_icons = true,
--   }
-- }
