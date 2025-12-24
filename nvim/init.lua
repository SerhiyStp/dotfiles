require("core.options")
require("core.keymaps")
require("core.autocmds")

pcall(require, "core.local")
-- load Lazy.nvim
require("plugins")

-- vim.o.exrc = true
-- vim.o.secure = true


