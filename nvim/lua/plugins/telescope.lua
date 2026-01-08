-- lua/plugins/telescope.lua
local actions = require("telescope.actions")
local telescope = require("telescope")
local builtin = require("telescope.builtin")  -- make sure this is required

telescope.setup({
    defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", ".git/", "dist" },
        mappings = {
            i = { -- insert mode mappings
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<Esc>"] = actions.close,
            },
            n = { -- normal mode mappings
                ["q"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            hidden = true,
        },
        live_grep = {
            only_sort_text = true,
        },
    },
    extensions = {
        -- you can configure extensions here if installed
    },
})

-- optional: set up keymaps
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Search recent files" })
map("n", "<leader>gf", function()
    require("telescope.builtin").live_grep({
        additional_args = { "--type", "fortran" },
    })
end)
map("n", "<leader>fs", function()
    require("telescope.builtin").grep_string()
end, { desc = "Grep word under cursor" })
