require("core.options")
require("core.plugins_lazy")
require("core.keymaps")


-- Good: runs after filetype is set
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.textwidth = 0
        vim.opt_local.wrap = false
        vim.opt_local.formatoptions:remove({ "t", "c", "a" })
    end,
})
