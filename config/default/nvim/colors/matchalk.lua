if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "matchalk"

local C = {
  bg = "#273136",
  bg_dark = "#1c2427",
  bg_light = "#323e45",

  fg = "#D1DED3",
  comment = "#7ea4b0",

  green = "#7eb08a",
  pink = "#ff819f",
  tan = "#d2b48c",
  purple = "#ba8eaf",
  blue = "#7ea4b0",

  border = "#304e37",
  none = "none"
}

local groups = {

-- UI
Normal = { fg = C.fg, bg = C.none },
NormalFloat = { bg = C.none },

CursorLine = { bg = C.none },
CursorLineNr = { fg = C.fg },
LineNr = { fg = "#D1DED3" },

Visual = { bg = "#d2b48c" },

VertSplit = { fg = C.border },
WinSeparator = { fg = C.border },

StatusLine = { fg = C.fg, bg = C.bg },
StatusLineNC = { fg = "#8fa19a", bg = C.bg_dark },


FloatBorder = { fg = C.green },

-- syntax
Comment = { fg = C.comment, italic = true },

String = { fg = C.purple },
Character = { fg = C.purple },

Keyword = { fg = C.tan, bold = true },
Statement = { fg = C.tan, bold = true },

Function = { fg = C.green },
Identifier = { fg = C.fg },

Type = { fg = C.blue },
StorageClass = { fg = C.tan },

Constant = { fg = C.tan },
Number = { fg = C.blue },
Boolean = { fg = C.blue },

Operator = { fg = C.green },
Delimiter = { fg = C.blue },

-- diagnostics
DiagnosticError = { fg = C.pink },
DiagnosticWarn = { fg = C.purple },
DiagnosticInfo = { fg = C.tan },
DiagnosticHint = { fg = C.blue },

DiagnosticUnderlineError = { undercurl = true, sp = C.pink },
DiagnosticUnderlineWarn = { undercurl = true, sp = C.purple },
DiagnosticUnderlineInfo = { undercurl = true, sp = C.tan },
DiagnosticUnderlineHint = { undercurl = true, sp = C.blue },

-- diff
DiffAdd = { bg = "#7eb08a" },
DiffDelete = { bg = "#ff819f" },
DiffChange = { bg = "#ba8eaf" },

-- telescope
TelescopeBorder = { fg = C.green },
TelescopeSelection = { fg = "#d2b48c" , bg = C.none },

-- cmp
Pmenu = { bg = C.none },
PmenuSel = { fg = C.none },
BlinkCmpMenuBorder = { fg = C.blue },
BlinkCmpMenu = { bg = C.none },
BlinkCmpMenuSelection = {fg = C.blue,  bg = C.none },

-- gitsigns
GitSignsAdd = { fg = C.green },
GitSignsDelete = { fg = C.pink },
GitSignsChange = { fg = C.purple },

-- indent blankline
IndentBlanklineChar = { fg = "#323e45" },
IndentBlanklineContextChar = { fg = C.tan },

}

-- treesitter
local treesitter = {

["@comment"] = { fg = C.comment, italic = true },
["@string"] = { fg = C.purple },
["@character"] = { fg = C.purple },

["@keyword"] = { fg = C.tan, bold = true },
["@keyword.function"] = { fg = C.tan },

["@function"] = { fg = C.green },
["@method"] = { fg = C.green },

["@type"] = { fg = C.blue },

["@variable"] = { fg = C.fg },
["@parameter"] = { fg = C.pink },

["@constant"] = { fg = C.tan },
["@number"] = { fg = C.blue },

["@operator"] = { fg = C.green },

["@punctuation.delimiter"] = { fg = C.blue },
["@punctuation.bracket"] = { fg = C.blue },

}

local function apply(tbl)
  for group,opts in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

apply(groups)
apply(treesitter)
