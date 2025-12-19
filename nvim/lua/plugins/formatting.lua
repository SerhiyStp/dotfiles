local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python   = { "black" },
        fortran  = { "fprettify" },
        tex      = { "latexindent" },
        latex    = { "latexindent" },
    },
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        conform.format({ bufnr = args.buf, timeout_ms = 2000 })
    end,
})

