require("nvim-treesitter.config").setup({
    ensure_installed = { "c", "fortran", "cpp", "python", "lua", "javascript", "markdown" },
    highlight = { enable = true },
    indent = { enable = true },
})

