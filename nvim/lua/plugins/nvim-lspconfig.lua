
return {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        { 'williamboman/mason.nvim', version = "^1.0.0" },
        { 'williamboman/mason-lspconfig.nvim', version = "^1.0.0" },
        { 'j-hui/fidget.nvim', opts = {} },
        { 'folke/neodev.nvim' },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "fortls",
                "lua_ls",
                "lemminx",
                "marksman",
                "quick_lint_js",
                "gradle_ls",
                "groovyls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        })

        local lspconfig = require('lspconfig')
        lspconfig.fortls.setup({
            cmd = {
                "fortls",
                "--hover_signature",
                "--hover_language=fortran",
                "--use_signature_help"
            },
            settings = {
                completions = {
                    completeFunctionCalls = true
                }
            }
        })

        vim.keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
        vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
        vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
        vim.keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
        vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
        vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
        vim.keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
        vim.keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
        vim.keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
        vim.keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
        vim.keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
        vim.keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
        vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

    end
}
