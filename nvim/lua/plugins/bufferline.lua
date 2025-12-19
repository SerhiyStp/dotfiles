local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        numbers = "buffer_id",            -- show buffer numbers (can also be "ordinal" or "buffer_id")
        close_command = "bdelete! %d", -- command to close a buffer
        right_mouse_command = "bdelete! %d",
        left_trunc_marker = "<",
        right_trunc_marker = ">",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",   -- show LSP diagnostics on buffers
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center",
            },
        },
        show_buffer_close_icons = true,
        show_close_icon = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    },
})

