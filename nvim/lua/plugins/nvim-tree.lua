return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    },
    config = function()
        local api = require("nvim-tree.api")


        local function on_attach(bufnr)

            -- Load default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Custom: Go to parent directory
            vim.keymap.set("n", "u", api.tree.change_root_to_parent, { buffer = bufnr, desc = "Up to Parent Directory" })

            -- Custom: Toggle mark
            vim.keymap.set("n", "m", api.marks.toggle, { buffer = bufnr, desc = "Toggle Mark" })

            -- vim.keymap.set("n", "M", api.marks.bulk_move, { buffer = bufnr, desc = "Move Marked Files"})
            -- vim.keymap.set("n", "B", api.marks.list, { buffer = bufnr, desc = "List Marks"})
            -- vim.keymap.set("n", "<CR>", api.node.open.edit, { buffer = bufnr, desc = "Open File/Dir"})

            -- Custom: List marks
            vim.keymap.set("n", "<leader>fm", api.marks.list, { buffer = bufnr, desc = "List Marked Files" })
        end

        require("nvim-tree").setup({
            hijack_cursor = true,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            view = {
                width = 35,
                side = "left",
            },
            renderer = {
                highlight_git = true,
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
            on_attach = on_attach,
        })
    end,
}
