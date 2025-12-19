-- setup
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    term_colors = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        lualine = true,
        treesitter = true,
        which_key = true,
    },
})

-- set colorscheme
vim.cmd.colorscheme("catppuccin")

