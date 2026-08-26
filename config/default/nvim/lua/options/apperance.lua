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
  vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none'})
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none'})
  vim.api.nvim_set_hl(0, "MasonBorder", { fg = "#C6CCE5", bg = 'none'})
  vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#C6CCE5", bg = 'none'})
  -- vim.api.nvim_set_hl(0, "", { bg = 'none'})
  --
  vim.api.nvim_set_hl(0, "cursorline", { bg = 'none'})
  vim.api.nvim_set_hl(0, "WinSeparator", {fg = '#373B41', bg = 'none'})
  vim.api.nvim_set_hl(0, "Folded", { fg = "#ffffff",bg = 'none'})
  vim.api.nvim_set_hl(0, "SignColumn", { fg = "#333333",bg = 'none'})
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#333333",bg = 'none'})
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C6CCE5",bg = 'none'})
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#373B41",bg = 'none'})
  vim.api.nvim_set_hl(0, "MatchParen", { fg = "#C6CCE5", bg = "#373B41", bold = true})

  vim.api.nvim_set_hl(0, "Statusline", { bg = 'none',})
  vim.api.nvim_set_hl(0, "StatuslineNC", { bg = 'none'})

  vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#282e39", bold = true })
  vim.api.nvim_set_hl(0, "Title", { fg = "#C6CCE5", bold = true })

  -- blink cmp apperance
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#C6CCE5", bg = "none"})
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#C6CCE5", bg = "none" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#C6CCE5", bg = "none"})
  vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#C6CCE5", bg = "none"})
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#aaaaaa", bg = "none" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#C6CCE5", bg = "none" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {bg = "none"})

  -- blink cmp apperance
  vim.api.nvim_set_hl(0, "NeoTreeNormal", {fg = "#C6CCE5", bg = "none"})
  vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", {fg = "#373B41", bg = "none"})
  vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", {fg = "#de5959", bg = "none"})
  vim.api.nvim_set_hl(0, "NeoTreeGitModified", {fg = "#72a787", bg = "none"})
end


setColor("challenger_deep")

