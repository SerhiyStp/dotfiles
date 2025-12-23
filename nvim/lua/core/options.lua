-- Make line numbers default
vim.wo.number = true

-- vim.g.python_host_prog = '/usr/bin/python3'
-- vim.g.python3_host_prog = '/usr/bin/python3'

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME")
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"
--
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--vim.opt.foldenable = false   -- do not auto-fold on open
vim.opt.foldlevel = 99       -- open everything by default

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h11"
end

