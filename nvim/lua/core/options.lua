local opt = vim.opt

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- Line Wrapping
opt.wrap = false
opt.textwidth = 0
opt.wrapmargin = 0

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard:append("unnamedplus")
opt.clipboard = "unnamedplus"

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
--opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

vim.cmd([[ 	
    if exists(':GuiFont')
        -- GuiFont! Source Code Pro
        GuiFont! JetBrains Mono
    endif
]])

if vim.g.neovide then
    -- vim.o.guifont = "Source Code Pro:h12"
    vim.o.guifont = "JetBrains Mono:h12"
end

--opt.guifont = { "Source Code Pro", "h10" }
--opt.guifont = { "Hack NFM", "h12" }

opt.swapfile = false
opt.backup = false

vim.o.autoread = true
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    -- command = "if mode() != 'c' | checktime | endif",
    -- pattern = { "*" },
-- })

opt.virtualedit = "block"

-- This has to be set before initializing lazy
vim.g.mapleader = ","

-- Better indentation
-- vim.cmd([[
-- 	vnoremap < <gv 
-- 	vnoremap > >gv
-- ]])
--

opt.diffopt:append("algorithm:patience")
opt.diffopt:append("indent-heuristic")
