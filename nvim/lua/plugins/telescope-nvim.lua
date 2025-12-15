-- Fuzzy finder
return {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    lazy = true,
    branch = '0.1.x',
    dependencies = {
        -- https://github.com/nvim-lua/plenary.nvim
        { 'nvim-lua/plenary.nvim' },
        {
            -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    opts = {
        defaults = {
            layout_config = {
                vertical = {
                    width = 0.75
                }
            }
        }
    },
	
	'jvgrootveld/telescope-zoxide',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	config = function()
		require('telescope').load_extension('zoxide')
	end,	

    vim.keymap.set("n", "<leader>fz", ":Telescope zoxide list<CR>"),
	
	vim.keymap.set("n", "<leader>fd", function()
		require("my.telescope_folder_picker")()
	end, { desc = "Telescope Folder Bookmarks" }),

    vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {}),
    vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {}),
    vim.keymap.set("n", '<leader>fw', require("telescope.builtin").grep_string, { desc = "Find word under cursor" }),
    vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {}),
    vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {}),
    vim.keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {}),
    --keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, {}),
    vim.keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {}),
    vim.keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end),
    vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=~ <CR>")
}
