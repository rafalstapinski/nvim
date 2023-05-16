vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- basically, keep basic
--- kl to move
-- a, d, r to add delete and rename
-- enter and tab to open and preview
-- x c p to cut copy paste

local to_remove = { "<C-]>", "<C-e>", "<C-r>", "<C-t>", "<C-v>", "<C-x>", "<BS>", ">", "<", ".", "-", "bmv",
  "B", "C", "[c", "]c", "D", "E", "e", "]e", "[e", "F", "f", "g?", "gy", "H", "I", "J", "K", "m", "o", "O", "P", "q",
  "R", "s", "S", "U", "W", "y", "Y", "<2-LeftMouse>", "<2-RightMouse>", "h", "l" }

local mappings = {
  list = {}
}
for _, key_to_remove in ipairs(to_remove) do
  table.insert(mappings.list, { key = key_to_remove, action = "" })
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end



  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings removed via:
  --   remove_keymaps
  --   OR
  --   view.mappings.list..action = ""
  --
  -- The dummy set before del is done for safety, in case a default mapping does not exist.
  --
  -- You might tidy things by removing these along with their default mapping.
  vim.keymap.set('n', '<C-]>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-]>', { buffer = bufnr })
  vim.keymap.set('n', '<C-e>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-e>', { buffer = bufnr })
  vim.keymap.set('n', '<C-r>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-r>', { buffer = bufnr })
  vim.keymap.set('n', '<C-t>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-t>', { buffer = bufnr })
  vim.keymap.set('n', '<C-v>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-v>', { buffer = bufnr })
  vim.keymap.set('n', '<C-x>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-x>', { buffer = bufnr })
  vim.keymap.set('n', '<BS>', '', { buffer = bufnr })
  vim.keymap.del('n', '<BS>', { buffer = bufnr })
  vim.keymap.set('n', '>', '', { buffer = bufnr })
  vim.keymap.del('n', '>', { buffer = bufnr })
  vim.keymap.set('n', '<', '', { buffer = bufnr })
  vim.keymap.del('n', '<', { buffer = bufnr })
  vim.keymap.set('n', '.', '', { buffer = bufnr })
  vim.keymap.del('n', '.', { buffer = bufnr })
  vim.keymap.set('n', '-', '', { buffer = bufnr })
  vim.keymap.del('n', '-', { buffer = bufnr })
  vim.keymap.set('n', 'bmv', '', { buffer = bufnr })
  vim.keymap.del('n', 'bmv', { buffer = bufnr })
  vim.keymap.set('n', 'B', '', { buffer = bufnr })
  vim.keymap.del('n', 'B', { buffer = bufnr })
  vim.keymap.set('n', 'C', '', { buffer = bufnr })
  vim.keymap.del('n', 'C', { buffer = bufnr })
  vim.keymap.set('n', '[c', '', { buffer = bufnr })
  vim.keymap.del('n', '[c', { buffer = bufnr })
  vim.keymap.set('n', ']c', '', { buffer = bufnr })
  vim.keymap.del('n', ']c', { buffer = bufnr })
  vim.keymap.set('n', 'D', '', { buffer = bufnr })
  vim.keymap.del('n', 'D', { buffer = bufnr })
  vim.keymap.set('n', 'E', '', { buffer = bufnr })
  vim.keymap.del('n', 'E', { buffer = bufnr })
  vim.keymap.set('n', 'e', '', { buffer = bufnr })
  vim.keymap.del('n', 'e', { buffer = bufnr })
  vim.keymap.set('n', ']e', '', { buffer = bufnr })
  vim.keymap.del('n', ']e', { buffer = bufnr })
  vim.keymap.set('n', '[e', '', { buffer = bufnr })
  vim.keymap.del('n', '[e', { buffer = bufnr })
  vim.keymap.set('n', 'F', '', { buffer = bufnr })
  vim.keymap.del('n', 'F', { buffer = bufnr })
  vim.keymap.set('n', 'f', '', { buffer = bufnr })
  vim.keymap.del('n', 'f', { buffer = bufnr })
  vim.keymap.set('n', 'g?', '', { buffer = bufnr })
  vim.keymap.del('n', 'g?', { buffer = bufnr })
  vim.keymap.set('n', 'gy', '', { buffer = bufnr })
  vim.keymap.del('n', 'gy', { buffer = bufnr })
  vim.keymap.set('n', 'H', '', { buffer = bufnr })
  vim.keymap.del('n', 'H', { buffer = bufnr })
  vim.keymap.set('n', 'I', '', { buffer = bufnr })
  vim.keymap.del('n', 'I', { buffer = bufnr })
  vim.keymap.set('n', 'J', '', { buffer = bufnr })
  vim.keymap.del('n', 'J', { buffer = bufnr })
  vim.keymap.set('n', 'K', '', { buffer = bufnr })
  vim.keymap.del('n', 'K', { buffer = bufnr })
  vim.keymap.set('n', 'm', '', { buffer = bufnr })
  vim.keymap.del('n', 'm', { buffer = bufnr })
  vim.keymap.set('n', 'o', '', { buffer = bufnr })
  vim.keymap.del('n', 'o', { buffer = bufnr })
  vim.keymap.set('n', 'O', '', { buffer = bufnr })
  vim.keymap.del('n', 'O', { buffer = bufnr })
  vim.keymap.set('n', 'P', '', { buffer = bufnr })
  vim.keymap.del('n', 'P', { buffer = bufnr })
  vim.keymap.set('n', 'q', '', { buffer = bufnr })
  vim.keymap.del('n', 'q', { buffer = bufnr })
  vim.keymap.set('n', 'R', '', { buffer = bufnr })
  vim.keymap.del('n', 'R', { buffer = bufnr })
  vim.keymap.set('n', 's', '', { buffer = bufnr })
  vim.keymap.del('n', 's', { buffer = bufnr })
  vim.keymap.set('n', 'S', '', { buffer = bufnr })
  vim.keymap.del('n', 'S', { buffer = bufnr })
  vim.keymap.set('n', 'U', '', { buffer = bufnr })
  vim.keymap.del('n', 'U', { buffer = bufnr })
  vim.keymap.set('n', 'W', '', { buffer = bufnr })
  vim.keymap.del('n', 'W', { buffer = bufnr })
  vim.keymap.set('n', 'y', '', { buffer = bufnr })
  vim.keymap.del('n', 'y', { buffer = bufnr })
  vim.keymap.set('n', 'Y', '', { buffer = bufnr })
  vim.keymap.del('n', 'Y', { buffer = bufnr })
  vim.keymap.set('n', '<2-LeftMouse>', '', { buffer = bufnr })
  vim.keymap.del('n', '<2-LeftMouse>', { buffer = bufnr })
  vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
  vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
  vim.keymap.set('n', 'h', '', { buffer = bufnr })
  vim.keymap.del('n', 'h', { buffer = bufnr })
  vim.keymap.set('n', 'l', '', { buffer = bufnr })
  vim.keymap.del('n', 'l', { buffer = bufnr })


  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb

end

require("nvim-tree").setup({
  -- filters = {
  --   dotfiles = false,
  --   -- exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  -- },
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
    -- mappings = mappings
  },
  git = {
    enable = true,
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  -- on_attach = on_attach,
})

-- this shit down here doesnt work to remove keymaps so fuck on_Attach for now

-- local function on_attach(bufnr)
--   local api = require('nvim-tree.api')

--   local function opts(desc)
--     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end


--   -- Default mappings. Feel free to modify or remove as you wish.
--   --
--   -- BEGIN_DEFAULT_ON_ATTACH
--   vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
--   vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
--   vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
--   vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
--   vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
--   vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
--   vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
--   vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
--   vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
--   vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
--   vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
--   vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
--   vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
--   vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
--   vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
--   vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
--   vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
--   vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
--   vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
--   vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
--   vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
--   vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
--   vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
--   vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
--   vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
--   vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
--   vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
--   vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
--   vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
--   vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
--   vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
--   vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
--   vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
--   vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
--   vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
--   vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
--   vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
--   vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
--   vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
--   vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
--   vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
--   vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
--   vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
--   vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
--   vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
--   vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
--   vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
--   vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
--   vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
--   vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
--   vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
--   vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
--   -- END_DEFAULT_ON_ATTACH


--   -- Mappings removed via:
--   --   remove_keymaps
--   --   OR
--   --   view.mappings.list..action = ""
--   --
--   -- The dummy set before del is done for safety, in case a default mapping does not exist.
--   --
--   -- You might tidy things by removing these along with their default mapping.
--   vim.keymap.set('n', '<C-t>', '', { buffer = bufnr })
--   vim.keymap.del('n', '<C-t>', { buffer = bufnr })


--   -- Mappings migrated from view.mappings.list
--   --
--   -- You will need to insert "your code goes here" for any mappings with a custom action_cb
-- end
