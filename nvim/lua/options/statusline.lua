-- Definisi warna
vim.api.nvim_set_hl(0, "StatusModeN", {fg='#252525', bg='#d6ad5c', bold = true}) -- NORMAL
vim.api.nvim_set_hl(0, "StatusModeI", {fg='#7D799E' , bold = true}) -- INSERT
vim.api.nvim_set_hl(0, "StatusGit", { fg="#7E5871", bold = true})     -- Git branch
vim.api.nvim_set_hl(0, "StatusNC", {bg="NONE", fg="NONE"})  -- Jam

-- Fungsi untuk mendapatkan mode dengan warna
function Mode()
  local modes = {
    n = "NORMAL", -- Warna hijau
    i = "INSERT", -- Warna biru
    v = "VISUAL", -- Warna ungu
    V = "V-LINE",
    [""] = "V-BLOCK",
    c = "COMMAND", -- Sama seperti INSERT
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
  "%#StatusModeI#",
  " %f %M ",
  "%#StatusGit#",
  "%{v:lua.GitBranch()} ", -- Git branch dengan warna
  "%#StatusNC#",
  "%=",                 -- pemisah kiri & tengah
  "%=",                 -- pemisah kiri & tengah
  "%#StatusGit#",
  " %Y ", -- Filetype dengan warna
  "%#StatusModeI#",
  " %l/%L | %c ", -- Line number dengan warna
  "%#StatusModeN#",
  "  %{v:lua.CurrentTime()}  ", -- Jam dengan warna
})
vim.opt.laststatus = 3
