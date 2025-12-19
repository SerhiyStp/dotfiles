-- Fortran: Tree-sitter folding is incomplete → use indent folding
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fortran",
    callback = function()
        vim.opt_local.foldmethod = "indent"
        vim.opt_local.foldlevel = 99
        vim.opt_local.foldenable = false
    end,
})

