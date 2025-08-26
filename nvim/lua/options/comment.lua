local function comment()
  local line_num = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.fn.getline(line_num)
  local indent, content = line:match("^(%s*)(.*)")
  local filetype = vim.bo.filetype

  if filetype == 'lua' then
    if content:match("^%s*%-%-") then
      content = content:gsub("^%s*%-%-%s?", "", 1)
    else
      content = '-- ' .. content
    end
  elseif filetype == 'css' then
    if content:match("^%s*/%*.*%*/%s*$") then
      content = content:gsub("^%s*/%*(.-)%*/%s*$", "%1"):match("^%s*(.-)%s*$")
    else
      content = '/* ' .. content .. ' */'
    end
  elseif filetype == 'html' then
    if content:match("^<!%-%-.*%-%->$") then
      content = content:gsub("^<!%-%-%s*(.-)%s*%-%->$", "%1"):match("^%s*(.-)%s*$")
    else
      content = '<!-- ' .. content .. ' -->'
    end
  elseif filetype == 'javascript' then
    if content:match("^%s*%/%/") then
      content = content:gsub("^%s*%/%/%s?", "", 1)
    else
      content = '// ' .. content
    end
  end
  vim.fn.setline(line_num, indent .. content)
end

function MultiComment()
  local start_line, end_line = vim.fn.line("'<'"), vim.fn.line("'>'")
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local filetype = vim.bo.filetype


  if filetype == 'html' then
    if lines[1]:match("^%s*<!%-%-") and lines[#lines]:match("%-%->$") then
      lines[1] = lines[1]:gsub("^(%s*)<!%-%- ?", "%1")
      lines[#lines] = lines[#lines]:gsub(" ?%s*%-%->(%s*)$", "%1")
    else
      lines[1] = lines[1]:gsub("^(%s*)", "%1<!-- ")
      lines[#lines] = lines[#lines] ..  " -->"
    end
  elseif filetype == 'css' then
    if lines[1]:match("^%s*/%*") and lines[#lines]:match("%*/%s*$") then
      lines[1] = lines[1]:gsub("^(%s*)/%* ?", "%1")
      lines[#lines] = lines[#lines]:gsub(" ?%*/(%s*)$", "%1")
    else
      lines[1] = lines[1]:gsub("^(%s*)", "%1/* ")
      lines[#lines] = lines[#lines] ..  " */"
    end
  elseif filetype == 'javascript' then
    if lines[1]:match("^%s*/%*") and lines[#lines]:match("%*/%s*$") then
      lines[1] = lines[1]:gsub("^(%s*)/%* ?", "%1")
      lines[#lines] = lines[#lines]:gsub(" ?%*/(%s*)$", "%1")
    else
      lines[1] = lines[1]:gsub("^(%s*)", "%1/* ")
      lines[#lines] = lines[#lines] ..  " */"
    end
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

vim.keymap.set('n', '<leader>/', comment)
vim.keymap.set('v', '<leader>/', ":lua MultiComment()<CR>")
