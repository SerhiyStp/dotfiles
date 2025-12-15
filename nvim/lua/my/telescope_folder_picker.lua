local folders = require("my.folder_bookmarks")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

return function()
  pickers.new({}, {
    prompt_title = "📁 Folder Bookmarks",
    finder = finders.new_table {
      results = folders,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.name,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection and selection.value and selection.value.path then
			--vim.cmd("cd " .. vim.fn.fnameescape(selection.value.path))
			-- Change directory and open in nvim-tree
			vim.cmd("cd " .. vim.fn.fnameescape(selection.value.path))
			require("nvim-tree.api").tree.open()
			require("nvim-tree.api").tree.change_root(selection.value.path)
			--require("telescope.builtin").find_files({ cwd = selection.value.path })			
			print("Changed directory to: " .. selection.value.path)
        else
          print("Invalid selection.")
        end
      end)
      return true
    end,
  }):find()
end