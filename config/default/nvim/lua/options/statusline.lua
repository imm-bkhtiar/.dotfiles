-- Definisi warna
vim.api.nvim_set_hl(0, "StatusModeN", {fg='#282A2E', bg='#C6CCE5', bold = true})
vim.api.nvim_set_hl(0, "StatusPath", {fg = "none", bg='#3d4757' })
vim.api.nvim_set_hl(0, "StatusGit", { bg="#373B41"})
vim.api.nvim_set_hl(0, "StatusNC", {bg="NONE", fg="NONE"})

vim.api.nvim_set_hl(0, "StatusPosition", {fg='#282A2E', bg='#C6CCE5', bold = true})
vim.api.nvim_set_hl(0, "StatusFileType", { bg="#373B41"})

vim.api.nvim_set_hl(0, "SeparatorStatus", {bg="#3d4757", fg="#C6CCE5"})
vim.api.nvim_set_hl(0, "SeparatorPath", {bg="#373B41", fg="#3d4757"})
vim.api.nvim_set_hl(0, "SeparatorGit", {bg="NONE", fg="#373B41"})

vim.api.nvim_set_hl(0, "SeparatorPosition", {bg="#3d4757", fg="#C6CCE5"})
vim.api.nvim_set_hl(0, "SeparatorFileTYpe", {bg="NONE", fg="#373B41"})

function Mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    [""] = "V-BLOCK",
    c = "COMMAND",
    R = "REPLACE",
  }
  return modes[vim.api.nvim_get_mode().mode] or "UNKNOWN"
end

-- Fungsi Git Branch
function GitBranch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    if handle then
        local branch = handle:read("*l")
        handle:close()
        return branch and (" " .. branch) or "!GIT"
    end
    return ""
end

-- Fungsi untuk menampilkan jam
function CurrentTime()
    return os.date("󰥔 %H:%M")
end

vim.opt.statusline = table.concat({
  "%#StatusModeN#",
  "  %{v:lua.Mode()} ",    -- Mode dengan warna
  "%#SeparatorStatus#",
  "",
  "%#StatusPath#",
  " %{fnamemodify(expand('%:p'), ':h:t')}/%t %M ",
  "%#SeparatorPath#",
  "",
  "%#StatusGit#",
  " %{v:lua.GitBranch()} ", -- Git branch dengan warna
  "%#SeparatorGit#",
  "",
  "%#StatusNC#",
  "%=",                 -- pemisah kiri & tengah
  "%=",                 -- pemisah kiri & tengah
  "%#SeparatorFileType#",
  "",
  "%#StatusFileType#",
  " %Y ", -- Filetype dengan warna
  "%#SeparatorPosition#",
  "",
  "%#StatusPosition#",
  " %l/%L | %c ", -- Line number dengan warna
  -- "%#StatusModeN#",
  -- "  %{v:lua.CurrentTime()}  ", -- Jam dengan warna
})
vim.opt.laststatus = 3
