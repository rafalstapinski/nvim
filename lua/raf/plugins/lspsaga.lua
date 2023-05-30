require("lspsaga").setup({
    symbol_in_winbar = {
        enable = true,
        separator = " > ",
        ignore_patterns={},
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
    },
})

vim.wo.winbar = require('lspsaga.symbolwinbar'):get_winbar()
