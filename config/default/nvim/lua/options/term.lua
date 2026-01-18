local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local function term(opts)
  opts = opts or {}

  local width = opts.widht or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = -1
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  vim.api.nvim_create_buf(false, true)

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return {buf = buf, win = win}
end

local function toggle_term()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = term({buf = state.floating.buf})
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Term", toggle_term, {})

vim.keymap.set({'n', 't'}, '<leader>tl', toggle_term)
