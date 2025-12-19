-- bootstrap Lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugin setup
require("lazy").setup({
    { "nvim-treesitter/nvim-treesitter", config = function() require("plugins.treesitter") end },
    { "nvim-telescope/telescope.nvim", config = function() require("plugins.telescope") end },
    { "nvim-lualine/lualine.nvim", config = function() require("plugins.lualine") end },
    { "catppuccin/nvim", name = "catppuccin", config = function() require("plugins.catppuccin") end },

    -- Bufferline
    {
       "akinsho/bufferline.nvim",
       version = "*",  -- use latest stable
       dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but recommended
       event = "BufReadPost", -- lazy-load after first buffer is read
       config = function()
           require("plugins.bufferline")
       end,
    },

    -- Lualine (lazy-load on buffer read)
    {
       "nvim-lualine/lualine.nvim",
       dependencies = { "nvim-tree/nvim-web-devicons" },
       event = "BufRead",
       config = function()
           require("plugins.lualine")
       end,
    },

    -- Neo-tree (lazy-load on command or file explorer open)
    {
       "nvim-neo-tree/neo-tree.nvim",
       branch = "v3.x",
       dependencies = {
           "nvim-lua/plenary.nvim",
           "nvim-tree/nvim-web-devicons",
           "MunifTanjim/nui.nvim",
       },
       cmd = "Neotree",
       config = function()
           require("plugins.neotree")
       end,
    },

    -- Mason (LSP server installer)
    {
       "williamboman/mason.nvim",
       build = ":MasonUpdate",
       config = function()
           require("plugins.mason")
       end,
    },

    {
       "williamboman/mason-lspconfig.nvim",
       dependencies = { "williamboman/mason.nvim" },
       config = function()
           require("plugins.mason-lspconfig")
       end,
    },

    -- LSP core
    {
       "neovim/nvim-lspconfig",
       dependencies = { "williamboman/mason-lspconfig.nvim" },
       ft = {
           "python",
           "fortran",
           "tex",
           "latex",
           "r",
           "matlab",
       },
       config = function()
           require("plugins.lsp")
       end,
    },

    -- Autocompletion
    {
       "hrsh7th/nvim-cmp",
       dependencies = {
           "hrsh7th/cmp-nvim-lsp",
           "L3MON4D3/LuaSnip",
           "saadparwaiz1/cmp_luasnip",
           "hrsh7th/cmp-nvim-lsp",
           "hrsh7th/cmp-buffer",
           "hrsh7th/cmp-path",
           "rafamadriz/friendly-snippets",
       },
       event = "InsertEnter",
       config = function()
           require("plugins.completion")
       end,
    },

    -- Formatting
    {
       "stevearc/conform.nvim",
       event = "BufWritePre",
       config = function()
           require("plugins.formatting")
       end,
    },


    -- add more plugins here
})

