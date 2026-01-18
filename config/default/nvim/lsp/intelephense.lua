return {
  cmd = { "intelephense", "--stdio" },
  root_dir = function ()
    return vim.loop.cwd()
  end,
  filetypes = {'php'}
}
