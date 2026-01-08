 vim.notify("init.lua loaded", vim.log.levels.WARN)

require("core.options")
require("core.keymaps")
require("core.autocmds")

pcall(require, "core.local")
-- load Lazy.nvim
require("plugins")




