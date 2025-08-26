require('telescope').setup({
  defaults = {
    mappings = {
      i = {
      }
    }
  },
  pickers = {
  },
  extensions = {
  },
})

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').fd)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>nv', function ()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath("config")
  }
end)
