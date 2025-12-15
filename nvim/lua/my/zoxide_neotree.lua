local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')

-- Helper to get zoxide entries via shell
local function get_zoxide_dirs()
    local output = vim.fn.systemlist("zoxide query -l")
    if vim.v.shell_error ~= 0 then
        print("Failed to get zoxide data")
        return {}
    end
    return output
end

-- Main picker function
local function open_zoxide_with_neotree()
    local zoxide_list = get_zoxide_dirs()

    if not zoxide_list or vim.tbl_isempty(zoxide_list) then
        print("No zoxide entries found.")
        return
    end

    pickers.new({}, {
        prompt_title = "Zoxide → NeoTree",
        finder = finders.new_table({
            results = zoxide_list,
        }),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                if selection then
                    local path = selection[1]
                    -- Reveal in NeoTree (filesystem)
                    vim.cmd("Neotree reveal dir=" .. vim.fn.fnameescape(path))
                end
            end)
            map("n", "<CR>", function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                if selection then
                    local path = selection[1]
                    vim.cmd("Neotree reveal dir=" .. vim.fn.fnameescape(path))
                end
            end)
            return true
        end
    }):find()
end

-- Optional: expose function globally or return
return {
    open_zoxide_with_neotree = open_zoxide_with_neotree
}
