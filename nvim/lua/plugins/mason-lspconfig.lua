require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",             -- Python
        "fortls",              -- Fortran
        "texlab",              -- LaTeX
    },
})

