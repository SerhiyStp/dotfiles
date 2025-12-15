return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',

    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>"),
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>"),
    vim.keymap.set("n", "<silent> gb", ":BufferLinePick<CR>"),
    vim.keymap.set("n", "<silent> gD", ":BufferLinePickClose<CR>"),
    vim.keymap.set("n", "<silent> be", ":BufferLineSortByExtension<CR>"),
    vim.keymap.set("n", "<silent> bd", ":BufferLineSortByDirectory<CR>"),

    config = function()
        require("bufferline").setup()
    end
}
