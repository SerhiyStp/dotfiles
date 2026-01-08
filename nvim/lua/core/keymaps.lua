vim.g.mapleader = ","
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR> :pwd<CR>")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Close current buffer
vim.keymap.set("n", "<leader>bc", ":BufferLineClose<CR>", { noremap = true, silent = true })

-- Neotree
vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", {})

-- Folding
vim.keymap.set("n", "za", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "zR", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "zM", "zM", { desc = "Close all folds" })

vim.keymap.set("n", "<space>", "za")

--local keymap = vim.keymap 
--vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle <CR>', { noremap = true})
--vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFind <CR>', { noremap = true})
--vim.api.nvim_set_keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true})
--
-- Telescope
--keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
--keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
--keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
--keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
--keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
--keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
--keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, {})
--keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
--keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end)
--keymap.set("n", "<leader>fe", ":Telescope file_browser path=~ <CR>")


