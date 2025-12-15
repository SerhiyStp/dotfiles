-- Set leader key to space
--vim.g.mapleader = " "
vim.g.mapleader = ","

local keymap = vim.keymap

-- General keymaps
keymap.set("n", ";", ":")
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk 
keymap.set("i", "ii", "<ESC>") -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- Nvim-dap
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

keymap.set({ "i", "s" }, "<C-f>", function() require'luasnip'.jump(1) end, { desc = "LuaSnip forward jump" })
-- keymap.set({ "i", "s" }, "<S-b>", function() require'luasnip'.jump(-1) end, { desc = "LuaSnip backward jump" })

keymap.set("n", "<leader>cd", ":cd %:p:h<CR> :pwd<CR>")
keymap.set("n", "<leader>rn", ":set invrelativenumber<CR>")

keymap.set("v", '<', '<gv')
keymap.set("v", '>', '>gv')

-- Better indentation
-- vim.cmd([[
-- 	vnoremap < <gv 
-- 	vnoremap > >gv
-- ]])

-- zoxide
-- keymap.set("n", "<leader>zn", function()
--     require("my.zoxide_nvimtree").zoxide_nvim_tree()
-- end, { desc = "Zoxide + NvimTree" })
vim.keymap.set('n', '<leader>zn', function()
    require('my.zoxide_neotree').open_zoxide_with_neotree()
end, { desc = "Zoxide to NeoTree" })

keymap.set("n", "<leader>za", function()
    local dir = vim.fn.getcwd()
    vim.cmd("!zoxide add " .. dir)
    print("Added to zoxide: " .. dir)
end, { desc = "Add current folder to zoxide" })

keymap.set("n", "<leader>zA", function()
    local input = vim.fn.input("Add which folder to zoxide? ", vim.fn.getcwd())
    if input ~= "" then
        vim.cmd("!zoxide add " .. input)
        print("Added to zoxide: " .. input)
    end
end, { desc = "Add custom folder to zoxide" })
