vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {silent = true } )

local opts = {  noremap = true, silent = true }

local keymap = vim.keymap

-- Do not yank with x 
keymap.set({'n', 'v'}, 'x', '"_x', opts)

-- Increment & Decrement
keymap.set('n', '+', '<C-a>', opts)
keymap.set('n', '-', '<C-x>', opts)

-- Delete keyword backwards
keymap.set('n', 'dw', 'vbd', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- Vertical scroll and center
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Resize with arrows
keymap.set('n', '<Up>', ':resize -1<CR>', opts)
keymap.set('n', '<Down>', ':resize +3<CR>', opts)
keymap.set('n', '<Left>', ':vertical resize -1<CR>', opts)
keymap.set('n', '<Right>', ':vertical resize +3<CR>', opts)

-- Buffers
keymap.set('n', '<S-l>', ':bnext<CR>', opts)
keymap.set('n', '<S-h>', ':bprevious<CR>', opts)
keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
keymap.set('n', '<leader>k', ':close<CR>', opts) -- close current split window

-- Navigate between splits
keymap.set('n', '<C-k>', ':wincmd k<CR>', opts )
keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab t
keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- esc remap
-- keymap.set("i", "jk", "<Esc>", opts)
keymap.set("n", "<Esc>", "<Esc>:let @/ = \"\"<CR>", opts)
keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", opts)

-- Toggle line wrapping
keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
keymap.set('v', 'p', '"_dP', opts)

-- move line in visual mode
keymap.set("v", '<M-j>', ":m '>+1<CR>gv=gv")
keymap.set("v", '<M-k>', ":m '<-2<CR>gv=gv")

-- keymap.set('n', '<leader>e', "<cmd>Ex<Cr>", opts)
keymap.set('n', '<leader>e', "<cmd>Oil<Cr>", opts)

-- marks
keymap.set('n', '<leader>am', ':marks<cr>' )

-- toggle beetwen filetype php and php.html
keymap.set('n', '<leader>sf', function ()
  if vim.bo.filetype == 'php' then
    vim.bo.filetype ='php.html'
  elseif vim.bo.filetype == 'php.html 'then
    vim.bo.filetype ='php'
  else
    print("bukan file php")
  end
end)

-- auto write file if leave insert mode
-- vim.o.autowriteall = true
-- vim.api.nvim_create_autocmd('InsertLeavePre', {
--     pattern = '*', 
--     callback = function()
--         vim.cmd('silent! write')
--     end
-- })
