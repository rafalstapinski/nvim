local function window()
    return vim.api.nvim_win_get_number(0)
end

local function lsp_name()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return "no lsp"
    end

    local buffer_filetype = vim.api.nvim_buf_get_option(0, "filetype")

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buffer_filetype) ~= -1 then
            return client.name
        end
    end
end

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "sonokai",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { lsp_name, "fileformat", "filetype" },
        -- lualine_y = { "progress", "coc#util#version", "" },
        -- lualina_x = {"mode" = {"diagnostics", sources = {"coc"}}},
        -- lualine_y = {'coc#status', 'b:coc_current_function'},
        lualine_y = { window },
        lualine_z = { "location" }
    },
    -- inactive_sections = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = {"filename"},
    --   lualine_x = {"location"},
    --   lualine_y = {},
    --   lualine_z = {}
    -- },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
