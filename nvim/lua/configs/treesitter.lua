require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "query", "vim", "vimdoc", "html","javascript","css", "c", "markdown", "markdown_inline" }, -- Tambahkan "query" untuk menghindari error

  sync_install = false,
  auto_install = true,

  indent = { enable =  true },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,

    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
}

vim.api.nvim_create_autocmd({'BufEnter', "BufWinEnter"}, {
  pattern = "*",
  callback = function ()
    vim.cmd("set foldlevel=20")
    vim.cmd("set foldmethod=expr")
    vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
  end
})
