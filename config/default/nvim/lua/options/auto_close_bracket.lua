local opts = { noremap = true, expr = true }

vim.keymap.set("i", "(", function()
    return vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col(".")) == ")" and "(" or "()<Left>"
end, opts)

vim.keymap.set("i", "{", function()
    return vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col(".")) == "}" and "{" or "{}<Left>"
end, opts)

vim.keymap.set("i", "[", function()
    return vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col(".")) == "]" and "[" or "[]<Left>"
end, opts)

vim.keymap.set("i", '"', function()
    return vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col(".")) == '"' and "<Right>" or '""<Left>'
end, opts)

vim.keymap.set("i", "'", function()
    return vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col(".")) == "'" and "<Right>" or "''<Left>"
end, opts)

vim.keymap.set("i", "`", function()
    return vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col(".")) == "'" and "<Right>" or "``<Left>"
end, opts)
