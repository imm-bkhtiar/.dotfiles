vim.g.mapleader = ' '
-- vim.env.PATH = vim.env.PATH .. ";C:\\Program Files\\nodejs\\"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number= true
vim.wo.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/immbkhtiar/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.o.cmdwinheight = 1
vim.o.showmode = false
-- vim.opt.timeoutlen = 200

vim.opt.modifiable = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.title = false
vim.opt.autoindent = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.breakindent = true
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.shell = 'bash'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append {'**'} -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.formatoptions:append({"r"})
vim.opt.splitkeep = 'cursor'
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

-- netrw settings
vim.g.netrw_banner = 0 -- set information banner in above :Ex to false
vim.g.netrw_fastmap = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

-- undercurl 
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = 'set nopaste'
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- mengatasi masalah bentrok antara keymap C-l
vim.cmd([[
  augroup FixNetrwKeybind
    autocmd!
    autocmd FileType netrw silent! nunmap <buffer> <C-l>
    autocmd FileType netrw nnoremap <buffer> <C-l> :wincmd l<CR>
  augroup END
]])

-- vim.cmd("set shell=cmd.exe")
vim.cmd([[let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';$PSStyle.OutputRendering=''plaintext'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
		set shellquote= shellxquote=
]])
