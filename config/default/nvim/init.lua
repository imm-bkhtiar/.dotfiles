-- Plugin manager, Lazy.nvim
if vim.g.vscode then
    -- VSCode extension
    require('options.keymaps')
else
    -- ordinary Neovim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git", "clone", "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
  end

  vim.opt.rtp:prepend(lazypath)

  -- call user settings
  require("main")
  -- call plugins/list
  local plugins = require("plugins.list")
  require("lazy").setup({plugins})
end
