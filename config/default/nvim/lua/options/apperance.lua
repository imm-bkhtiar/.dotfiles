vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.fillchars:append({eob = " "})


local function setColor(color)
  color = color or "retrobox"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = 'none'})
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none'})
  -- vim.api.nvim_set_hl(0, "", { bg = 'none'})
  vim.api.nvim_set_hl(0, "cursorline", { bg = 'none'})
  vim.api.nvim_set_hl(0, "Statusline", { bg = 'none', bold = true})
  vim.api.nvim_set_hl(0, "WinSeparator", {fg = '#5E9B2E', bg = 'none'})
  vim.api.nvim_set_hl(0, "Folded", { fg = "#ffffff",bg = 'none'})
  vim.api.nvim_set_hl(0, "SignColumn", { fg = "#333333",bg = 'none'})
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#333333",bg = 'none'})
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#dddddd",bg = 'none'})
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888",bg = 'none'})

  -- blink cmp apperance
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#aaaaaa", bg = "none"})
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#5E9B2E"})
  -- vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#5E9B2E"})
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#aaaaaa"})
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#466a29"})
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {fg = "#5E9B2E"})
end

setColor("gruvbox")
