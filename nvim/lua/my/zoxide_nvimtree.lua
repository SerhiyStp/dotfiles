local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local M = {}

M.zoxide_nvim_tree = function()
    local handle = io.popen("zoxide query -ls")
    if not handle then return end

    local result = handle:read("*a")
    handle:close()

    local entries = {}
    for line in result:gmatch("[^\r\n]+") do
        -- Only capture the path part
        local path = line:match("(%S+)$")
        if path then
            table.insert(entries, path)
        end
    end

    pickers.new({}, {
        prompt_title = "Zoxide + NvimTree",
        finder = finders.new_table({
            results = entries
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local dir = selection[1]
                vim.cmd("cd " .. dir)
                require("nvim-tree.api").tree.open({ path = dir })
            end)
            return true
        end,
    }):find()
end

return M
