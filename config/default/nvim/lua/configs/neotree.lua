require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left open
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  hide_root_node = true,
  retain_hidden_root_indent = true,

  -- VS Code-like automatic syncing with the current buffer
  filesystem = {
    follow_current_file = {
      enabled = true,          -- Focuses the current file in the tree
      leave_dirs_open = false, -- Closes other directories when changing files
    },
    use_libuv_file_watcher = true, -- Automatically refreshes when files change externally
    filtered_items = {
      visible = false,            -- Hide dotfiles by default like VS Code
      hide_dotfiles = true,
      hide_gitignored = true,
    },
  },

  -- Familiar VS Code window layout
  window = {
    position = "left",
    width = 30,
    mappings = {
      ["<space>"] = "none",        -- Disable space trigger to avoid conflicts
      ["<cr>"] = "open",           -- Enter opens file
      ["o"] = "open",              -- 'o' opens file
      ["v"] = "open_vsplit",       -- Vertical split opening
      ["s"] = "open_split",        -- Horizontal split opening
      ["a"] = "add",               -- Create new file/folder
      ["d"] = "delete",            -- Delete file
      ["r"] = "rename",            -- Rename file
      ["c"] = "copy",              -- Copy file
      ["m"] = "move",              -- Move/Cut file
      ["R"] = "refresh",           -- Refresh tree
    }
  }
})

-- vim.keymap.set('n', '<leader>h', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
