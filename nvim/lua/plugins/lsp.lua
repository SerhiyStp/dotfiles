local util = require("lspconfig.util")

-- Helper: enable inlay hints safely
local function enable_inlay_hints(client, bufnr)
    if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


-- Shared on_attach (NEW API)
local on_attach = function(args)
    local client = args.client
    local bufnr = args.buf

    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Toggle inlay hints
    vim.keymap.set("n", "<leader>th", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
    end, { desc = "Toggle inlay hints", buffer = bufnr })

    enable_inlay_hints(client, bufnr)


end


-- Python
-- vim.lsp.config("pyright", {
--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "strict",
--             },
--         },
--     },
--     on_attach = on_attach,
-- })
vim.lsp.config("pyright", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                -- Inlay hint controls
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                    callArgumentNames = "partial", -- "none" | "partial" | "all"
                },

                -- Reduce false positives
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly",
            },
        },
    },
})
vim.lsp.enable("pyright")

-- Fortran
vim.lsp.config("fortls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        fortls = {
            -- source_dirs = { "src", "modules" },
            -- implicit_typing = false,
            -- Core diagnostics
            diagnostics = true,
            incremental_sync = true,

            -- Inlay hints (verbosity control)
            hover_signature = true,
            hover_language = "fortran",

            -- Reduce noise if needed
            disable_autoupdate = true,
            max_line_length = 120,

            -- Optional: be explicit
            use_signature_help = true,
        },
    },
})
vim.lsp.enable("fortls")

-- LaTeX
vim.lsp.config("texlab", {
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable("texlab")

-- R
-- vim.lsp.config("r_language_server", {
--     on_attach = on_attach,
-- })
-- vim.lsp.enable("r_language_server")

-- MATLAB (manual server)
vim.lsp.config("matlab_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "matlab-language-server", "--stdio" },
    filetypes = { "matlab" },
    root_dir = util.root_pattern(".git"),
})
vim.lsp.enable("matlab_ls")

