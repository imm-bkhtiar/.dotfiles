vim.api.nvim_create_user_command("Md", function(opts)
    local file = opts.args ~= "" and opts.args or "README.md"
    -- Buka file hanya jika bukan Markdown
    if vim.bo.filetype ~= "markdown" then
        vim.cmd("edit " .. file)
    end

    -- Jalankan preview
    vim.cmd("MarkdownPreview")
end, { nargs = "?" })

